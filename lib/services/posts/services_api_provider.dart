import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_app/data/models/news_db.dart';

class PostsProvider {
  Future<List<NewsList>> getNews() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      final List<dynamic> postsJson = json.decode(response.body);
      return postsJson.map((json) => NewsList.fromJson(json)).toList();
    } else {
      throw Exception('Error fetching users');
    }
  }
}