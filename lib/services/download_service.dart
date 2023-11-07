import '../data/providers/providers.dart';
import '../helper/constants/constants.dart';

class DownloadService {
  late HttpProvider httpProvider;

  DownloadService() {
    httpProvider = HttpProvider();
  }

  Future<String> download({
    required String url,
    required String downloadDirectory,
    void Function(int sent, int total)? onProgress,
  }) async {
    final response = await httpProvider.downloadFile(
      url: url,
      downloadDirectory: downloadDirectory,
      onDownloadProgress: onProgress,
    );

    return response;
  }

  void cancelDownload() {
    httpProvider.cancelDownload();
  }
}
