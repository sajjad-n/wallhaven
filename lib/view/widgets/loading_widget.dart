import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: Get.height * 0.03,
        height: Get.height * 0.03,
        child: CircularProgressIndicator(strokeWidth: Get.height * 0.005),
      ),
    );
  }
}
