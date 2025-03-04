import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soundscape/core/constant/spacing.dart';
import 'package:soundscape/src/features/view/save_screen/widgets/saved_mix_card.dart';
import '../../../provider/audio_provider.dart';


class SaveScreen extends StatelessWidget {
  const SaveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AudioProvider>(
      builder: (context, audioProvider, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.pagePadding),
          child: FutureBuilder<List<String>>(
            future: audioProvider.getSavedMixes(),
            builder: (context, snapshot) {
              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text("No saved mixes"));
              }
              return GridView.builder(
                itemCount: snapshot.data!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1.1,
                ),
                itemBuilder: (context, index) {
                  String mixName = snapshot.data![index];
                  return SavedMixCard(audioProvider: audioProvider, mixName: mixName);
                },
              );

            },
          ),
        );
      },
    );
  }
}
