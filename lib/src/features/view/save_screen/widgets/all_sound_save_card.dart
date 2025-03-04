import 'package:flutter_svg/svg.dart';

import '../../../../../core/theme/theme_extensions/color_palette.dart';
import '../../../../provider/audio_provider.dart';
import 'package:flutter/material.dart';

class AllSoundSaveCard extends StatelessWidget {
  final AudioProvider audioProvider;
  final String mixName;
  const AllSoundSaveCard(
      {super.key, required this.audioProvider, required this.mixName});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: audioProvider.getMixSoundImages(mixName),
      builder: (context, snapshot) {
        int maxVisibleItems = 8;

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const SizedBox();
        }
        List<String> images = snapshot.data!;
        bool hasExtra = images.length > maxVisibleItems;
        int extraCount = images.length - maxVisibleItems + 1;
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, // 4 icons per row
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: maxVisibleItems,
          itemBuilder: (context, index) {
            if (hasExtra && index == maxVisibleItems - 1) {
              return _buildExtraItem(extraCount);
            } else {
              if (images.length > index) {
                return _buildIcon(images[index]);
              } else {
                return _blankIcon();
              }
            }
          },
        );
      },
    );
  }

  Container _blankIcon() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.secondaryColorWithWhite8Percent(AppColors.secondaryColor),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  Widget _buildIcon(String imagePath) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.whiteColor.withOpacity(0.08),
        borderRadius: BorderRadius.circular(12),
      ),
      child: SvgPicture.asset(
        imagePath,
        color: Colors.white,
      ),
    );
  }

  // "+X" Indicator
  Widget _buildExtraItem(int extraCount) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.whiteColor.withOpacity(0.08),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        "+$extraCount",
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
