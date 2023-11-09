import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/controllers.dart';
import '../../../../data/models/models.dart';
import '../../../../helper/constants/constants.dart';
import '../../../../helper/utils/utils.dart';
import '../../../widgets/widgets.dart';

class OriginalImageWidget extends StatelessWidget {
  final Wallpaper? wallpaper;

  const OriginalImageWidget({super.key, this.wallpaper});

  @override
  Widget build(BuildContext context) {
    return GetPlatform.isWeb
        ? Stack(
            children: [
              LoadingWidget(),
              Image.network(
                generateDownloadUrlByType(
                  wallpaper: wallpaper,
                  thumbnailType: ThumbnailTypes.original,
                ),
                width: Get.width,
                height: Get.height,
                fit: BoxFit.cover,
              ),
            ],
          )
        : GetX<WallpaperController>(
            init: WallpaperController(),
            tag: UniqueKey().toString(),
            initState: (_) => _.controller!.loadWallpaper(
              wallpaper: wallpaper,
              thumbnailType: ThumbnailTypes.original,
            ),
            builder: (_) => Stack(
              fit: StackFit.expand,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: _.isLoading.value || _.wallpaperFile == null
                      ? LoadingWidget()
                      : const SizedBox(),
                ),
                AnimatedScale(
                  scale:
                      _.isLoading.value || _.wallpaperFile == null ? 0.0 : 1.0,
                  duration: const Duration(milliseconds: 300),
                  child: _.isLoading.value || _.wallpaperFile == null
                      ? const SizedBox()
                      : Image.file(
                          _.wallpaperFile!,
                          width: Get.width,
                          height: Get.height,
                          fit: BoxFit.cover,
                        ),
                ),
              ],
            ),
          );
  }
}
