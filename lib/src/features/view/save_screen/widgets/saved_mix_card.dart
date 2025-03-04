import 'package:gap/gap.dart';
import 'package:soundscape/core/constant/spacing.dart';
import 'package:soundscape/core/theme/theme_extensions/color_palette.dart';
import 'package:soundscape/src/common_widgets/play_pause_button.dart';
import 'package:soundscape/src/provider/audio_provider.dart';
import '../../../../common_widgets/open_mix_sheet.dart';
import 'package:flutter/material.dart';
import 'all_sound_save_card.dart';

class SavedMixCard extends StatelessWidget {
  const SavedMixCard(
      {super.key, required this.audioProvider, required this.mixName});
  final AudioProvider audioProvider;
  final String mixName;
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () {
        audioProvider.loadMix(mixName);
        openMixSheet(mixName, context,true);
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: BorderRadius.circular(16)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AllSoundSaveCard(
              audioProvider: audioProvider,
              mixName: mixName,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      mixName,
                      style: textTheme.bodyLarge,
                    ),
                    FutureBuilder<List<String>>(
                        future: audioProvider.getMixSoundName(mixName),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData || snapshot.data!.isEmpty) {
                            return const SizedBox();
                          }
                          return SizedBox(
                            width: AppSpacing.screenWidth(context)*0.3,
                            height: 20,
                            child: ListView.builder(
                              itemCount: 2,
                              scrollDirection:Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Icon(Icons.circle,color: AppColors.whiteColor.withOpacity(0.65),size: 5,),
                                      const Gap(1),
                                      Text(snapshot.data![index],style: textTheme.labelMedium!.copyWith(color: AppColors.whiteColor.withOpacity(0.65)),),
                                      const Gap(3),
                                    ],
                                  );
                                }),
                          );
                        })
                  ],
                ),
                const PlayPauseButton()
              ],
            )
          ],
        ),
      ),
    );
  }
}
