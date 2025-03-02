import 'package:flutter/cupertino.dart';

class SearchProvider extends ChangeNotifier {
  bool _isOpen = false;
  final TextEditingController _controller = TextEditingController();

  bool get isOpen => _isOpen;
  TextEditingController get controller => _controller;

  void toggleSearch() {
    _isOpen = !_isOpen;
    notifyListeners();
  }
}
