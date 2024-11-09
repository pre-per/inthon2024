import 'package:flutter/material.dart';
import 'package:inthon2024/component/donateMapWidget.dart';
import 'package:inthon2024/const/fontStyle.dart';

class DonateMapScreen extends StatelessWidget {
  const DonateMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '근처 수거 장소를 선택하세요!',
          style: BasicBlackFontStyle(),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DonateMapWidget(),
          ],
        ),
      ),
    );
  }
}
