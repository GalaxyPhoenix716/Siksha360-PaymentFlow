import 'package:flutter/material.dart';
import 'package:siksha360_task/core/constants/colors.dart';
import 'app_text_theme.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.backgroundLight,
      colorScheme: const ColorScheme.light(
        surface: AppColors.cardLight,
        primary: AppColors.primaryAccentLight,
        onPrimary: Colors.white,
        onSurface: AppColors.textPrimaryLight,
      ),
      textTheme: AppTextTheme.getLightTextTheme(
        AppColors.textPrimaryLight,
        AppColors.textSecondaryLight,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.textPrimaryLight),
        titleTextStyle: TextStyle(
          color: AppColors.textPrimaryLight,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.backgroundDark,
      colorScheme: const ColorScheme.dark(
        surface: AppColors.cardDark,
        primary: AppColors.primaryAccentDark,
        onPrimary: Colors.white,
        onSurface: AppColors.textPrimaryDark,
      ),
      textTheme: AppTextTheme.getDarkTextTheme(
        AppColors.textPrimaryDark,
        AppColors.textSecondaryDark,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.textPrimaryDark),
        titleTextStyle: TextStyle(
          color: AppColors.textPrimaryDark,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
