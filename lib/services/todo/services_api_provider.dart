import 'dart:convert';
import '../../data/models/check_db.dart';
import 'package:http/http.dart' as http;

class ToDoProvider {

  // https://jsonplaceholder.typicode.com/posts

  Future<List<TodosList>> getToDo() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));

    if (response.statusCode == 200) {
      final List<dynamic> todoJson = json.decode(response.body);
      return todoJson.map((json) => TodosList.fromJson(json)).toList();
    } else {
      throw Exception('Error fetching users');
    }
  }
}