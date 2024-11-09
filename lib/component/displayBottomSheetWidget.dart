import 'package:flutter/material.dart';
import 'package:inthon2024/const/FontStyle.dart';
import 'package:inthon2024/provider/cardSelectionProvider.dart';
import 'package:inthon2024/provider/scrollControllerProvider.dart';
import 'package:provider/provider.dart';

class Displaybottomsheetwidget extends StatelessWidget {
  final ScrollController horizontalController;
  final ScrollController verticalController;

  Displaybottomsheetwidget({
    required this.horizontalController,
    required this.verticalController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
              ConditionalCard(title: '곧 시작', index: 1),
              ConditionalCard(
                title: '전시 중',
                index: 2,
              ),
              ConditionalCard(
                title: '곧 끝남',
                index: 3,
              ),
              ConditionalCard(
                title: '조건 생각해보기..',
                index: 4,
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            height: 200.0,
            color: Colors.white,
            child: ListView.separated(
              controller: verticalController,
              itemCount: 10,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    'card index#$index',
                    style: BasicBlackFontStyle(),
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
        elevation: 4.0,
        margin: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.0),
          ),
          child: Center(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 6.0, horizontal: 10.0),
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
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
