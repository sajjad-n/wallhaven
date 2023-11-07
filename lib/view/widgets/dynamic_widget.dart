import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../helper/constants/constants.dart';

class DynamicWidget extends StatelessWidget {
  final Widget Function() smallScreen;
  final Widget Function() largeScreen;

  const DynamicWidget({
    super.key,
    required this.smallScreen,
    required this.largeScreen,
  });

  bool get _isSmallScreen => Get.width <= GeneralConst.smallScreenMaxWidth;

  @override
  Widget build(BuildContext context) {
    context.theme;

    return GestureDetector(
      onTap: () => Get.focusScope?.unfocus(),
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (_isSmallScreen) {
            return smallScreen();
          } else {
            return largeScreen();
          }
        },
      ),
    );
  }
}
