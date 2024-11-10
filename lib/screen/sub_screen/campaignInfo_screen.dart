import 'package:flutter/material.dart';
import 'package:inthon2024/const/FontStyle.dart';
import 'package:inthon2024/const/colors.dart';
import 'package:inthon2024/model/cardModel.dart';
import 'package:inthon2024/screen/sub_screen/DonateMap_screen.dart';

class CampaigninfoScreen extends StatelessWidget {
  final CardModel cardData;

  const CampaigninfoScreen({required this.cardData, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          cardData.title,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
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
              child: Image.network(cardData.picture, fit: BoxFit.cover),
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
              child: Column(
                children: [
                  Image.asset('asset/image/battery.png'),
                  Image.asset('asset/image/can.png'),
                  Image.asset('asset/image/cloth.png'),
                  Image.asset('asset/image/glass.png'),
                  Image.asset('asset/image/plastic.png'),
                  Image.asset('asset/image/etc.png'),
                ],
              )
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
