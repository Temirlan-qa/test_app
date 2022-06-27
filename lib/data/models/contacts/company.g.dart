// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyList _$CompanyListFromJson(Map<String, dynamic> json) => CompanyList(
      name: json['name'] as String,
      bs: json['bs'] as String,
      catchPhrase: json['catchPhrase'] as String,
    );

Map<String, dynamic> _$CompanyListToJson(CompanyList instance) =>
    <String, dynamic>{
      'name': instance.name,
      'catchPhrase': instance.catchPhrase,
      'bs': instance.bs,
    };
