import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wallhaven/helper/constants/asset_const.dart';

import '../../../../data/models/models.dart';
import '../../../../helper/utils/utils.dart';

class TagsWidget extends StatelessWidget {
  final List<Tag>? tags;

  const TagsWidget({super.key, this.tags});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.04,
      child: ListView.separated(
        itemCount: tags?.length ?? 0,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Container(
          padding: EdgeInsets.symmetric(horizontal:  Get.height * 0.01),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Get.height * 0.015),
            color: Colors.grey,
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                AssetsConst.tagRight,
                width: Get.height * 0.025,
                color: Colors.white,
              ),
              SizedBox(width: Get.height * 0.01),
              Text(
                tags![index].category ?? '',
                textScaleFactor: textScaleFactor,
                style: Get.textTheme.bodyLarge,
              ),
            ],
          ),
        ),
        separatorBuilder: (context, index) => SizedBox(width: Get.height * 0.01),
      ),
    );
  }
}
