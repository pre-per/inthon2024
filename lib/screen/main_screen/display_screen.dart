import 'package:flutter/material.dart';
import 'package:inthon2024/component/displayMapWidget.dart';
import 'package:inthon2024/component/displayBottomSheetWidget.dart';
import 'package:inthon2024/const/fontStyle.dart';
import 'package:provider/provider.dart';
import 'package:inthon2024/provider/scrollControllerProvider.dart';

class DisplayScreen extends StatelessWidget {
  const DisplayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final horizontalController =
        Provider.of<ScrollControllerProvider>(context).verticalScrollController;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          '근처 전시 장소를 찾아봐요!',
          style: BasicBlackFontStyle(),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Stack(
          children: [
            DisplayMapWidget(),
            DraggableScrollableSheet(
              initialChildSize: 0.3,
              minChildSize: 0.3,
              maxChildSize: 0.8,
              builder: (context, controller) {
                return Displaybottomsheetwidget(
                  verticalController: controller,
                  horizontalController: horizontalController,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
