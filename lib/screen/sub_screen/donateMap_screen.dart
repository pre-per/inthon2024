import 'package:flutter/material.dart';
import 'package:inthon2024/component/donateMapWidget.dart';
import 'package:inthon2024/const/fontStyle.dart';
import 'package:provider/provider.dart';
import 'package:inthon2024/provider/naverMapProvider.dart';
import '../../const/colors.dart';

class DonateMapScreen extends StatelessWidget {
  const DonateMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mapProvider = Provider.of<NaverMapProvider>(context);
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
            Center(
              child: Card(
                elevation: 3.0,
                margin: const EdgeInsets.all(15.0),
                color: Colors.white,
                child: SizedBox(
                  height: 100.0,
                  child: Center(
                    child: Text(
                      mapProvider.selectedMarker.info.id,
                      style: BasicBlackFontStyle(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
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
                    '여기로 할게요!',
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
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
          ),
        ),
      ),
    );
  }
}
