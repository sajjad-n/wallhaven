import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../helper/constants/constants.dart';

class DetailsAppbarWidget extends StatelessWidget {
  const DetailsAppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: Get.back,
      icon: SvgPicture.asset(
        AssetsConst.arrowLeft,
        width: Get.width * 0.07,
        color: Colors.white,
      ),
    );
  }
}
