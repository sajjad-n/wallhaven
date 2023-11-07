import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'routes/routes.dart';
import 'translations/translations.dart';
import 'view/theme/theme.dart';
import 'view/widgets/widgets.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const Wallhaven());
}

class Wallhaven extends StatelessWidget {
  const Wallhaven({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: AppTranslation(),
      locale: AppTranslation.locale,
      themeMode: ThemeMode.dark,
      darkTheme: AppTheme.darkTheme,
      initialRoute: AppRoutes.splash,
      getPages: AppScreens.screens,
      defaultTransition: Transition.fadeIn,
      unknownRoute: AppScreens.getUnknownScreen,
      builder: (context, widget) => ScrollConfiguration(
        behavior: const CustomScrollPhysics(),
        child: widget!,
      ),
    );
  }
}
