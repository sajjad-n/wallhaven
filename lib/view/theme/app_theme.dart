import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'theme.dart';

abstract class AppTheme {
  // Light Theme
  static ThemeData get lightTheme {
    final ThemeData base = ThemeData.light();

    return base.copyWith();
  }

  // Dark Theme
  static ThemeData get darkTheme {
    final ThemeData base = ThemeData.dark();

    return base.copyWith(
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.black,
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontFamily: AppFonts.nunito,
          color: Colors.white,
        ),
        displayMedium: TextStyle(
          fontFamily: AppFonts.nunito,
          color: Colors.white,
        ),
        displaySmall: TextStyle(
          fontFamily: AppFonts.nunito,
          color: Colors.white,
        ),
        headlineLarge: TextStyle(
          fontFamily: AppFonts.nunito,
          color: Colors.white,
        ),
        headlineMedium: TextStyle(
          fontFamily: AppFonts.nunito,
          color: Colors.white,
        ),
        headlineSmall: TextStyle(
          fontFamily: AppFonts.nunito,
          color: Colors.white,
        ),
        titleLarge: TextStyle(
          fontFamily: AppFonts.nunito,
          color: Colors.white,
        ),
        titleMedium: TextStyle(
          fontFamily: AppFonts.nunito,
          color: Colors.white,
        ),
        titleSmall: TextStyle(
          fontFamily: AppFonts.nunito,
          color: Colors.white,
        ),
        labelLarge: TextStyle(
          fontFamily: AppFonts.nunito,
          color: Colors.white,
        ),
        labelMedium: TextStyle(
          fontFamily: AppFonts.nunito,
          color: Colors.white,
        ),
        labelSmall: TextStyle(
          fontFamily: AppFonts.nunito,
          color: Colors.white,
        ),
        bodyLarge: TextStyle(
          fontFamily: AppFonts.nunito,
          color: Colors.white,
        ),
        bodyMedium: TextStyle(
          fontFamily: AppFonts.nunito,
          color: Colors.white,
        ),
        bodySmall: TextStyle(
          fontFamily: AppFonts.nunito,
          color: Colors.white,
        ),
      ),
      appBarTheme: const AppBarTheme(
        color: Colors.transparent,
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: Colors.white,
      ),
      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            EdgeInsets.all(Get.width * 0.05),
          ),
        ),
      ),
      dividerTheme: DividerThemeData(
        color: Colors.white.withOpacity(0.4),
        space: 0.0,
        indent: Get.width * 0.03,
        endIndent: Get.width * 0.03,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith(
            (states) {
              if (states.contains(MaterialState.disabled)) {
                return Colors.grey;
              } else {
                return AppColors.violetBlue;
              }
            },
          ),
          padding: MaterialStateProperty.all(EdgeInsets.zero),
          elevation: MaterialStateProperty.all(0.0),
        ),
      ),
    );
  }
}
