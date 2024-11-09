import 'package:flutter/material.dart';

import '../model/cardModel.dart';
import '../repository/displayRepository.dart';

class DisplayCardProvider with ChangeNotifier {
  final DisplayRepository _displayRepository = DisplayRepository();
  List<CardModel> _cards = [];
  bool _isLoading = false;

  List<CardModel> get cards => _cards;
  bool get isLoading => _isLoading;

  Future<void> fetchDisplays() async {
    _isLoading = true;
    notifyListeners();
    try {
      List<CardModel> fetchedCards =
      await _displayRepository.getAllDisplays();

      _cards = fetchedCards; // _cards를 서버에서 가져온 데이터로 대체
      notifyListeners(); // UI 업데이트를 위해 notifyListeners() 호출
    } catch (e) {
      print('Error fetching campaigns: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}