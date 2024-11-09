import 'package:flutter/material.dart';
import 'package:inthon2024/const/FontStyle.dart';
import 'package:inthon2024/model/cardModel.dart';
import 'package:inthon2024/screen/sub_screen/campaignInfo_screen.dart';

class CampaignCard extends StatelessWidget {
  final CardModel cardData;

  CampaignCard({required this.cardData, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => CampaigninfoScreen(cardData: cardData)),
        );
      },
      child: Card(
        color: Colors.white,
        elevation: 4.0,
        margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
          side: const BorderSide(
            color: Colors.grey,
            width: 0.5,
          ),
        ),
        child: SizedBox(
          height: 100.0,
          width: 400.0,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    height: 100.0,
                    width: 140.0,
                    child: Center(
                      child: Image.asset(cardData.picture, fit: BoxFit.cover),
                    ),
                  ),
                ),
                const SizedBox(width: 10.0),
                SizedBox(
                  width: 230.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cardData.title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: BasicBlackFontStyle(),
                      ),
                      Text(
                        cardData.date,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: BasicBlackFontStyle().copyWith(fontSize: 15.0),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
