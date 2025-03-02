import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:soundscape/core/theme/theme_extensions/color_palette.dart';
import 'package:soundscape/src/features/home_screen/widgets/custom_menu_button.dart';
import '../../../core/constant/spacing.dart';
import '../../common_widgets/background_widget.dart';
import '../../common_widgets/search_card.dart';
import '../../common_widgets/upgrade_lock_card.dart';
import '../../provider/search_provider.dart';
import 'widgets/category_menu_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
          child: Column(
        children: [
          Gap(AppSpacing.screenHeight(context) * 0.07),
          Consumer<SearchProvider>(
            builder: (context, provider, child) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.pagePadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    provider.isOpen
                        ? const SizedBox()
                        : const UpgradeLockCard(),
                    const SearchCard(),
                  ],
                ),
              );
            },
          ),
          Gap(AppSpacing.screenHeight(context) * 0.125),
          CustomMenuButton(),
          Container(
            color: AppColors.primaryColor,
            child: Column(
              children: [
                Gap(AppSpacing.screenHeight(context) * 0.01),
                CategoryMenu(),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
