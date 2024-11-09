import 'package:flutter/material.dart';
import 'package:inthon2024/const/fontStyle.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '안녕하세요!',
          style: BasicBlackFontStyle(),
        ),
      ),
      body: Center(
        child: Text(
          'HomeScreen',
          style: BasicBlackFontStyle(),
        ),
      ),
    );
  }
}
