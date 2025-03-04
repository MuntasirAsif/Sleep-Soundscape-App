
import 'package:flutter/material.dart';

class AppColors{
  static const Color backgroundColor = Color(0xff09001F);
  static const Color primaryColor = Color(0xff09001F);
  static const Color secondaryColor = Color(0xff020725);
  static const Color floatingButtonBg = Color(0xffD3B7EB);
  static const Color selectedWidgetBorder = Color(0xff793BC4);


  static const whiteColor = Color(0xffffffff);
  static const blackColor = Color(0xff000000);

  static const List<Color> gradiantButton = [Color(0xFF42098F), Color(0xFFB53FFE  )];
  static Color secondaryColorWithWhite8Percent(Color baseColor) {
    final whiteOverlay = whiteColor.withOpacity(0.08);
    return Color.alphaBlend(whiteOverlay, baseColor);
  }
}
