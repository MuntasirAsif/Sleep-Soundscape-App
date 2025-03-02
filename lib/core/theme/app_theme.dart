import 'package:flutter/material.dart';
import 'package:soundscape/core/theme/theme_part/input_decoration_theme.dart';
import 'theme_extensions/color_palette.dart';
import 'theme_extensions/text_theme.dart';

class AppTheme {
  AppTheme._();
  static ThemeData lightTheme = ThemeData(
      primaryColor: AppColors.primaryColor,
      brightness: Brightness.light,
      textTheme: AppTextThemes.lightTextTheme,
      scaffoldBackgroundColor: AppColors.backgroundColor,
      inputDecorationTheme:AppInputDecorationTheme.lightInputDecorationTheme
  );
}