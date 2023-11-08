import 'dart:io';

import 'package:path_provider/path_provider.dart';

import '../../data/models/models.dart';
import '../constants/constants.dart';

Future<String> generateTempPath(ThumbnailTypes type) async {
  final tempDirectory = await getTemporaryDirectory();
  final path = '${tempDirectory.path}/${type.path}';
  if (!(await Directory(path).exists())) {
    await Directory(path).create(recursive: true);
  }
  return path;
}

Future<File?> getCachedWallpaper({
  required String? fileName,
  required ThumbnailTypes thumbnailType,
}) async {
  if (fileName == null) return null;

  final tempPath = await generateTempPath(thumbnailType);
  final filePath = '$tempPath/$fileName';

  if (await File(filePath).exists()) return File(filePath);
}

String generateDownloadUrlByType({
  required Wallpaper? wallpaper,
  required ThumbnailTypes thumbnailType,
}) {
  if (thumbnailType == ThumbnailTypes.large) {
    return wallpaper?.thumbs?.large ?? '';
  } else if (thumbnailType == ThumbnailTypes.small) {
    return wallpaper?.thumbs?.small ?? '';
  } else {
    return wallpaper?.path ?? '';
  }
}
