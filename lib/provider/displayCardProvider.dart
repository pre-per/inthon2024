import 'package:flutter/material.dart';

import '../model/displaycardModel.dart';
import '../repository/displayRepository.dart';

class DisplayCardProvider with ChangeNotifier {
  final DisplayRepository _displayRepository = DisplayRepository();
  List<DisplayCardModel> _cards = [];
  bool _isLoading = false;

  List<DisplayCardModel> get cards => _cards;
  bool get isLoading => _isLoading;

  Future<void> fetchDisplays() async {
    _isLoading = true;
    notifyListeners();
    try {
      List<DisplayCardModel> fetchedCards =
      await _displayRepository.getAllDisplays();

      _cards = fetchedCards;
      notifyListeners();
    } catch (e) {
      print('Error fetching campaigns: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}