import 'package:flutter/material.dart';
import 'package:inthon2024/const/FontStyle.dart';

class Displaybottomsheetwidget extends StatelessWidget {
  final ScrollController scrollController;

  const Displaybottomsheetwidget({
    required this.scrollController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50.0,
          color: Colors.yellow,
        ),
        Expanded(
          child: Container(
            height: 200.0,
            color: Colors.white,
            child: ListView.separated(
              controller: scrollController,
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
