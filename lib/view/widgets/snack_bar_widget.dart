import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helper/utils/utils.dart';

class SnackBarWidget extends StatelessWidget {
  final String? message;

  const SnackBarWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(Get.width * 0.02),
      ),
      child: Padding(
        padding: EdgeInsets.all(Get.width * 0.03),
        child: Row(
          children: [
            Icon(
              Icons.error_outline,
              color: Get.theme.colorScheme.onPrimary,
            ),
            SizedBox(width: Get.width * 0.02),
            Expanded(
              child: Text(
                message ?? '',
                textScaleFactor: textScaleFactor,
                style: Get.textTheme.titleMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
