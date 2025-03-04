import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:soundscape/core/constant/icons.dart';
import '../../core/theme/theme_extensions/color_palette.dart';
import '../provider/bottom_nav_provider.dart';

class BottomBarWidget extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const BottomBarWidget({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar:
          Consumer<BottomNavProvider>(builder: (context, provider, child) {
        return provider.isBottomSheetOpen
            ? const SizedBox.shrink() // Hide BottomNavBar
            : BottomNavigationBar(
                currentIndex: navigationShell.currentIndex,
                onTap: (index) => navigationShell.goBranch(index),
                type: BottomNavigationBarType.fixed,
                backgroundColor: AppColors.backgroundColor,
                selectedItemColor: AppColors.whiteColor,
                unselectedItemColor: AppColors.whiteColor.withOpacity(0.45),
                selectedLabelStyle: textTheme.labelMedium,
                unselectedLabelStyle: textTheme.labelMedium,
                items: [
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(navigationShell.currentIndex == 0
                          ? AppIcons.activeHomeIcon
                          : AppIcons.homeIcon),
                      label: "Home"),
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(navigationShell.currentIndex == 1
                          ? AppIcons.activeLibraryIcon
                          : AppIcons.libraryIcon),
                      label: "Library"),
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(navigationShell.currentIndex == 2
                          ? AppIcons.activeCreateIcon
                          : AppIcons.createIcon),
                      label: "Create"),
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(navigationShell.currentIndex == 3
                          ? AppIcons.activeAlarmIcon
                          : AppIcons.alarmIcon),
                      label: "Alarm"),
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(navigationShell.currentIndex == 4
                          ? AppIcons.activeAwardIcon
                          : AppIcons.awardIcon),
                      label: "Award"),
                ],
              );
      }),
    );
  }
}
