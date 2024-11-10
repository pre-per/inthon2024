import 'package:flutter/material.dart';
import 'package:inthon2024/const/fontStyle.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '안녕하세요 리:아트님!',
              style: BasicBlackFontStyle(),
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.settings,
                  size: 25.0,
                  color: Colors.black,
                ))
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const Divider(),
            Center(
              child: SizedBox(
                height: 150.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Icon(
                        Icons.person_2,
                        size: 100.0,
                        color: Colors.orange,
                      ),
                    ),
                    const SizedBox(width: 20.0),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '리:아트님',
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          '보유한 크레딧: 11,924p',
                          style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          '보유한 뱃지: 5개',
                          style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Divider(height: 1),
            SizedBox(
              height: 35.0,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(width: 13.0),
                  Text(
                    '내가 참여한 캠페인',
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
                    MyCard(title: '안암동 공모전', date: '2023-10-29', picture: 'asset/image/banner8.png'),
                    MyCard(title: '작가와 친환경',date: '2024-01-01', picture: 'asset/image/banner7.png'),
                    MyCard(title: '함께 사는 지구', date: '2024-02-13', picture: 'asset/image/campagin3.jpeg'),
                    MyCard(title: '예술', date: '2024-05-19', picture: 'asset/image/banner5.png'),
                    MyCard(title: '일상의 힘', date: '2024-10-11', picture: 'asset/image/banner6.png'),
                  ],
                )),
            const Divider(height: 1),
          ],
        ),
      ),
    );
  }
}

class MyCard extends StatelessWidget {
  final String title;
  final String picture;
  final String date;

  const MyCard({
    required this.title,
    required this.picture,
    required this.date,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      color: Colors.white,
      child: SizedBox(
        height: 150.0,
        width: 150.0,
        child: Column(
          children: [
            SizedBox(
              height: 100.0,
              width: 150.0,
              child: Image.asset(
                picture,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20.0),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 17.0,
              ),
            ),
            Text(
              date,
              style: TextStyle(
                color: Colors.grey[700],
                fontWeight: FontWeight.w600,
                fontSize: 15.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
