import 'package:json_annotation/json_annotation.dart';
part 'photos_db.g.dart';

@JsonSerializable()
class PhotoList {
  /// The generated code assumes these values exist in JSON.
  final String title, url;

  /// The generated code below handles if the corresponding JSON value doesn't
  /// exist or is empty.
  final int id,albumId;

  PhotoList({required this.title, required this.url,required this.id,required this.albumId,});

  // / Connect the generated [_$PhotoListFromJson] function to the `fromJson`
  /// factory.
  factory PhotoList.fromJson(Map<String, dynamic> json) => _$PhotoListFromJson(json);

  // / Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$PhotoListToJson(this);
}