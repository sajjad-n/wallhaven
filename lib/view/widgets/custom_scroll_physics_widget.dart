import 'package:flutter/material.dart';

class CustomScrollPhysics extends ScrollBehavior {
  const CustomScrollPhysics();

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    switch (getPlatform(context)) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
      case TargetPlatform.android:
        return const BouncingScrollPhysics();
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
      default:
        return const BouncingScrollPhysics();
    }
  }
}
