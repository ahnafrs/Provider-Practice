import 'package:flutter/foundation.dart';

class FavouriteItemProvider with ChangeNotifier {
  List<int> _selectedIndex = [];
  List<int> get selectedIndex => _selectedIndex;

  void addItem(int value) {
    _selectedIndex.add(value);
    notifyListeners();
  }

  void removeItem(int value) {
    _selectedIndex.remove(value);
    notifyListeners();
  }
}
