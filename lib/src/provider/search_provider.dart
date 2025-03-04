import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'sound_provider.dart';

class SearchProvider extends ChangeNotifier {
  bool _isOpen = false;
  bool get isOpen => _isOpen;

  void toggleSearch() {
    _isOpen = !_isOpen;
    notifyListeners();
  }
  final TextEditingController _controller = TextEditingController();

  TextEditingController get controller => _controller;

  void search(BuildContext context, String query) {
    Provider.of<SoundProvider>(context, listen: false).searchSounds(query);
    notifyListeners();
  }
}
