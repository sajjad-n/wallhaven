import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/controllers.dart';
import '../../../../helper/constants/constants.dart';
import '../../../../helper/utils/utils.dart';
import '../../../../translations/translations.dart';
import '../../../widgets/widgets.dart';
import '../home.dart';

class HomeScreenLarge extends StatelessWidget {
  const HomeScreenLarge({super.key});

  @override
  Widget build(BuildContext context) {
    context.theme;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: Get.width * 0.07,
        centerTitle: true,
        title: Text(
          HomeTranslations.explore.tr,
          textScaleFactor: textScaleFactor,
          style: Get.textTheme.titleSmall,
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
                          child: GridView.builder(
                            controller: _.scrollController,
                            itemCount: _.wallpapers.length,
                            padding: EdgeInsets.all(Get.width * 0.03),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: Get.width * 0.03,
                              crossAxisSpacing: Get.width * 0.03,
                            ),
                            itemBuilder: (context, index) {
                              return WallpaperItemWidget(
                                wallpaper: _.wallpapers[index],
                                thumbnailType: ThumbnailTypes.large,
                              );
                            },
                          ),
                        ),
                        LoadingMoreWidget(visible: _.isLoadingMore.value),
                      ],
                    );
        },
      ),
    );
  }
}
