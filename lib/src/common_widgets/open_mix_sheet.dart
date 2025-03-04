import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../features/view/mixer_screen/mixer_screen.dart';
import '../provider/bottom_nav_provider.dart';

void openMixSheet(String mixName,BuildContext context,bool isSaved) {
  var bottomNavProvider =
  Provider.of<BottomNavProvider>(context, listen: false);

  bottomNavProvider.showBottomSheet(); // Hide BottomNavBar
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => SizedBox(
      height: MediaQuery.of(context).size.height * 0.85,
      child: MixerScreen(mixName: mixName, isSaved: isSaved,),
    ),
  ).whenComplete(() {
    bottomNavProvider.hideBottomSheet();
  });
}