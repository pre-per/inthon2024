import 'package:flutter/material.dart';
import 'package:inthon2024/const/FontStyle.dart';
import 'package:inthon2024/model/cardModel.dart';
import 'package:inthon2024/provider/cardSelectionProvider.dart';
import 'package:inthon2024/provider/displayCardProvider.dart';
import 'package:inthon2024/provider/scrollControllerProvider.dart';
import 'package:provider/provider.dart';

class Displaybottomsheetwidget extends StatelessWidget {
  final List<CardModel> cardData;
  final ScrollController horizontalController;
  final ScrollController verticalController;
  final bool isLoading;

  Displaybottomsheetwidget({
    required this.cardData,
    required this.horizontalController,
    required this.verticalController,
    required this.isLoading,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (cardData.isEmpty) {
      return Center(child: Text("전시 정보를 불러올 수 없습니다."));
    }

    return Column(
      children: [
        Container(
          height: 50.0,
          color: Colors.white,
          child: ListView(
            scrollDirection: Axis.horizontal,
            controller: horizontalController,
            children: [
              ConditionalCard(title: '전체', index: 0),
              ConditionalCard(title: '예정됨', index: 1),
              ConditionalCard(title: '전시 중', index: 2),
              ConditionalCard(title: '종료됨', index: 3),
              ConditionalCard(title: '추가 조건', index: 4),
            ],
          ),
        ),
        const Divider(height: 1),
        Expanded(
          child: Container(
            height: 200.0,
            color: Colors.white,
            child: ListView.separated(
              controller: verticalController,
              itemCount: cardData.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: SizedBox(
                    height: 100.0,
                    width: 100.0,
                    child: Center(
                      child: Image.asset(
                        cardData[index].picture,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  title: Text(
                    cardData[index].title,
                    style: BasicBlackFontStyle(),
                  ),
                  subtitle: Text(
                    cardData[index].date,
                    style: BasicBlackFontStyle().copyWith(fontSize: 13.0),
                  ),
                );
              },
              separatorBuilder: (context, index) => const Divider(),
            ),
          ),
        ),
      ],
    );
  }
}

class ConditionalCard extends StatelessWidget {
  final String title;
  final int index;

  ConditionalCard({
    required this.title,
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cardSelectionProvider = Provider.of<CardSelectionProvider>(context);

    return GestureDetector(
      onTap: () {
        cardSelectionProvider.selectCard(index);
      },
      child: Card(
        color: cardSelectionProvider.selectedCardIndex == index
            ? Colors.grey[300]
            : Colors.white,
        elevation: 3.0,
        margin: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.0),
          ),
          child: Center(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 6.0, horizontal: 15.0),
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 15.0,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
