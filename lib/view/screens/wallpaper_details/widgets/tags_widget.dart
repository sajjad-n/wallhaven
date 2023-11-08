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
      height: Get.width * 0.08,
      child: ListView.separated(
        itemCount: tags?.length ?? 0,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Container(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.03),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Get.width * 0.03),
            color: Colors.grey,
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                AssetsConst.tagRight,
                width: Get.width * 0.05,
                color: Colors.white,
              ),
              Text(
                tags![index].category ?? '',
                textScaleFactor: textScaleFactor,
                style: Get.textTheme.bodyLarge,
              ),
            ],
          ),
        ),
        separatorBuilder: (context, index) => SizedBox(width: Get.width * 0.03),
      ),
    );
  }
}
