import 'package:http/http.dart' as http;
import 'dart:async';

class GetApi{
  static Future getNews(){
    return http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
  }
  static Future getComments(){
    return http.get(Uri.parse("https://jsonplaceholder.typicode.com/comments"));
  }
  static Future getAlbums(){
    return http.get(Uri.parse("https://jsonplaceholder.typicode.com/albums"));
  }
  static Future getPhotos(){
    return http.get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
  }
  static Future getTodos(){
    return http.get(Uri.parse("https://jsonplaceholder.typicode.com/todos"));
  }
  static Future getUsers(){
    return http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
  }
}