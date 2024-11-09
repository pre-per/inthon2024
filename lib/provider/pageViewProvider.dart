import 'package:flutter/material.dart';
import 'dart:async';

class PageViewProvider with ChangeNotifier {
  final PageController pageController = PageController();
  int currentPage = 0;
  Timer? _timer;

  final List<String> images = [
    'asset/image/banner1.png',
    'asset/image/banner2.png',
    'asset/image/banner3.png',
    'asset/image/banner4.png',
    'asset/image/banner5.png',
    'asset/image/banner6.png',
    'asset/image/banner7.png',
    'asset/image/banner8.png',
  ];

  PageViewProvider() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      startAutoSlide();
    });

  }

  void startAutoSlide() {
    if (_timer != null && _timer!.isActive) return;
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (currentPage < images.length - 1) {
        currentPage++;
      } else {
        currentPage = 0;
      }
      pageController.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 1000),
        curve: Curves.ease,
      );
      notifyListeners();
    });
  }

  void stopAutoSlide() {
    _timer?.cancel();
  }

  void setCurrentPage(int index) {
    currentPage = index;
    notifyListeners();
  }

  @override
  void dispose() {
    pageController.dispose();
    _timer?.cancel();
    super.dispose();
  }
}
