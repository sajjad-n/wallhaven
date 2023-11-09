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
        centerTitle: true,
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
                  : ListView.separated(
                      shrinkWrap: true,
                      controller: _.scrollController,
                      itemCount: _.wallpapers.length,
                      padding: EdgeInsets.all(Get.height * 0.02),
                      itemBuilder: (context, index) {
                        final isLastItem = index == _.wallpapers.length - 1;

                        return Column(
                          children: [
                            WallpaperItemWidget(
                              wallpaper: _.wallpapers[index],
                              thumbnailType: ThumbnailTypes.small,
                            ),
                            LoadingMoreWidget(
                              visible: _.isLoadingMore.value && isLastItem,
                            ),
                          ],
                        );
                      },
                      separatorBuilder: (context, index) =>
                          SizedBox(height: Get.height * 0.02),
                    );
        },
      ),
    );
  }
}
