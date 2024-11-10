class CardModel {
  int id;
  String picture;
  String title;
  String date;
  String content;

  CardModel({
    required this.id,
    required this.picture,
    required this.title,
    required this.date,
    required this.content,
  });

  CardModel.fromJson({required Map<String, dynamic> json})
      : id = json['id'],
        // 서버의 id 값을 사용
        picture = json['imageUrl'] ??
            'https://pjhisgod.s3.ap-northeast-2.amazonaws.com/inthon2024/images/KakaoTalk_Photo_2024-11-10-06-05-53+001.jpeg',
        // 예비값 설정
        title = json['title'],
        date = json['endDate'],
        content = json['description'];
}
