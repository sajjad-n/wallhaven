import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/models/models.dart';
import '../../../../helper/utils/utils.dart';
import '../../../../translations/translations.dart';

class ImageCaptionWidget extends StatelessWidget {
  final Wallpaper? wallpaper;

  const ImageCaptionWidget({super.key, this.wallpaper});

  @override
  Widget build(BuildContext context) {
    return Container(
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
              'count': wallpaper?.favorites.toString() ?? '',
            }),
            textScaleFactor: textScaleFactor,
            style: Get.textTheme.titleMedium,
          ),
          Text(
            HomeTranslations.viewCount.trParams({
              'count': wallpaper?.views.toString() ?? '',
            }),
            textScaleFactor: textScaleFactor,
            style: Get.textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
