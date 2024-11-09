import 'package:flutter/material.dart';

class CardSelectionProvider with ChangeNotifier {
  int _selectedCardIndex = 0;

  int get selectedCardIndex => _selectedCardIndex;

  void selectCard(int index) {
    _selectedCardIndex = index;
    notifyListeners();
  }
}