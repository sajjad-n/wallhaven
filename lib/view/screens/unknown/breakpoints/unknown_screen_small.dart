import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../helper/utils/utils.dart';
import '../../../../translations/translations.dart';
import '../../../widgets/widgets.dart';

class UnknownScreenSmall extends StatelessWidget {
  const UnknownScreenSmall({super.key});

  @override
  Widget build(BuildContext context) {
    context.theme;

    return Scaffold(
      body: GradiantBackgroundWidget(
        child: Center(
          child: Text(
            UnknownTranslations.screenNotFound.tr,
            textScaleFactor: textScaleFactor,
            style: Get.textTheme.titleLarge,
          ),
        ),
      ),
    );
  }
}
