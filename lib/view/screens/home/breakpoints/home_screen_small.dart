import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/controllers.dart';
import '../../../../helper/constants/constants.dart';
import '../../../../helper/utils/utils.dart';
import '../../../../translations/translations.dart';
import '../../../widgets/widgets.dart';
import '../home.dart';

class HomeScreenSmall extends StatelessWidget {
  const HomeScreenSmall({super.key});

  @override
  Widget build(BuildContext context) {
    context.theme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          HomeTranslations.explore.tr,
          textScaleFactor: textScaleFactor,
          style: Get.textTheme.titleLarge,
        ),
      ),
      body: GetX<HomeController>(
        builder: (_) {
          return _.isLoading.value
              ? LoadingWidget()
              : _.errorMessage.value != null
                  ? RequestErrorWidget(
                      message: _.errorMessage.value,
                      onRetry: _.fetchData,
                    )
                  : Column(
                      children: [
                        Expanded(
                          child: ListView.separated(
                            itemCount: _.wallpapers.length,
                            itemBuilder: (context, index) =>
                                WallpaperItemWidget(
                              wallpaper: _.wallpapers[index],
                              thumbnailType: ThumbnailTypes.small,
                            ),
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 1),
                          ),
                        ),
                      ],
                    );
        },
      ),
    );
  }
}
