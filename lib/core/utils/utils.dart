import 'package:flutter/material.dart';
import 'package:soundscape/core/theme/theme_extensions/color_palette.dart';

class Utils{
  void toastMessage(BuildContext context ,String message){
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            message,
            textAlign: TextAlign.center,
          ),
          duration: const Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          backgroundColor: AppColors.secondaryColorWithWhite8Percent(AppColors.secondaryColor),
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        ));
  }
}