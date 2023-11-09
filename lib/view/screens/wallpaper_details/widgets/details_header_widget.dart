import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/models/models.dart';
import '../../../../helper/utils/utils.dart';
import '../../../../translations/translations.dart';
import '../../../theme/theme.dart';

class DetailsHeaderWidget extends StatelessWidget {
  final Details? details;

  const DetailsHeaderWidget({super.key, this.details});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                  details?.uploader?.avatar?.s200px ?? '',
                ),
                backgroundColor: AppColors.violetBlue,
                radius: Get.height * 0.035,
              ),
              SizedBox(width: Get.height * 0.01),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      WallpaperDetailsTranslations.uploaderUsername.trParams({
                        'username': details?.uploader?.username ?? '',
                      }),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textScaleFactor: textScaleFactor,
                      style: Get.textTheme.titleMedium,
                    ),
                    Text(
                      details?.uploader?.group ?? '',
                      textScaleFactor: textScaleFactor,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Get.textTheme.titleSmall,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(width: Get.height * 0.01),
        Text(
          formatBytes(details?.fileSize ?? 0),
          textScaleFactor: textScaleFactor,
          style: Get.textTheme.titleMedium,
        )
      ],
    );
  }
}
