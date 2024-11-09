import 'package:flutter/material.dart';
import 'package:inthon2024/component/campaignCard.dart';
import 'package:inthon2024/const/fontStyle.dart';
import 'package:inthon2024/provider/campaignCardProvider.dart';
import 'package:inthon2024/screen/sub_screen/DonateMap_screen.dart';
import 'package:provider/provider.dart';

class CampaignScreen extends StatelessWidget {
  const CampaignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final campaignCardProvider = Provider.of<CampaignCardProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '캠페인에 함께 참여해요!',
                style: BasicBlackFontStyle(),
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => DonateMapScreen()),
                  );
                },
                icon: Icon(Icons.add),
              ),
            ],
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: campaignCardProvider.cards.length,
        itemBuilder: (context, index) {
          return CampaignCard(cardData: campaignCardProvider.cards[index]);
        },
      ),
    );
  }
}
