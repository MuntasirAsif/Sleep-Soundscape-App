import 'package:flutter/material.dart';
import 'package:soundscape/core/constant/text.dart';
import 'package:soundscape/core/theme/theme_extensions/color_palette.dart';
import 'package:soundscape/src/features/controller/name_controller.dart';
import 'package:soundscape/src/provider/audio_provider.dart';

void showSaveMixDialog(BuildContext context, AudioProvider audioProvider,
    bool isSaved, String oldMixedName) {
  NameController nameController = NameController();
  TextTheme textTheme = Theme
      .of(context)
      .textTheme;
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: AppColors.secondaryColor, // Dark theme background
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: MediaQuery.of(context).viewInsets.bottom + 40,
          top: 30,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RichText(
              text: TextSpan(
                style: DefaultTextStyle
                    .of(context)
                    .style,
                children: <TextSpan>[
                  TextSpan(text: '${isSaved?AppTexts.rename:AppTexts.save} this', style: textTheme.bodyLarge),
                  TextSpan(text: AppTexts.mix.toLowerCase(),
                      style: textTheme.bodyLarge!.copyWith(
                          color: const Color(0xffB58ADE))),
                ],
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: nameController.mixNameController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.secondaryColorWithWhite8Percent(AppColors.secondaryColor), // Dark text field background
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: AppColors.whiteColor.withOpacity(0.4))
                          ),
                      child: const Center(
                        child: Text(AppTexts.cancel,
                            style: TextStyle(color: AppColors.whiteColor)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      if (nameController.mixNameController.text.trim().isNotEmpty) {
                        isSaved
                            ? audioProvider.renameMix(
                                oldMixedName, nameController.mixNameController.text.trim())
                            : audioProvider
                                .saveMix(nameController.mixNameController.text.trim());
                        Navigator.pop(context);
                      }
                    },
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          gradient: const LinearGradient(
                              colors: AppColors.gradiantButton,
                              end: Alignment.bottomLeft,
                              begin: Alignment.topRight)),
                      child: Center(
                          child: Text(
                              isSaved ? AppTexts.saveChanges : AppTexts.save,
                              style: const TextStyle(
                                  color: AppColors.whiteColor))),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}
