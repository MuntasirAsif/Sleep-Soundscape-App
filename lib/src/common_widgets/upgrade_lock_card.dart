import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import '../../core/constant/icons.dart';
import '../../core/constant/spacing.dart';
import '../../core/constant/text.dart';
import '../../core/theme/theme_extensions/color_palette.dart';

class UpgradeLockCard extends StatelessWidget {
  const UpgradeLockCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.pagePadding,vertical: AppSpacing.pagePadding*0.5),
      decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(0.4),
          borderRadius: BorderRadius.circular(12)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SvgPicture.asset(AppIcons.upgradeLock),
          const Gap(10),
          const Text(AppTexts.upgrade)
        ],
      ),
    );
  }
}