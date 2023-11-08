import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallhaven/translations/translations.dart';
import 'package:wallhaven/view/screens/wallpaper_details/widgets/download_button_widget.dart';

import '../../../../controllers/controllers.dart';
import '../../../../data/models/models.dart';
import '../../../widgets/widgets.dart';
import '../wallpaper_details.dart';

class WallpaperDetailsWidget extends StatelessWidget {
  final Wallpaper? wallpaper;

  const WallpaperDetailsWidget({super.key, this.wallpaper});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.width * 0.75,
      padding: EdgeInsets.symmetric(
        horizontal: Get.width * 0.03,
        vertical: Get.width * 0.05,
      ),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Get.width * 0.07),
        color: Colors.black,
      ),
      child: GetX<WallpaperController>(
        initState: (_) => _.controller!.fetchWallpaperDetails(wallpaper?.id),
        builder: (_) {
          return _.isLoadingDetails.value
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
                          SizedBox(height: Get.width * 0.05),
                          Divider(),
                          SizedBox(height: Get.width * 0.03),
                          ColorsWidget(colors: _.details?.colors),
                          SizedBox(height: Get.width * 0.03),
                          TagsWidget(tags: _.details?.tags),
                          SizedBox(height: Get.width * 0.03),
                          Divider(),
                          SizedBox(height: Get.width * 0.03),
                          DownloadButtonWidget(
                            label: WallpaperDetailsTranslations.download.tr,
                            progress: _.downloadProgress.value,
                            onDownload: () =>
                                _.saveWallpaper(_.details?.path),
                            onCancel: _.cancelDownload,
                          ),
                        ],
                      ),
                    );
        },
      ),
    );
  }
}
