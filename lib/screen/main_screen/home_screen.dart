import 'package:flutter/material.dart';
import 'package:inthon2024/component/squareCardWidget.dart';
import 'package:inthon2024/const/fontStyle.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => Homescreen()),
                );
              },
              child: SizedBox(
                width: 200.0,
                height: 100.0,
                child: Center(
                  child: Image.asset('asset/image/logo2.png'),
                ),
              ),
            ),
            Container(
              width: 100.0,
              height: 50.0,
              color: Colors.yellow,
              child: Center(
                child: Text(
                  'credit',
                  style: BasicBlackFontStyle(),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Divider(),
            GestureDetector(
              onTap: () {
                print("인터넷 연결");
              },
              child: SizedBox(
                height: 240.0,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Text(
                    '움직이는 위젯',
                    style: BasicBlackFontStyle(),
                  ),
                ),
              ),
            ),
            const Divider(),
            SizedBox(
              height: 35.0,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(width: 13.0),
                  Text(
                    '내 주변의 캠페인',
                    style: BasicBlackFontStyle(),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 210.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SquarecardWidget(),
                  SquarecardWidget(),
                  SquarecardWidget(),
                ],
              ),
            ),
            const Divider(),
            SizedBox(
              height: 35.0,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(width: 13.0),
                  Text(
                    '얼마 남지 않은 캠페인',
                    style: BasicBlackFontStyle(),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 210.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SquarecardWidget(),
                  SquarecardWidget(),
                  SquarecardWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
