import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/controllers.dart';
import '../../../../data/models/models.dart';
import '../../../../translations/translations.dart';
import '../../../widgets/widgets.dart';
import '../wallpaper_details.dart';

class WallpaperDetailsWidget extends StatelessWidget {
  final Wallpaper? wallpaper;
  final bool smallScreen;

  const WallpaperDetailsWidget({
    super.key,
    this.wallpaper,
    this.smallScreen = true,
  });

  @override
  Widget build(BuildContext context) {
    return GetX<WallpaperController>(
      initState: (_) => _.controller!.fetchWallpaperDetails(wallpaper?.id),
      builder: (_) {
        return AnimatedContainer(
          width: smallScreen ? Get.width : Get.width * 0.3,
          height:
              _.isLoadingDetails.value ? Get.height * 0.07 : Get.height * 0.38,
          duration: const Duration(milliseconds: 300),
          padding: EdgeInsets.all(Get.height * 0.02),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Get.height * 0.05),
            color: Colors.black.withOpacity(0.4),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 30.0, sigmaY: 30.0),
            child: _.isLoadingDetails.value
                ? LoadingWidget()
                : _.errorMessage.value != null
                    ? RequestErrorWidget(
                        message: _.errorMessage.value,
                        onRetry: () => _.fetchWallpaperDetails(wallpaper?.id),
                      )
                    : SingleChildScrollView(
                        child: Column(
                          children: [
                            DetailsHeaderWidget(details: _.details),
                            SizedBox(height: Get.height * 0.02),
                            Divider(),
                            SizedBox(height: Get.height * 0.02),
                            ColorsWidget(colors: _.details?.colors),
                            SizedBox(height: Get.height * 0.02),
                            TagsWidget(tags: _.details?.tags),
                            SizedBox(height: Get.height * 0.02),
                            Divider(),
                            SizedBox(height: Get.height * 0.02),
                            DownloadButtonWidget(
                              label: WallpaperDetailsTranslations.download.tr,
                              progress: _.downloadProgress.value,
                              onDownload: () =>
                                  _.saveWallpaper(_.details?.path),
                              onCancel: _.cancelDownload,
                            ),
                          ],
                        ),
                      ),
          ),
        );
      },
    );
  }
}
