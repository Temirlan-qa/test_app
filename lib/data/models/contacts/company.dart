import 'package:json_annotation/json_annotation.dart';
part 'company.g.dart';
@JsonSerializable()
class CompanyList {
  final String name, catchPhrase, bs;

  CompanyList(
      {
      required this.name,
      required this.bs,
      required this.catchPhrase,
      });

  /// Connect the generated [_$CompanyListFromJson] function to the `fromJson`
  /// factory.
  factory CompanyList.fromJson(Map<String, dynamic> json) => _$CompanyListFromJson(json);

  /// Connect the generated [_$CompanyListToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$CompanyListToJson(this);
}