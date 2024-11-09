import 'package:flutter/material.dart';
import 'package:inthon2024/component/squareCardWidget.dart';
import 'package:inthon2024/const/fontStyle.dart';
import 'package:inthon2024/provider/pageViewProvider.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  late PageViewProvider pageProvider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    pageProvider = Provider.of<PageViewProvider>(context, listen: false);
    pageProvider.startAutoSlide();
  }

  @override
  void dispose() {
    pageProvider.stopAutoSlide();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => Homescreen()),
                );
              },
              child: SizedBox(
                width: 200.0,
                height: 100.0,
                child: Center(
                  child: Image.asset('asset/image/logo.png'),
                ),
              ),
            ),
            Container(
              width: 100.0,
              height: 50.0,
              color: Colors.yellow,
              child: Center(
                child: Text(
                  'credit',
                  style: BasicBlackFontStyle(),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 240.0,
              width: MediaQuery.of(context).size.width,
              child: Consumer<PageViewProvider>(
                builder: (context, pageProvider, child) {
                  return PageView.builder(
                    controller: pageProvider.pageController,
                    itemCount: pageProvider.images.length,
                    onPageChanged: (index) {
                      pageProvider.setCurrentPage(index);
                    },
                    itemBuilder: (context, index) {
                      return Image.asset(
                        pageProvider.images[index],
                        fit: BoxFit.cover,
                      );
                    },
                  );
                },
              ),
            ),
            const Divider(height: 1),
            SizedBox(
              height: 40.0,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(width: 13.0),
                      Text(
                        '내 주변의 캠페인',
                        style: BasicBlackFontStyle(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 210.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SquarecardWidget(),
                  SquarecardWidget(),
                  SquarecardWidget(),
                ],
              ),
            ),
            const Divider(),
            SizedBox(
              height: 35.0,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(width: 13.0),
                  Text(
                    '얼마 남지 않은 캠페인',
                    style: BasicBlackFontStyle(),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 210.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SquarecardWidget(),
                  SquarecardWidget(),
                  SquarecardWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
