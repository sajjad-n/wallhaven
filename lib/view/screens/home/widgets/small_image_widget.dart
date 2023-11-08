import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/controllers.dart';
import '../../../../data/models/models.dart';
import '../../../../helper/constants/constants.dart';
import '../../../../helper/utils/utils.dart';

class SmallImageWidget extends StatelessWidget {
  final Wallpaper? wallpaper;
  final ThumbnailTypes thumbnailType;
  final BoxFit? fit;

  const SmallImageWidget({
    super.key,
    this.wallpaper,
    this.thumbnailType = ThumbnailTypes.original,
    this.fit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.width * 0.45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Get.width * 0.03),
      ),
      clipBehavior: Clip.antiAlias,
      child: GetPlatform.isWeb
          ? FadeInImage.assetNetwork(
              placeholder: AssetsConst.placeHolder,
              image: generateDownloadUrlByType(
                wallpaper: wallpaper,
                thumbnailType: thumbnailType,
              ),
              fit: BoxFit.cover,
            )
          : GetX<WallpaperController>(
              init: WallpaperController(),
              tag: UniqueKey().toString(),
              initState: (_) => _.controller!.loadWallpaper(
                wallpaper: wallpaper,
                thumbnailType: thumbnailType,
              ),
              builder: (_) => _.isLoading.value || _.wallpaperFile == null
                  ? Image.asset(AssetsConst.placeHolder, fit: BoxFit.cover)
                  : FadeInImage(
                      placeholder: AssetImage(AssetsConst.placeHolder),
                      image: FileImage(_.wallpaperFile!),
                      fit: BoxFit.cover,
                    ),
            ),
    );
  }
}
