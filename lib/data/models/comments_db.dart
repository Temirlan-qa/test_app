import 'package:json_annotation/json_annotation.dart';
part 'comments_db.g.dart';

@JsonSerializable()
class CommentsList {
  /// The generated code assumes these values exist in JSON.
  final String name, email, body;

  /// The generated code below handles if the corresponding JSON value doesn't
  /// exist or is empty.
  final int id,postId;

  CommentsList({required this.name, required this.email,required this.body,required this.id,required this.postId,});

  /// Connect the generated [_$CommentsListFromJson] function to the `fromJson`
  /// factory.
  factory CommentsList.fromJson(Map<String, dynamic> json) => _$CommentsListFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$CommentsListToJson(this);
}
