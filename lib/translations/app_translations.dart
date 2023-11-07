import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'translations.dart';

class AppTranslation extends Translations {
  static Locale get locale => const Locale('en', 'US');

  final enUS = <String, String>{};

  AppTranslation() {
    // Init en_US translations
    enUS.addAll(GeneralTranslations.enUS);
    enUS.addAll(UnknownTranslations.enUS);
    enUS.addAll(SplashTranslations.enUS);
    enUS.addAll(HomeTranslations.enUS);
  }

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS,
      };
}
