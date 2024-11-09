class DisplayCardModel {
  int id;
  String picture;
  String title;
  String date;
  String content;
  String status;

  DisplayCardModel({
    required this.id,
    required this.picture,
    required this.title,
    required this.date,
    required this.content,
    required this.status,
  });

  DisplayCardModel.fromJson({required Map<String, dynamic> json})
      : id = json['id'],
        picture = json['picture'] ?? 'asset/image/banner1.png',
        title = json['title'],
        date = json['endDate'],
        content = json['description'],
        status = json['status'];
}
