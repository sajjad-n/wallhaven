import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/widgets.dart';

class LoadingMoreWidget extends StatelessWidget {
  final bool visible;

  const LoadingMoreWidget({super.key, this.visible = true});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: Get.width * 0.04),
        child: LoadingWidget(),
      ),
    );
  }
}
