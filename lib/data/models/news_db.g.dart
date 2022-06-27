// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_db.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsList _$NewsListFromJson(Map<String, dynamic> json) => NewsList(
      title: json['title'] as String,
      body: json['body'] as String,
      id: json['id'] as int,
    );

Map<String, dynamic> _$NewsListToJson(NewsList instance) => <String, dynamic>{
      'title': instance.title,
      'body': instance.body,
      'id': instance.id,
    };
