import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: Get.width * 0.05,
        height: Get.width * 0.05,
        child: CircularProgressIndicator(strokeWidth: Get.width * 0.007),
      ),
    );
  }
}
