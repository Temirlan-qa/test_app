import 'package:json_annotation/json_annotation.dart';
part 'gallery_db.g.dart';

@JsonSerializable()
class GalleryList {
  final String title;
  final int id ;

  GalleryList({required this.title,required this.id});

  /// Connect the generated [_$GalleryListFromJson] function to the `fromJson`
  /// factory.
  factory GalleryList.fromJson(Map<String, dynamic> json) => _$GalleryListFromJson(json);

  /// Connect the generated [_$GalleryListToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$GalleryListToJson(this);
}
