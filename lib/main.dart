import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:inthon2024/provider/naverMapProvider.dart';
import 'package:inthon2024/provider/navigationBarProvider.dart';
import 'package:inthon2024/provider/scrollControllerProvider.dart';
import 'package:inthon2024/screen/main_screen/campaign_screen.dart';
import 'package:inthon2024/screen/main_screen/display_screen.dart';
import 'package:inthon2024/screen/main_screen/home_screen.dart';
import 'package:inthon2024/screen/main_screen/profile_screen.dart';
import 'package:inthon2024/screen/sub_screen/donateMap_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await NaverMapSdk.instance.initialize(
    clientId: 'idrbavj0gb',
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavigationBarProvider()),
        ChangeNotifierProvider(create: (_) => NaverMapProvider()),
        ChangeNotifierProvider(create: (_) => ScrollControllerProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        splashFactory: NoSplash.splashFactory,
        scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  final List<Widget> _screens = [
    Homescreen(),
    CampaignScreen(),
    DisplayScreen(),
    DonateMapScreen(),
  ];

  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final btProvider = Provider.of<NavigationBarProvider>(context);
    return Scaffold(
      body: _screens[btProvider.selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: btProvider.selectedIndex,
        onTap: btProvider.updateIndex,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
          BottomNavigationBarItem(icon: Icon(Icons.campaign), label: '캠페인'),
          BottomNavigationBarItem(icon: Icon(Icons.image), label: '전시'),
          BottomNavigationBarItem(icon: Icon(Icons.person_2_rounded), label: '프로필'),
        ],
      ),
    );
  }
}
