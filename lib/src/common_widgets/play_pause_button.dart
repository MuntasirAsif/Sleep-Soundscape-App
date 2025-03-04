import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/theme/theme_extensions/color_palette.dart';
import '../provider/audio_provider.dart';
class PlayPauseButton extends StatefulWidget {
  const PlayPauseButton({super.key});

  @override
  State<PlayPauseButton> createState() => _PlayPauseButtonState();
}

class _PlayPauseButtonState extends State<PlayPauseButton> {
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
    return Consumer<AudioProvider>(builder: (context, audioProvider, child){
      return GestureDetector(
        onTap: () => togglePlayPause(audioProvider),
        child: Container(
          height: 32,
          width: 32,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color:
                AppColors.whiteColor.withOpacity(0.4),
                blurRadius: 0.5,
                offset: const Offset(-0.5, -0.5),
              ),
            ],
            gradient: const LinearGradient(
              colors: AppColors.gradiantButton,
              begin: Alignment.bottomRight,
              end: Alignment.topRight,
            ),
          ),
          child: Icon(
            isPlaying
                ? Icons.pause_rounded
                : Icons.play_arrow_rounded,
            color: AppColors.whiteColor,
          ),
        ),
      );
    });
  }
}