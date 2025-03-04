import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:soundscape/core/constant/icons.dart';
import 'package:soundscape/core/theme/theme_extensions/color_palette.dart';
import 'package:soundscape/src/features/model/sound_model.dart';
import 'package:soundscape/src/provider/audio_provider.dart';

import '../../core/constant/text.dart';
import '../../core/utils/utils.dart';
import 'custom_wave_progress_indicator.dart';

class SoundCard extends StatelessWidget {
  const SoundCard({super.key, required this.sound});

  final SoundModel sound;
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Consumer<AudioProvider>(builder: (context, audioProvider, child) {
      return InkWell(
        onTap: () {
          sound.isPremium
              ? Utils().toastMessage(context, AppTexts.upgradePlan)
              : audioProvider.addSound(context, sound);
        },
        child: SizedBox(
          height: 90,
          width: 72,
          child: Column(
            children: [
              Container(
                height: 72,
                width: 72,
                margin: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: audioProvider.isAddedToMix(sound)
                            ? AppColors.selectedWidgetBorder
                            : AppColors.whiteColor.withOpacity(0.08),
                        width: 1),
                    borderRadius: BorderRadius.circular(24)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(23),
                  child: Stack(
                    children: [
                      audioProvider.isAddedToMix(sound)
                          ? CustomWaveProgressIndicator(
                              value: audioProvider.getVolume(sound),
                              gradientColors: AppColors.gradiantButton,
                              waveHeight: 5.0,
                              speed: 1,
                            )
                          : const SizedBox(),
                      Center(
                        child: SizedBox(
                            height: 32,
                            width: 32,
                            child: SvgPicture.asset(
                              sound.imageUrl == ''
                                  ? getIcon(
                                      sound.category,
                                    )
                                  : sound.imageUrl,
                              color: audioProvider.isAddedToMix(sound)
                                  ? AppColors.whiteColor
                                  : AppColors.secondaryColor.withOpacity(0.85),
                            )),
                      ),
                      sound.isPremium
                          ? Positioned(
                              top: 0,
                              right: 0,
                              child: Container(
                                height: 28,
                                width: 28,
                                padding: const EdgeInsets.all(9),
                                decoration: BoxDecoration(
                                    color:
                                        AppColors.whiteColor.withOpacity(0.08),
                                    borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(24))),
                                child: SvgPicture.asset(
                                  AppIcons.upgradeLock,
                                  color: AppColors.whiteColor.withOpacity(0.65),
                                ),
                              ),
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 72,
                child: Text(
                  sound.name,
                  style: textTheme.bodySmall!
                      .copyWith(color: AppColors.whiteColor.withOpacity(0.65)),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  String getIcon(String category) {
    switch (category.toLowerCase()) {
      case 'rain':
        return AppIcons.rain;
      case 'water':
        return AppIcons.water;
      case 'wind':
        return AppIcons.wind;
      case 'instrument':
        return AppIcons.instrument;
      default:
        return AppIcons.defaultIcon;
    }
  }
}
