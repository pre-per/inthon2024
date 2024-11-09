import 'package:flutter/material.dart';
import 'package:inthon2024/component/displayMapWidget.dart';
import 'package:inthon2024/component/displayBottomSheetWidget.dart';
import 'package:inthon2024/const/fontStyle.dart';
import 'package:inthon2024/provider/displayCardProvider.dart';
import 'package:provider/provider.dart';
import 'package:inthon2024/provider/scrollControllerProvider.dart';

class DisplayScreen extends StatefulWidget {
  const DisplayScreen({super.key});

  @override
  State<DisplayScreen> createState() => _DisplayScreenState();
}

class _DisplayScreenState extends State<DisplayScreen> {
  late DisplayCardProvider displayCardProvider;
  @override
  void initState() {
    displayCardProvider = Provider.of<DisplayCardProvider>(context, listen: false);
    displayCardProvider.fetchDisplays();
    super.initState();
  }

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
                  cardData: displayCardProvider.cards,
                  verticalController: controller,
                  horizontalController: horizontalController,
                  isLoading: displayCardProvider.isLoading,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
