import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:soundscape/core/constant/text.dart';
import '../../core/constant/icons.dart';
import '../../core/theme/theme_extensions/color_palette.dart';
import '../../src/provider/audio_provider.dart';
import 'open_mix_sheet.dart';
import 'play_pause_button.dart';

class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AudioProvider>(
      builder: (context, audioProvider, child) {
        return audioProvider.soundList.isEmpty
            ? const SizedBox()
            : Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 44,
                  width: 168,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      color: AppColors.floatingButtonBg.withOpacity(0.2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const PlayPauseButton(),
                          InkWell(
                              onTap: () {
                                openMixSheet(AppTexts.your,context,false);
                              },
                              child: SvgPicture.asset(AppIcons.settings)),
                          SvgPicture.asset(AppIcons.heardAdd),
                          SvgPicture.asset(AppIcons.closeCircle),
                        ],
                      ),
                    ),
                  ),
                ),
              );
      },
    );
  }
}
