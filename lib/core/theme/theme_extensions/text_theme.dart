import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'color_palette.dart';

class AppTextThemes {
  static TextTheme lightTextTheme = TextTheme(
    titleLarge: const TextStyle(
      fontFamily: 'SF_UI_Display',
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: AppColors.whiteColor,
    ),
    headlineLarge: const TextStyle(
      fontFamily: 'SF_UI_Display',
      fontSize: 22,
      color: AppColors.whiteColor,
    ),
    headlineMedium: const TextStyle(
      fontFamily: 'SF_UI_Display',
      fontSize: 20,
      color: AppColors.whiteColor,
    ),
    bodyLarge: const TextStyle(
      fontFamily: 'SF_UI_Display',
      fontSize: 18,
      color: AppColors.whiteColor,
    ),
    bodyMedium: const TextStyle(
      fontFamily: 'SF_UI_Display',
      fontSize: 16,
        color: AppColors.whiteColor,
    ),
    bodySmall: const TextStyle(
      fontFamily: 'SF_UI_Display',
      fontSize: 14,
      color: AppColors.whiteColor,
    ),
    labelLarge: const TextStyle(
      fontFamily: 'SF_UI_Display',
      fontSize: 12,
      color: AppColors.whiteColor,
    ),
    labelMedium: GoogleFonts.roboto(
      textStyle: const TextStyle(
        fontSize: 10,
        color: AppColors.whiteColor,
      ),
    ),
    labelSmall: const TextStyle(
      fontFamily: 'SF_UI_Display',
      fontSize: 8,
      color: AppColors.whiteColor,
    ),
  );
}
