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
            onTap: () async {
              final result = await showDialog(
                context: context,
                builder: (_) {
                  return AlertDialog(
                    title: const Text(
                      '기부하기',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    content: Text(
                      '${mapProvider.selectedMarker.info.id}에서 기부하시겠습니까?',
                      style: const TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500,
                      ),
                      softWrap: true,
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                        child: const Text(
                          '취소',
                          style: TextStyle(
                            color: PRIMARY_COLOR_DENSE,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(true);
                        },
                        child: const Text(
                          '확인',
                          style: TextStyle(
                            color: PRIMARY_COLOR_DENSE,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
              if (result == true) {
                mapProvider.makeReservation();
                await showDialog(
                  context: context,
                  builder: (_) {
                    return AlertDialog(
                      title: const Text(
                        '기부 예약이 완료되었습니다',
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(true);
                          },
                          child: const Text(
                            '확인',
                            style: TextStyle(
                              color: PRIMARY_COLOR_DENSE,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
                Navigator.of(context).popUntil((route) => route.isFirst);
              }
            },
          ),
        ),
      ),
    );
  }
}
