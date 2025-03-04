import 'package:flutter/material.dart';

class BottomNavProvider extends ChangeNotifier {
  bool _isBottomSheetOpen = false;

  bool get isBottomSheetOpen => _isBottomSheetOpen;

  void showBottomSheet() {
    _isBottomSheetOpen = true;
    notifyListeners();
  }

  void hideBottomSheet() {
    _isBottomSheetOpen = false;
    notifyListeners();
  }
}
