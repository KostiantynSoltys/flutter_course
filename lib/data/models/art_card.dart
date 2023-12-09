class ArtCard {
  ArtCard({
    required this.id,
    required this.day,
    required this.image,
    required this.title,
    required this.text,
    required this.likes,
    required this.source_links,
    required this.more_art_links,
  });

  String id;
  String day;
  String image;
  String title;
  String text;
  List<dynamic> likes;
  List<dynamic> source_links;
  List<dynamic> more_art_links;

  ArtCard copyWith(
      {String? id,
      String? day,
      String? image,
      String? title,
      String? text,
      List<dynamic>? likes,
      List<dynamic>? source_links,
      List<dynamic>? more_art_links}) {
    return ArtCard(
        id: id ?? this.id,
        day: day ?? this.day,
        image: image ?? this.image,
        title: title ?? this.title,
        text: text ?? this.text,
        likes: likes ?? this.likes,
        source_links: source_links ?? this.source_links,
        more_art_links: more_art_links ?? this.more_art_links);
  }
}
