import 'package:flutter/material.dart';
import 'dart:math';

class CustomWaveProgressIndicator extends StatefulWidget {
  final double value;
  final List<Color> gradientColors;
  final double waveHeight;
  final double speed;

  const CustomWaveProgressIndicator({
    super.key,
    required this.value,
    required this.gradientColors,
    this.waveHeight = 10.0,
    this.speed = 1.0,
  });

  @override
  State<CustomWaveProgressIndicator> createState() => _CustomWaveProgressIndicatorState();
}

class _CustomWaveProgressIndicatorState extends State<CustomWaveProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: (2000 ~/ widget.speed)),
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return CustomPaint(
          painter: _WavePainter(
            progress: widget.value,
            waveHeight: widget.waveHeight,
            animationValue: _animationController.value,
            gradientColors: widget.gradientColors,
          ),
          child: Container(),
        );
      },
    );
  }
}

class _WavePainter extends CustomPainter {
  final double progress;
  final double waveHeight;
  final double animationValue;
  final List<Color> gradientColors;

  _WavePainter({
    required this.progress,
    required this.waveHeight,
    required this.animationValue,
    required this.gradientColors,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..shader = LinearGradient(
        colors: gradientColors,
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.fill;

    double baseHeight = size.height * (1 - progress);
    Path path = Path();
    path.moveTo(0, baseHeight);

    for (double i = 0; i <= size.width; i++) {
      double wave = sin((i / size.width * 2 * pi) + (animationValue * 2 * pi));
      double y = baseHeight + wave * waveHeight;
      path.lineTo(i, y);
    }

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
