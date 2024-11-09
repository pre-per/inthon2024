import 'package:flutter/material.dart';

class CardSelectionProvider with ChangeNotifier {
  int _selectedCardIndex = 0;
  String _selectedStatus = '--';

  int get selectedCardIndex => _selectedCardIndex;
  String get selectedStatus => _selectedStatus;

  void selectCard(int index, String status) {
    _selectedCardIndex = index;
    _selectedStatus = status;
    notifyListeners();
  }
}