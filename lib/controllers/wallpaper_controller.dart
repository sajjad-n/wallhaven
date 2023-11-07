import 'dart:io';

import 'package:get/get.dart';

import '../data/models/models.dart';
import '../helper/constants/constants.dart';
import '../helper/utils/utils.dart';
import '../services/services.dart';

class WallpaperController extends GetxController {
  final isLoading = false.obs;

  late File? wallpaperFile;

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
        final path = await DownloadService().download(
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
}
