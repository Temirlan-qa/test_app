// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photos_db.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhotoList _$PhotoListFromJson(Map<String, dynamic> json) => PhotoList(
      title: json['title'] as String,
      url: json['url'] as String,
      id: json['id'] as int,
      albumId: json['albumId'] as int,
    );

Map<String, dynamic> _$PhotoListToJson(PhotoList instance) => <String, dynamic>{
      'title': instance.title,
      'url': instance.url,
      'id': instance.id,
      'albumId': instance.albumId,
    };
