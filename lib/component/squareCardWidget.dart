import 'package:flutter/material.dart';
import 'package:inthon2024/const/FontStyle.dart';

class SquarecardWidget extends StatelessWidget {
  const SquarecardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('네모 배너 클릭됨');
      },
      child: Card(
        elevation: 4.0,
        borderOnForeground: true,
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
            width: 200.0,
            child: Center(
              child: Column(
                children: [
                  Container(
                    height: 100.0,
                    width: 200.0,
                    color: Colors.yellow,
                  ),
                  const Divider(height: 1,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        ' 이건 제목입니다',
                        style: BasicBlackFontStyle(),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        ' 이건 부제목입니다',
                        style: BasicBlackFontStyle().copyWith(fontSize: 15.0),
                      )
                    ],
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
