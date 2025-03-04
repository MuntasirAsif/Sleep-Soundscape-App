import 'package:flutter/material.dart';
import '../../core/constant/sound_data.dart';
import '../features/model/sound_model.dart';

class SoundProvider with ChangeNotifier {
  List<SoundModel> _sounds = [];
  List<SoundModel> _filteredSounds = [];

  String _searchQuery = "";
  String _selectedCategory = "All";

  SoundProvider() {
    _loadSounds();
  }

  List<SoundModel> get sounds => _filteredSounds;

  void _loadSounds() {
    _sounds = soundData.map((json) => SoundModel.fromJson(json)).toList();
    _applyFilters();
  }

  // Search Sounds
  void searchSounds(String query) {
    _searchQuery = query;
    _applyFilters();
  }

  // Filter Sounds by Category
  void filterByCategory(String category) {
    _selectedCategory = category;
    _applyFilters();
  }

  // Apply Both Search & Category Filters
  void _applyFilters() {
    _filteredSounds = _sounds.where((sound) {
      final matchesSearch = sound.name.toLowerCase().contains(_searchQuery.toLowerCase());
      final matchesCategory = _selectedCategory == "All" || sound.category == _selectedCategory;
      return matchesSearch && matchesCategory;
    }).toList();
    notifyListeners();
  }
}
