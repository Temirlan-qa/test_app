// https://jsonplaceholder.typicode.com/posts
import 'package:json_annotation/json_annotation.dart';
part 'gallery_db.g.dart';

@JsonSerializable()
class GalleryList {
  /// The generated code assumes these values exist in JSON.
  final String title;

  /// The generated code below handles if the corresponding JSON value doesn't
  /// exist or is empty.
  final int id ;

  GalleryList({required this.title,required this.id});

  /// Connect the generated [_$GalleryListFromJson] function to the `fromJson`
  /// factory.
  factory GalleryList.fromJson(Map<String, dynamic> json) => _$GalleryListFromJson(json);

  /// Connect the generated [_$GalleryListToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$GalleryListToJson(this);
}
