import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:soundscape/core/constant/spacing.dart';
import 'package:soundscape/core/theme/theme_extensions/color_palette.dart';
import '../../core/constant/icons.dart';
import '../features/model/sound_model.dart';

class CustomSlider extends StatefulWidget {
  final double value;
  final ValueChanged<double> onChanged;
  final SoundModel sound;
  const CustomSlider(
      {super.key,
      required this.value,
      required this.onChanged,
      required this.sound});

  @override
  _CustomSliderState createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  @override
  Widget build(BuildContext context) {
    double trackWidth = AppSpacing.screenWidth(context) * 0.80;
    double thumbSize = 32;
    double thumbPosition = widget.value * (trackWidth - thumbSize);
    TextTheme textTheme = Theme.of(context).textTheme;
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Row(
          children: [
            Container(
              height: 32,
              width: thumbPosition + 10,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12)),
                gradient: LinearGradient(
                    colors: AppColors.gradiantButton,
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.sound.name,
                    maxLines: 1,
                    style: textTheme.bodySmall,
                  ),
                ),
              ),
            ),
            Container(
              height: 32,
              width: trackWidth - thumbPosition - 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.whiteColor
                    .withOpacity(0.08),
              ),
            ),
          ],
        ),

        Positioned.fill(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SliderTheme(
              data: SliderTheme.of(context).copyWith(
                trackHeight: 32,
                inactiveTrackColor:
                    Colors.transparent,
                activeTrackColor:
                    Colors.transparent,
                thumbColor: Colors.transparent,
                overlayColor: Colors.transparent,
                thumbShape:
                    const RoundSliderThumbShape(enabledThumbRadius: 0.0),
              ),
              child: Slider(
                value: widget.value,
                min: 0.0,
                max: 1.0,
                onChanged: widget.onChanged,
              ),
            ),
          ),
        ),

        // Custom Thumb (Floating Icon)
        Positioned(
          left: thumbPosition,
          child: Container(
            width: thumbSize,
            height: thumbSize,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 8,
                  offset: const Offset(2, 2),
                ),
              ],
            ),
            child: Center(
              child: SvgPicture.asset(widget.sound.imageUrl==''?getIcon(
                widget.sound.category,
              ):widget.sound.imageUrl),
            ),
          ),
        ),
      ],
    );
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
