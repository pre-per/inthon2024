import 'package:flutter/material.dart';
import 'package:inthon2024/component/displayMapWidget.dart';
import 'package:inthon2024/component/displayBottomSheetWidget.dart';
import 'package:inthon2024/const/fontStyle.dart';


class DisplayScreen extends StatelessWidget {
  const DisplayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '근처 전시 장소를 찾아봐요!',
          style: BasicBlackFontStyle(),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Stack(
          children: [
            const Positioned.fill(
              child: DisplayMapWidget(),
            ),
            DraggableScrollableSheet(
              initialChildSize: 0.4,
              minChildSize: 0.3,
              maxChildSize: 0.8,
              builder: (context, ScrollController scrollController) {
                return Displaybottomsheetwidget(scrollController: scrollController);
              },
            ),
          ],
        ),
      ),
    );
  }
}
