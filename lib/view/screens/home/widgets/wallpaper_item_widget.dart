import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/models/models.dart';

class WallpaperItemWidget extends StatelessWidget {
  final Wallpaper? wallpaper;

  const WallpaperItemWidget({super.key, this.wallpaper});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.width * 0.25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Get.width * 0.03),
      ),
      clipBehavior: Clip.antiAlias,
    );
  }
}
