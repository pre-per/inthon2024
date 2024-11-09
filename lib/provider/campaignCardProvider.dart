import 'package:flutter/material.dart';
import 'package:inthon2024/model/campaignCardModel.dart';

class CampaignCardProvider with ChangeNotifier {
  List<CampaignCardModel> _cards = [
    CampaignCardModel(picture: 'asset/image/banner1.png', title: '안암동 캠페인', date: '2024-11-09', content: 'Hello World'),
    CampaignCardModel(picture: 'asset/image/banner2.png', title: '종암동 캠페인', date: '2024-11-10', content: 'Hello World'),
  ];

  List<CampaignCardModel> get cards => _cards;

  void addCard(String picture, String title, String date, String content) {
    _cards.add(CampaignCardModel(picture: picture, title: title, date: date, content: content));
    notifyListeners();
  }
}