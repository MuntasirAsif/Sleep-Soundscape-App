import 'package:flutter/material.dart';
import 'package:soundscape/core/constant/images.dart';
import 'package:soundscape/core/constant/spacing.dart';

class BackgroundWidget extends StatelessWidget {
  final Widget child;
  final String backgroundImage;

  const BackgroundWidget({
    super.key,
    required this.child,
    this.backgroundImage = AppImages.backgroundImage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Image.asset(
              height: AppSpacing.screenHeight(context),
              width: AppSpacing.screenWidth(context),
              backgroundImage,
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
          ),
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.2),
            ),
          ),
          child, // Main content goes on top
        ],
      ),
    );
  }
}
