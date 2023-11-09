import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/models/nav_args/nav_args.dart';
import '../../../widgets/widgets.dart';
import '../wallpaper_details.dart';

class WallpaperDetailsScreenSmall extends StatelessWidget {
  final WallpaperDetailsArguments? args;

  const WallpaperDetailsScreenSmall({super.key, this.args});

  @override
  Widget build(BuildContext context) {
    context.theme;

    return Scaffold(
      body: GradiantBackgroundWidget(
        child: Stack(
          children: [
            Positioned(
              child: OriginalImageWidget(wallpaper: args?.wallpaper),
            ),
            Positioned(
              top: Get.height * 0.04,
              left: Get.height * 0.01,
              child: DetailsAppbarWidget(),
            ),
            Positioned(
              bottom: Get.height * 0.01,
              right: Get.height * 0.01,
              left: Get.height * 0.01,
              child: WallpaperDetailsWidget(wallpaper: args?.wallpaper),
            ),
          ],
        ),
      ),
    );
  }
}
