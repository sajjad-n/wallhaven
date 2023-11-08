import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/models/models.dart';
import '../../../../data/models/nav_args/nav_args.dart';
import '../../../../helper/constants/constants.dart';
import '../../../../routes/routes.dart';
import '../home.dart';

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

    Future.delayed(const Duration(milliseconds: 100), () {
      if (mounted) setState(() => _animate = true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClicked,
      child: AnimatedOpacity(
        opacity: _animate ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 500),
        child: AnimatedSlide(
          offset: _animate ? Offset.zero : const Offset(0.0, 2.0),
          duration: const Duration(milliseconds: 500),
          child: Stack(
            children: [
              SmallImageWidget(
                wallpaper: widget.wallpaper,
                thumbnailType: widget.thumbnailType,
                fit: BoxFit.cover,
              ),
              Positioned(
                right: 0.0,
                left: 0.0,
                bottom: 0.0,
                child: ImageCaptionWidget(wallpaper: widget.wallpaper),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onClicked() {
    final args = WallpaperDetailsArguments(wallpaper: widget.wallpaper);
    Get.toNamed(AppRoutes.wallpaperDetails, arguments: args);
  }
}
