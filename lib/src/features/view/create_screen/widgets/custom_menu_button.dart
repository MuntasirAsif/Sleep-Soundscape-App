import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soundscape/core/constant/spacing.dart';
import 'package:soundscape/core/theme/theme_extensions/color_palette.dart';
import '../../../../provider/menu_button_provider.dart';

class CustomMenuButton extends StatefulWidget {
  const CustomMenuButton({super.key});

  @override
  _CustomMenuButtonState createState() => _CustomMenuButtonState();
}

class _CustomMenuButtonState extends State<CustomMenuButton> {
  String selectedTab = "Sounds";

  @override
  Widget build(BuildContext context) {
    final menuProvider = context.watch<MenuButtonProvider>();
    return Container(
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Stack(
        children: [
          // Animated Background for Selected Tab
          Align(
            alignment: menuProvider.selectedTab == "Sounds" ? Alignment.centerLeft : Alignment.centerRight,
            child: CustomPaint(
              size: Size(MediaQuery.of(context).size.width * 0.50, 55),
              painter: SelectedTabPainter(),
            ),
          ),
          Align(
            alignment: menuProvider.selectedTab != "Sounds" ? Alignment.centerLeft : Alignment.centerRight,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.50,
              height: 55,
              color: AppColors.primaryColor,
            ),
          ),
          // Tab Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildTab("Sounds", menuProvider.selectedTab == "Sounds"),
              _buildTab("Saved", menuProvider.selectedTab == "Saved"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTab(String text, bool isSelected) {
    return GestureDetector(
      onTap: () {
        context.read<MenuButtonProvider>().selectTab(text);
      },
      child: Container(
        height: 35,
        width: AppSpacing.screenWidth(context)*0.38,
        decoration: BoxDecoration(
          gradient: isSelected
              ? const LinearGradient(
            colors: AppColors.gradiantButton,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )
              : null,
          color: isSelected ? null : AppColors.primaryColor,
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class SelectedTabPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = AppColors.primaryColor
      ..style = PaintingStyle.fill;

    Path path = Path()..moveTo(0, 0);

    // Left side curve
    path.quadraticBezierTo(16, size.height * 0.01, 17, size.height * 0.20);
    path.lineTo(17, size.height * 0.45);
    path.quadraticBezierTo(18, size.height - 11, 30, size.height - 10);

    // Bottom straight line
    path.lineTo(size.width - 30, size.height - 10);

    // Right side (Mirrored left curve)
    path.quadraticBezierTo(size.width - 18, size.height - 11, size.width - 17, size.height * 0.45);
    path.lineTo(size.width - 17, size.height * 0.20);
    path.quadraticBezierTo(size.width - 16, size.height * 0.01, size.width, 0);

    // Closing path
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

