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
}
