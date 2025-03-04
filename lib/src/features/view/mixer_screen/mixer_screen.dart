import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:soundscape/core/constant/spacing.dart';
import 'package:soundscape/core/constant/text.dart';
import 'package:soundscape/core/theme/theme_extensions/color_palette.dart';
import '../../../../core/constant/icons.dart';
import '../../../common_widgets/custom_slider.dart';
import '../../../provider/audio_provider.dart';
import 'save_mixing_dialog.dart';

class MixerScreen extends StatefulWidget {
  final String mixName;
  final bool isSaved;
  const MixerScreen({super.key,required this.mixName, required this.isSaved});

  @override
  State<MixerScreen> createState() => _MixerScreenState();
}

class _MixerScreenState extends State<MixerScreen> {
  bool isPlaying = false;

  void togglePlayPause(AudioProvider audioProvider) {
    setState(() {
      isPlaying = !isPlaying;
    });

    if (isPlaying) {
      audioProvider.playAll();
    } else {
      audioProvider.pauseAll();
    }
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme
        .of(context)
        .textTheme;
    return Consumer<AudioProvider>(
      builder: (context, audioProvider, _) {
        return Container(
          padding:
          const EdgeInsets.symmetric(horizontal: AppSpacing.pagePadding),
          decoration: const BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: Column(
            children: [
              Icon(
                Icons.minimize, color: AppColors.whiteColor.withOpacity(0.15),
                size: 30,),
              Gap(AppSpacing.screenHeight(context) * 0.015),
              RichText(
                text: TextSpan(
                  style: DefaultTextStyle
                      .of(context)
                      .style,
                  children: <TextSpan>[
                    TextSpan(text: widget.mixName, style: textTheme.bodyLarge),
                    TextSpan(text: AppTexts.mix,
                        style: textTheme.bodyLarge!.copyWith(
                            color: const Color(0xffB58ADE))),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: audioProvider.sounds.length,
                  itemBuilder: (context, index) {
                    final sound = audioProvider.sounds[index];
                    final volume = audioProvider.getVolume(sound);
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomSlider(
                            value: volume,
                            onChanged: (newVolume) {
                              audioProvider.setVolume(sound, newVolume);
                            },
                            sound: sound,
                          ),
                          InkWell(
                            onTap: () {
                              audioProvider.removeSound(sound.id);
                            },
                            child: Container(
                              height: 32,
                              width: 32,
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: AppColors.whiteColor.withOpacity(0.08),
                                  borderRadius: BorderRadius.circular(12)),
                              child: SvgPicture.asset(AppIcons.closeCircle),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () => showSaveMixDialog(context,audioProvider,widget.isSaved,widget.mixName),
                    child: widget.isSaved?Column(
                      children: [
                        SizedBox(
                            height: 24,
                            width: 24,
                            child: SvgPicture.asset(AppIcons.edit)),
                        const Text(AppTexts.rename)
                      ],
                    ):Column(
                      children: [
                        SizedBox(
                            height: 24,
                            width: 24,
                            child: SvgPicture.asset(AppIcons.heardAdd)),
                        const Text(AppTexts.save)
                      ],
                    )
                  ),
                  InkWell(
                    onTap: () => togglePlayPause(audioProvider),
                    child: Column(
                      children: [
                        Icon(
                          isPlaying
                              ? Icons.pause_rounded
                              : Icons.play_arrow_rounded,
                          color: AppColors.whiteColor,
                        ),
                        Text(isPlaying ? AppTexts.pause : AppTexts.play)
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () => audioProvider.removeAllSound(),
                    child: Column(
                      children: [
                        SizedBox(
                            height: 24,
                            width: 24,
                            child: SvgPicture.asset(AppIcons.closeCircle)),
                        const Text(AppTexts.clearAll)
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
            ],
          ),
        );
      },
    );
  }
}
