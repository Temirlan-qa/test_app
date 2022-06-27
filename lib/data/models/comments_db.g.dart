// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comments_db.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentsList _$CommentsListFromJson(Map<String, dynamic> json) => CommentsList(
      name: json['name'] as String,
      email: json['email'] as String,
      body: json['body'] as String,
      id: json['id'] as int,
      postId: json['postId'] as int,
    );

Map<String, dynamic> _$CommentsListToJson(CommentsList instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'body': instance.body,
      'id': instance.id,
      'postId': instance.postId,
    };
