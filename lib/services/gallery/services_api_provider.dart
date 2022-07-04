import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test_app/data/models/gallery_db.dart';
class GalleryListProvider {
  Future<List<GalleryList>> getGalleryList() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));

    if (response.statusCode == 200) {
      final List<dynamic> postsJson = json.decode(response.body);
      return postsJson.map((json) => GalleryList.fromJson(json)).toList();
    } else {
      throw Exception('Error fetching users');
    }
  }
}