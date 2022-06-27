import 'package:json_annotation/json_annotation.dart';
part 'adress.g.dart';
@JsonSerializable()
class AdressList {
  final String street, suite, city, zipcode;

  AdressList(
      {required this.street,
      required this.suite,
      required this.city,
      required this.zipcode});

  /// Connect the generated [_$AdressListFromJson] function to the `fromJson`
  /// factory.
  factory AdressList.fromJson(Map<String, dynamic> json) => _$AdressListFromJson(json);

  /// Connect the generated [_$AdressListToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$AdressListToJson(this);
}
