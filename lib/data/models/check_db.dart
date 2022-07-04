import 'package:json_annotation/json_annotation.dart';
part 'check_db.g.dart';

@JsonSerializable()
class TodosList {
  final String title;
  final bool completed;
  final int id ;

  TodosList({required this.title, required this.completed,required this.id});

  /// Connect the generated [_$TodosListFromJson] function to the `fromJson`
  /// factory.
  factory TodosList.fromJson(Map<String, dynamic> json) => _$TodosListFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$TodosListToJson(this);
}
