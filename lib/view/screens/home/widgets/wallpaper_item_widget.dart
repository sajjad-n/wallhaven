import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../controllers/controllers.dart';
import '../../../../data/models/models.dart';
import '../../../../helper/constants/constants.dart';
import '../../../../helper/utils/utils.dart';

class WallpaperItemWidget extends StatelessWidget {
  final Wallpaper? wallpaper;
  final ThumbnailTypes thumbnailType;

  const WallpaperItemWidget({
    super.key,
    this.wallpaper,
    this.thumbnailType = ThumbnailTypes.original,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.width * 0.25,
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
            )
          : GetX<WallpaperController>(
              init: WallpaperController(),
              tag: wallpaper?.id,
              initState: (_) => _.controller!.loadWallpaper(
                wallpaper: wallpaper,
                thumbnailType: thumbnailType,
              ),
              autoRemove: false,
              builder: (_) => _.isLoading.value
                  ? Image.asset(AssetsConst.placeHolder)
                  : _.wallpaperFile == null
                      ? SvgPicture.asset(AssetsConst.placeHolder)
                      : Image.file(_.wallpaperFile!),
            ),
    );
  }
}
