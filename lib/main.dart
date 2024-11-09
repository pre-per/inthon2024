import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:inthon2024/const/colors.dart';
import 'package:inthon2024/model/cardModel.dart';
import 'package:inthon2024/provider/campaignCardProvider.dart';
import 'package:inthon2024/provider/cardSelectionProvider.dart';
import 'package:inthon2024/provider/displayCardProvider.dart';
import 'package:inthon2024/provider/naverMapProvider.dart';
import 'package:inthon2024/provider/navigationBarProvider.dart';
import 'package:inthon2024/provider/pageViewProvider.dart';
import 'package:inthon2024/provider/scrollControllerProvider.dart';
import 'package:inthon2024/repository/campaignRepository.dart';
import 'package:inthon2024/repository/displayRepository.dart';
import 'package:inthon2024/screen/main_screen/campaign_screen.dart';
import 'package:inthon2024/screen/main_screen/display_screen.dart';
import 'package:inthon2024/screen/main_screen/home_screen.dart';
import 'package:inthon2024/screen/main_screen/profile_screen.dart';
import 'package:inthon2024/screen/sub_screen/donateMap_screen.dart';
import 'package:provider/provider.dart';

import 'model/userModel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await NaverMapSdk.instance.initialize(
    clientId: 'idrbavj0gb',
  );

  final campaignRepository = CampaignRepository();
  final displayRepository = DisplayRepository();
  try {
    List<CardModel> cards = await campaignRepository.getAllCampaigns();
    for(var card in cards) {
      print('${card.id} - ${card.content}');
    }
  } catch (e) {
    print(e);
  }

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavigationBarProvider()),
        ChangeNotifierProvider(create: (_) => NaverMapProvider()),
        ChangeNotifierProvider(create: (_) => ScrollControllerProvider()),
        ChangeNotifierProvider(create: (_) => PageViewProvider()),
        ChangeNotifierProvider(create: (_) => CardSelectionProvider()),
        ChangeNotifierProvider(create: (_) => CampaignCardProvider()),
        ChangeNotifierProvider(create: (_) => DisplayCardProvider()),
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
    ProfileScreen(),
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
