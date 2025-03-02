import 'package:flutter/material.dart';
import 'package:soundscape/core/constant/spacing.dart';
import '../theme_extensions/color_palette.dart';

class AppInputDecorationTheme {
  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    contentPadding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.pagePadding, vertical: 5),
    prefixIconColor: AppColors.whiteColor,
    filled: true,
    fillColor: AppColors.primaryColor.withOpacity(0.4),
    labelStyle: TextStyle(color: AppColors.whiteColor.withOpacity(0.30)),
    hintStyle: TextStyle(color: AppColors.whiteColor.withOpacity(0.30)),
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(10),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(10),
    ),
    disabledBorder: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(10),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(10),
    ),
  );
}
