import 'package:flutter/material.dart';
import 'package:inthon2024/const/FontStyle.dart';
import 'package:inthon2024/model/cardModel.dart';
import 'package:inthon2024/provider/campaignCardProvider.dart';
import 'package:inthon2024/screen/sub_screen/campaignInfo_screen.dart';
import 'package:provider/provider.dart';

class SquarecardWidget extends StatelessWidget {
  final CardModel cardData;

  const SquarecardWidget({required this.cardData, super.key});

  @override
  Widget build(BuildContext context) {
    final campaignCardProvider = Provider.of<CampaignCardProvider>(context);
    return GestureDetector(
      onTap: () {
        print('네모 배너 클릭됨');
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => CampaigninfoScreen(cardData: cardData)),
        );
      },
      child: Card(
        elevation: 4.0,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
          side: const BorderSide(
            color: Colors.grey,
            width: 0.5,
          ),
        ),
        margin: const EdgeInsets.all(8.0),
        child: SizedBox(
            height: 200.0,
            width: 180.0,
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 100.0,
                    width: 200.0,
                    child: Image.network(cardData.picture, fit: BoxFit.cover),
                  ),
                  const Divider(
                    height: 1,
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    '  ${cardData.title}',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: BasicBlackFontStyle().copyWith(fontSize: 17.0),
                  ),
                  Text(
                    '   ${cardData.date}',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: BasicBlackFontStyle().copyWith(fontSize: 13.0),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
