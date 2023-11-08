import 'package:get/get.dart';

import '../controllers/controllers.dart';

class WallpaperDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<WallpaperController>(WallpaperController());
  }
}
