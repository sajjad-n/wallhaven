import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../helper/constants/constants.dart';
import '../../../../helper/utils/utils.dart';
import '../../../../translations/translations.dart';
import '../../../widgets/widgets.dart';

class SplashScreenSmall extends StatelessWidget {
  const SplashScreenSmall({super.key});

  @override
  Widget build(BuildContext context) {
    context.theme;

    return Scaffold(
      body: GradiantBackgroundWidget(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AssetsConst.logo,
              width: Get.height * 0.2,
            ),
            SizedBox(height: Get.height * 0.01),
            Text(
              SplashTranslations.appName.tr,
              textScaleFactor: textScaleFactor,
              style: Get.textTheme.titleLarge,
            ),
          ],
        ),
      ),
    );
  }
}
