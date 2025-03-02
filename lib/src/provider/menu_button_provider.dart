import 'package:flutter/material.dart';

class MenuButtonProvider extends ChangeNotifier {
  String _selectedTab = "Sounds";

  String get selectedTab => _selectedTab;

  void selectTab(String tab) {
    _selectedTab = tab;
    notifyListeners();
  }
}
