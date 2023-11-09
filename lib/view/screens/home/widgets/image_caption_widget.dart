import 'dart:ui';

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
      padding: EdgeInsets.all( Get.height * 0.007),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(Get.height * 0.02),
          bottomLeft: Radius.circular(Get.height * 0.02),
        ),
        color: Colors.black.withOpacity(0.1),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
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
      ),
    );
  }
}
