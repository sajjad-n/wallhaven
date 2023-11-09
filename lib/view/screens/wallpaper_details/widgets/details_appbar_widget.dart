import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../helper/constants/constants.dart';

class DetailsAppbarWidget extends StatelessWidget {
  const DetailsAppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.black.withOpacity(0.4),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 30.0, sigmaY: 30.0),
        child: IconButton(
          onPressed: Get.back,
          icon: SvgPicture.asset(
            AssetsConst.arrowLeft,
            width: Get.height * 0.03,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
