class ArtCard {
  ArtCard({
    required this.id,
    required this.day,
    required this.image,
    required this.title,
    required this.text,
    required this.likes,
  });

  String id;
  String day;
  String image;
  String title;
  String text;
  List<dynamic> likes;

  ArtCard copyWith(
      {String? id,
        String? day,
      String? image,
      String? title,
      String? text,
      List<dynamic>? likes}) {
    return ArtCard(
        id: id ?? this.id,
        day: day ?? this.day,
        image: image ?? this.image,
        title: title ?? this.title,
        text: text ?? this.text,
        likes: likes ?? this.likes);
  }
}
