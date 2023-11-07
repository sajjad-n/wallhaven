import 'dart:async';
import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../helper/constants/constants.dart';
import '../../helper/utils/utils.dart';
import '../../translations/translations.dart';

class HttpProvider {
  final _baseUrl = Uri(scheme: 'https', host: 'wallhaven.cc');
  final _header = {
    HttpHeaders.acceptHeader: 'application/json',
    HttpHeaders.contentTypeHeader: 'application/json',
  };

  late http.Client _httpClient;
  late File _downloadingFile;
  late RandomAccessFile _downloadingRaf;
  late StreamSubscription<List<int>>? _downloadingSubscription;
  late Completer<String> _downloadingCompleter;

  HttpProvider() {
    _httpClient = http.Client();
  }

  Future<String> get({
    required String path,
    String? token,
    Map<String, dynamic>? queryParams,
  }) async {
    final uri = _baseUrl.replace(path: path, queryParameters: queryParams);
    printLog('---Request URL---\n${uri.toString()}');

    _header[HttpHeaders.authorizationHeader] = 'Bearer $token';
    printLog('---Request Header---\n$_header');

    http.Response response;
    try {
      response = await _httpClient
          .get(
            uri,
            headers: _header,
          )
          .timeout(
            GeneralConst.requestTimeOut,
            onTimeout: () => throw TimeoutException(
              GeneralTranslations.requestTimeOut.tr,
              GeneralConst.requestTimeOut,
            ),
          );
    } on SocketException catch (_) {
      throw SocketException(GeneralTranslations.noInternetConnection.tr);
    }

    var responseBody = response.body;
    printLog('---Request Response---\n$responseBody');

    return responseBody;
  }

  Future<String> downloadFile({
    required String url,
    required String downloadDirectory,
    String? token,
    void Function(int sentBytes, int totalBytes)? onDownloadProgress,
  }) async {
    final uri = Uri.parse(url);
    printLog('---Download URL---\n${uri.toString()}');

    var response;
    _downloadingCompleter = Completer<String>();
    try {
      final httpClient = HttpClient();
      final request = await httpClient.getUrl(uri);

      request.headers
          .add(HttpHeaders.contentTypeHeader, "application/octet-stream");
      request.headers.add(HttpHeaders.acceptHeader, 'application/json');
      request.headers.add(HttpHeaders.authorizationHeader, 'Bearer $token');
      printLog('---Download Request Header---\n${request.headers}');

      final httpResponse = await request.close();

      int byteCount = 0;
      int totalBytes = httpResponse.contentLength;

      _downloadingFile = File(downloadDirectory);
      _downloadingRaf = _downloadingFile.openSync(mode: FileMode.write);

      _downloadingSubscription = httpResponse.listen(
        (data) {
          byteCount += data.length;

          _downloadingRaf.writeFromSync(data);

          if (onDownloadProgress != null) {
            onDownloadProgress(byteCount, totalBytes);
          }
        },
        onDone: () {
          _downloadingRaf.closeSync();

          _downloadingCompleter.complete(_downloadingFile.path);
        },
        onError: (e) {
          _downloadingRaf.closeSync();
          _downloadingFile.deleteSync();
          _downloadingCompleter.completeError(e);
        },
        cancelOnError: true,
      );
    } on SocketException catch (_) {
      throw SocketException(GeneralTranslations.noInternetConnection.tr);
    }

    response = await _downloadingCompleter.future;
    printLog('---Download Result---\n$response');

    return response;
  }

  void cancelDownload() {
    _downloadingSubscription?.cancel();
    _downloadingRaf.closeSync();
    _downloadingFile.deleteSync();
    _downloadingCompleter.completeError('Download cancelled');
  }
}
