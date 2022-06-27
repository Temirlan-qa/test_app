// https://jsonplaceholder.typicode.com/posts
import 'package:json_annotation/json_annotation.dart';
part 'news_db.g.dart';

@JsonSerializable()
class NewsList {
  /// The generated code assumes these values exist in JSON.
  final String title, body;

  /// The generated code below handles if the corresponding JSON value doesn't
  /// exist or is empty.
  final int id ;

  NewsList({required this.title, required this.body,required this.id});

  /// Connect the generated [_$NewsListFromJson] function to the `fromJson`
  /// factory.
  factory NewsList.fromJson(Map<String, dynamic> json) => _$NewsListFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$NewsListToJson(this);
}
