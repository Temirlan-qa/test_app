// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contacts_db.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactsList _$ContactsListFromJson(Map<String, dynamic> json) => ContactsList(
      name: json['name'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      website: json['website'] as String,
      id: json['id'] as int,
      address: AdressList.fromJson(json['address'] as Map<String, dynamic>),
      company: CompanyList.fromJson(json['company'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ContactsListToJson(ContactsList instance) =>
    <String, dynamic>{
      'name': instance.name,
      'username': instance.username,
      'email': instance.email,
      'phone': instance.phone,
      'website': instance.website,
      'id': instance.id,
      'address': instance.address.toJson(),
      'company': instance.company.toJson(),
    };
