import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'sound_provider.dart';

class CategoryProvider extends ChangeNotifier {
  String _selectedCategory = "All";

  String get selectedCategory => _selectedCategory;

  void selectCategory(BuildContext context, String category) {
    _selectedCategory = category;
    Provider.of<SoundProvider>(context, listen: false).filterByCategory(category);
    notifyListeners();
  }
}
