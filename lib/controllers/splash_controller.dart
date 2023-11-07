import 'package:get/get.dart';

import '../routes/routes.dart';

class SplashController extends GetxController {
  @override
  Future<void> onInit() async {
    super.onInit();

    await Future.delayed(const Duration(seconds: 2));

    Get.offNamed(AppRoutes.home);
  }
}
