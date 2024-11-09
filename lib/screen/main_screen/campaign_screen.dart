import 'package:flutter/material.dart';
import 'package:inthon2024/component/campaignCard.dart';
import 'package:inthon2024/const/fontStyle.dart';
import 'package:inthon2024/provider/campaignCardProvider.dart';
import 'package:inthon2024/screen/sub_screen/DonateMap_screen.dart';
import 'package:provider/provider.dart';

class CampaignScreen extends StatefulWidget {
  const CampaignScreen({super.key});

  @override
  State<CampaignScreen> createState() => _CampaignScreenState();
}

class _CampaignScreenState extends State<CampaignScreen> {
  late CampaignCardProvider cardProvider;
  @override
  void initState() {
    cardProvider = Provider.of<CampaignCardProvider>(context, listen: false);
    cardProvider.fetchCampaigns();
    super.initState();
  }

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
