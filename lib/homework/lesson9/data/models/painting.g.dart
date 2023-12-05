// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'painting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaintingImpl _$$PaintingImplFromJson(Map<String, dynamic> json) =>
    _$PaintingImpl(
      title: json['title'] as String,
      artistName: json['artistName'] as String,
      yearAsString: json['yearAsString'] as String? ?? "",
      image: json['image'] as String,
    );

Map<String, dynamic> _$$PaintingImplToJson(_$PaintingImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'artistName': instance.artistName,
      'yearAsString': instance.yearAsString,
      'image': instance.image,
    };
