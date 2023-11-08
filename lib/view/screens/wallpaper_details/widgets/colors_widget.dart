import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../helper/extensions/extensions.dart';
import '../../../../helper/utils/utils.dart';

class ColorsWidget extends StatelessWidget {
  final List<String>? colors;

  const ColorsWidget({super.key, this.colors});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.width * 0.08,
      child: ListView.separated(
        itemCount: colors?.length ?? 0,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Container(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.03),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Get.width * 0.03),
            color: colors![index].toColor,
          ),
          child: Center(
            child: Text(
              colors![index],
              textScaleFactor: textScaleFactor,
              style: Get.textTheme.bodyLarge,
            ),
          ),
        ),
        separatorBuilder: (context, index) => SizedBox(width: Get.width * 0.03),
      ),
    );
  }
}
