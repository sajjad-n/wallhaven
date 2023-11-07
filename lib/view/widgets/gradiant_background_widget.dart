import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/theme.dart';

class GradiantBackgroundWidget extends StatelessWidget {
  final Widget? child;

  const GradiantBackgroundWidget({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[AppColors.violetBlue, Colors.black],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: child,
    );
  }
}
