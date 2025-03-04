import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../core/constant/spacing.dart';
import '../../../../common_widgets/sound_card.dart';
import '../../../../provider/sound_provider.dart';
import '../../../model/sound_model.dart';

class SoundItems extends StatelessWidget {
  const SoundItems({super.key});

  @override
  Widget build(BuildContext context) {
    final soundProvider = Provider.of<SoundProvider>(context);

    return SizedBox(
      height: AppSpacing.screenHeight(context)*0.58,
      width: AppSpacing.screenWidth(context),
      child: GridView.builder(
        itemCount: soundProvider.sounds.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.8,
        ),
        itemBuilder: (context, index) {
          SoundModel sound = soundProvider.sounds[index];
          return SoundCard(sound: sound);
        },
      ),
    );
  }
}
