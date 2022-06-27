import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../data/models/comments_db.dart';

class CommentsListProvider {
  Future<List<CommentsList>> getCommentsList(int w) async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/comments?postId=$w'));

    if (response.statusCode == 200) {
      final List<dynamic> commentsListJson = json.decode(response.body);
      return commentsListJson.map((json) => CommentsList.fromJson(json)).toList();
    } else {
      throw Exception('Error fetching users');
    }
  }
}