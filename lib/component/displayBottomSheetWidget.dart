import 'package:flutter/material.dart';
import 'package:inthon2024/const/FontStyle.dart';
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
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            controller: horizontalController,
            itemCount: 10,
            itemBuilder: (context, index) {
              return ConditionalCard(title: 'card#$index');
            },
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

  ConditionalCard({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        color: Colors.white,
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
