import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helper/utils/utils.dart';
import '../../translations/translations.dart';

class RequestErrorWidget extends StatelessWidget {
  final String? message;
  final VoidCallback? onRetry;

  const RequestErrorWidget({super.key, this.message, this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Get.width * 0.03),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              message ?? '',
              textScaleFactor: textScaleFactor,
              textAlign: TextAlign.center,
              style: Get.textTheme.bodyLarge,
            ),
            TextButton(
              onPressed: onRetry,
              child: Text(
                GeneralTranslations.retry.tr,
                textScaleFactor: textScaleFactor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
