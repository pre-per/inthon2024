import 'package:flutter/material.dart';
import 'package:inthon2024/const/FontStyle.dart';
import 'package:inthon2024/const/colors.dart';
import 'package:inthon2024/model/campaignCardModel.dart';
import 'package:inthon2024/screen/sub_screen/DonateMap_screen.dart';

class CampaigninfoScreen extends StatelessWidget {
  final CampaignCardModel cardData;

  const CampaigninfoScreen({required this.cardData, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          cardData.title,
          style: BasicBlackFontStyle(),
        ),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          const Divider(height: 1),
          SizedBox(
            height: 250.0,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Image.asset(cardData.picture, fit: BoxFit.cover),
            ),
          ),
          const Divider(height: 0),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                '캠페인 마감일: ${cardData.date} ',
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.grey[700],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 300.0,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Text(
                '재활용품 종류별 수급률이 들어갑니다',
                style: BasicBlackFontStyle(),
              ),
            ),
          ),
          const Divider(height: 1),
          SizedBox(
            height: 300.0,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('캠페인 상세 설명', style: BasicBlackFontStyle()),
                  Text(
                    cardData.content,
                    style: BasicBlackFontStyle().copyWith(fontSize: 15.0),
                    softWrap: true,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Center(
          child: GestureDetector(
            child: const Card(
              elevation: 3.0,
              color: PASTEL_GREEN_COLOR,
              child: SizedBox(
                width: 400.0,
                height: 100.0,
                child: Center(
                  child: Text(
                    '참여하기',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => DonateMapScreen()),
              );
            },
          ),
        ),
      ),
    );
  }
}
