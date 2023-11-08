import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/controllers.dart';
import '../../../../data/models/models.dart';
import '../../../../helper/constants/constants.dart';
import '../../../../helper/utils/utils.dart';
import '../../../../translations/translations.dart';

class WallpaperItemWidget extends StatefulWidget {
  final Wallpaper? wallpaper;
  final ThumbnailTypes thumbnailType;

  const WallpaperItemWidget({
    super.key,
    this.wallpaper,
    this.thumbnailType = ThumbnailTypes.original,
  });

  @override
  State<WallpaperItemWidget> createState() => _WallpaperItemWidgetState();
}

class _WallpaperItemWidgetState extends State<WallpaperItemWidget>
    with AutomaticKeepAliveClientMixin {
  bool _animate = false;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

    Future.delayed(GeneralConst.startAnimDelay, () {
      setState(() {
        _animate = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _animate ? 1.0 : 0.0,
      duration: GeneralConst.listItemAnimDuration,
      child: AnimatedPadding(
        padding: _animate
            ? EdgeInsets.symmetric(horizontal: Get.width * 0.03)
            : EdgeInsets.symmetric(
                horizontal: Get.width * 0.03,
                vertical: Get.width * 0.3,
              ),
        duration: GeneralConst.listItemAnimDuration,
        child: Stack(
          children: [
            Container(
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
                        wallpaper: widget.wallpaper,
                        thumbnailType: widget.thumbnailType,
                      ),
                      fit: BoxFit.cover,
                    )
                  : GetX<WallpaperController>(
                      init: WallpaperController(),
                      tag: widget.wallpaper?.id,
                      initState: (_) => _.controller!.loadWallpaper(
                        wallpaper: widget.wallpaper,
                        thumbnailType: widget.thumbnailType,
                      ),
                      autoRemove: false,
                      builder: (_) => _.isLoading.value ||
                              _.wallpaperFile == null
                          ? Image.asset(
                              AssetsConst.placeHolder,
                              fit: BoxFit.cover,
                            )
                          : FadeInImage(
                              placeholder: AssetImage(AssetsConst.placeHolder),
                              image: FileImage(_.wallpaperFile!),
                              fit: BoxFit.cover,
                            ),
                    ),
            ),
            Positioned(
              right: 0.0,
              left: 0.0,
              bottom: 0.0,
              child: Container(
                height: Get.width * 0.15,
                padding: EdgeInsets.symmetric(horizontal: Get.width * 0.03),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.black, Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      HomeTranslations.likeCount.trParams({
                        'count': widget.wallpaper?.favorites.toString() ?? '',
                      }),
                      textScaleFactor: textScaleFactor,
                      style: Get.textTheme.titleMedium,
                    ),
                    Text(
                      HomeTranslations.viewCount.trParams({
                        'count': widget.wallpaper?.views.toString() ?? '',
                      }),
                      textScaleFactor: textScaleFactor,
                      style: Get.textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
