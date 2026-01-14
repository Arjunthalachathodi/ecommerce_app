import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ecommerce_app/application/core/theme/colors.dart';
import 'package:ecommerce_app/application/core/theme/text_styles.dart';
import 'package:ecommerce_app/application/core/utils/enums.dart';

class AppTheme {
  static ThemeData getTheme(AppThemeMode mode) {
    switch (mode) {
      case AppThemeMode.dark:
        return _darkTheme;
      case AppThemeMode.light:
        return _lightTheme;
    }
  }

  static ThemeData get _lightTheme => ThemeData(
        scaffoldBackgroundColor: ColorResources.white,
        textTheme: const TextTheme(
          bodyMedium: baseTestStyle,
          headlineSmall: baseHeadingStyle,
        ),
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
          ),
        ),
      );
  static ThemeData get _darkTheme => ThemeData(
        scaffoldBackgroundColor: const Color(0xFF191B20),
        textTheme: const TextTheme(
          bodyMedium: baseTestStyle,
          headlineSmall: baseHeadingStyle,
        ),
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
          ),
        ),
      );
  static ThemeData get _premiumTheme => ThemeData(
        scaffoldBackgroundColor: const Color(0xFF211D1D),
        textTheme: const TextTheme(
          bodyMedium: baseTestStyle,
          headlineSmall: baseHeadingStyle,
        ),
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
          ),
        ),
      );































}
