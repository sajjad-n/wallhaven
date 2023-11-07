import 'package:get/get.dart';

import '../bindings/bindings.dart';
import '../view/screens/screens.dart';
import 'routes.dart';

abstract class AppScreens {
  static final screens = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
  ];

  static GetPage get getUnknownScreen => GetPage(
        name: AppRoutes.unknown,
        page: () => const UnknownScreen(),
      );
}
