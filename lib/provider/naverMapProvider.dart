import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';

class NaverMapProvider with ChangeNotifier {
  late NaverMapController _controller;

  NaverMapController get controller => _controller;

  void setController(NaverMapController controller) {
    _controller = controller;
    notifyListeners();
  }
}