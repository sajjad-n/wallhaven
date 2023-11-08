import 'dart:async';
import 'dart:io';

import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';

import '../data/models/models.dart';
import '../helper/constants/constants.dart';
import '../helper/utils/utils.dart';
import '../services/details_service.dart';
import '../services/services.dart';
import '../translations/translations.dart';

class WallpaperController extends GetxController {
  final downloadService = DownloadService();

  final isLoading = false.obs;
  final isLoadingDetails = false.obs;
  final errorMessage = Rxn<String>();
  final downloadProgress = Rxn<double>();

  File? wallpaperFile;
  Details? details;

  Future<void> loadWallpaper({
    Wallpaper? wallpaper,
    required ThumbnailTypes thumbnailType,
  }) async {
    if (wallpaper == null) return;

    isLoading.value = true;

    final fileName = wallpaper.path?.split('/').last;
    wallpaperFile = await getCachedWallpaper(
        fileName: fileName, thumbnailType: thumbnailType);

    if (wallpaperFile == null) {
      final tempPath = await generateTempPath(thumbnailType);
      final filePath = '$tempPath/$fileName';
      final url = generateDownloadUrlByType(
          wallpaper: wallpaper, thumbnailType: thumbnailType);

      try {
        final path = await downloadService.download(
          url: url,
          downloadDirectory: filePath,
        );

        wallpaperFile = File(path);
      } catch (e) {
        printLog(e);
      }
    }
    isLoading.value = false;
  }

  Future<void> fetchWallpaperDetails(String? id) async {
    if (id == null) return;

    isLoadingDetails.value = true;
    errorMessage.value = null;

    try {
      final response = await DetailsService().details(id: id);

      if (response.schema?.error == null) {
        details = response.details;
      } else {
        throw Exception(response.schema?.error);
      }
    } catch (e) {
      if (e is TimeoutException) {
        errorMessage.value = e.message;
      } else if (e is SocketException) {
        errorMessage.value = e.message;
      } else {
        errorMessage.value = e.toString();
      }
    }

    isLoadingDetails.value = false;
  }

  Future<void> saveWallpaper(String? url) async {
    if (url == null || downloadProgress.value != null) return;

    downloadProgress.value = 0.0;

    try {
      if (GetPlatform.isWeb) {
        await launchUrlIntent(Uri.parse(url));
      } else {
        if ((await Permission.storage.request()).isGranted) {
          await downloadWallpaper(url);
        } else {
          showSnackBar(
            message: GeneralTranslations.permissionNotGranted.tr,
            style: SnackBarStyles.error,
          );
        }
      }
    } catch (e) {
      if (e is TimeoutException) {
        showSnackBar(message: e.message, style: SnackBarStyles.error);
      } else if (e is SocketException) {
        showSnackBar(message: e.message, style: SnackBarStyles.error);
      } else {
        showSnackBar(message: e.toString(), style: SnackBarStyles.error);
      }
    }

    downloadProgress.value = null;
  }

  Future<void> downloadWallpaper(String url) async {
    final fileName = url.split('/').last;
    final downloadPath = await generateDownloadDirPath(fileName: fileName);

    final path = await downloadService.download(
      url: url,
      downloadDirectory: downloadPath ?? '',
      onProgress: (sent, total) => downloadProgress.value = sent / total,
    );

    if (GetPlatform.isIOS) await Share.shareXFiles([XFile(path)]);

    showSnackBar(
      message: GeneralTranslations.wallpaperDownloaded.tr,
      style: SnackBarStyles.successful,
    );
  }

  void cancelDownload() {
    downloadService.cancelDownload();
    downloadProgress.value = null;
  }
}
