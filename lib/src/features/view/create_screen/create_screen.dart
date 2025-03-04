import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import '../../../../core/constant/spacing.dart';
import '../../../../core/theme/theme_extensions/color_palette.dart';
import '../../../common_widgets/background_widget.dart';
import '../../../common_widgets/custom_floating_button.dart';
import 'widgets/search_card.dart';
import '../../../common_widgets/upgrade_lock_card.dart';
import '../../../provider/menu_button_provider.dart';
import '../../../provider/search_provider.dart';
import '../save_screen/save_screen.dart';
import 'widgets/category_menu_widget.dart';
import 'widgets/custom_menu_button.dart';
import 'widgets/sound_items.dart';

class CreateScreen extends StatelessWidget {
  const CreateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final menuProvider = context.watch<MenuButtonProvider>();
    return Scaffold(
      body: BackgroundWidget(
          child: SingleChildScrollView(
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
                const CustomMenuButton(),
                menuProvider.selectedTab == "Sounds" ?Container(
                  color: AppColors.primaryColor,
                  child: Column(
                    children: [
                      Gap(AppSpacing.screenHeight(context) * 0.01),
                      CategoryMenu(),
                      const SoundItems()
                    ],
                  ),
                ):Container(
                  color: AppColors.primaryColor,
                  height: AppSpacing.screenHeight(context)*0.65,
                  child: const SaveScreen(),)
              ],
            ),
          )),
      floatingActionButton: const CustomFloatingButton(),
    );
  }
}
