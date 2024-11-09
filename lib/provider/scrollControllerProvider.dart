import 'package:flutter/material.dart';

class ScrollControllerProvider with ChangeNotifier {
  final ScrollController verticalScrollController = ScrollController();
  final ScrollController horizontalScrollController = ScrollController();

  @override
  void dispose() {
    verticalScrollController.dispose();
    horizontalScrollController.dispose();
    super.dispose();
  }
}