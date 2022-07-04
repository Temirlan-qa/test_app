import 'package:json_annotation/json_annotation.dart';
import 'package:test_app/data/models/contacts/company.dart';
import 'adress.dart';
part 'contacts_db.g.dart';

@JsonSerializable(explicitToJson: true)
class ContactsList {
  final String name, username, email, phone, website;
  final int id;
  final AdressList address;
  final CompanyList company;

  ContactsList(
      {required this.name,
      required this.username,
      required this.email,
      required this.phone,
      required this.website,
      required this.id,
      required this.address,
      required this.company});

  /// Connect the generated [_$ContactsListFromJson] function to the `fromJson`
  /// factory.
  factory ContactsList.fromJson(Map<String, dynamic> json) =>
      _$ContactsListFromJson(json);

  /// Connect the generated [_$ContactsListToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ContactsListToJson(this);
}


