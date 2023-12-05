import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'painting.freezed.dart';
part 'painting.g.dart';

// class Painting {
//   Painting({
//     required this.link,
//     required this.description,
//     required this.genre,
//   });

//   final String link;
//   final String description;
//   final String genre;

@freezed
abstract class Painting with _$Painting {
  const factory Painting({
    required String title,
    required String artistName,
    @Default("") String? yearAsString,
    required String image,
  }) = _Painting;

  factory Painting.fromJson(Map<String, Object?> json) =>
      _$PaintingFromJson(json);

  // final String title;
  // final String artist;
  // final String year;
  // final String image;

  // factory Painting.fromJson(Map<String, dynamic> json) {
  //   return Painting(
  //       title: json['title'],
  //       artist: json['artistName'],
  //       year: json['yearAsString'] ?? '',
  //       image: json['image']);
  // }
}
