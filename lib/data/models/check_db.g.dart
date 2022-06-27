// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_db.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodosList _$TodosListFromJson(Map<String, dynamic> json) => TodosList(
      title: json['title'] as String,
      completed: json['completed'] as bool,
      id: json['id'] as int,
    );

Map<String, dynamic> _$TodosListToJson(TodosList instance) => <String, dynamic>{
      'title': instance.title,
      'completed': instance.completed,
      'id': instance.id,
    };
