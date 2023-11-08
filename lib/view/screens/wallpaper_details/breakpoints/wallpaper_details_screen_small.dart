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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: Get.width * 0.07),
            DetailsAppbarWidget(),
            OriginalImageWidget(wallpaper: args?.wallpaper),
            SizedBox(height: Get.width * 0.03),
            WallpaperDetailsWidget(wallpaper: args?.wallpaper),
          ],
        ),
      ),
    );
  }
}
