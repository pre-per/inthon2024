import 'package:flutter/material.dart';
import 'package:inthon2024/model/cardModel.dart';

import '../repository/campaignRepository.dart';

class CampaignCardProvider with ChangeNotifier {
  final CampaignRepository _campaignRepository = CampaignRepository();
  List<CardModel> _cards = [];

  List<CardModel> get cards => _cards;

  void addCard(int campaignNum, String picture, String title, String date,
      String content) {
    _cards.add(CardModel(
      id: campaignNum,
      picture: picture,
      title: title,
      date: date,
      content: content,
    ));
    notifyListeners();
  }

  Future<void> fetchCampaigns() async {
    try {
      // CampaignRepository의 getAllCampaigns 메서드를 호출하여 전체 데이터를 불러옵니다.
      List<CardModel> fetchedCards =
          await _campaignRepository.getAllCampaigns();

      _cards = fetchedCards; // _cards를 서버에서 가져온 데이터로 대체
      notifyListeners(); // UI 업데이트를 위해 notifyListeners() 호출
    } catch (e) {
      print('Error fetching campaigns: $e');
    }
  }
}
