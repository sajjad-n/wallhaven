import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/nav_args/nav_args.dart';
import '../../widgets/widgets.dart';
import 'wallpaper_details.dart';

class WallpaperDetailsScreen extends StatelessWidget {
  const WallpaperDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final WallpaperDetailsArguments? args = Get.arguments;

    return DynamicWidget(
      smallScreen: () => WallpaperDetailsScreenSmall(args: args),
      largeScreen: () => WallpaperDetailsScreenLarge(args: args),
    );
  }
}
