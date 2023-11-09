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
        toolbarHeight: Get.height * 0.1,
        centerTitle: true,
        title: Text(
          HomeTranslations.explore.tr,
          textScaleFactor: textScaleFactor,
          style: Get.textTheme.headlineSmall,
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
                            padding: EdgeInsets.all(Get.height * 0.03),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisExtent: Get.height * 0.25,
                              mainAxisSpacing: Get.height * 0.03,
                              crossAxisSpacing: Get.height * 0.03,
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
