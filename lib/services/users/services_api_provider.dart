import 'dart:convert';
import '../../data/models/contacts/contacts_db.dart';
import 'package:http/http.dart' as http;

class UserProvider {

  Future<List<ContactsList>> getContactsList() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (response.statusCode == 200) {
      final List<dynamic> userJson = json.decode(response.body);
      return userJson.map((json) => ContactsList.fromJson(json)).toList();
    } else {
      throw Exception('Error fetching users');
    }
  }
}