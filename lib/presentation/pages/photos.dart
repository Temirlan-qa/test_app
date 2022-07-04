import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../../core/utils/colors.dart';
import '../../../../data/models/photos_db.dart';

// ignore: must_be_immutable
class PhotoScreen extends StatefulWidget {
  String title;
  int albumId;
  PhotoScreen({Key? key, required this.title, required this.albumId})
      : super(key: key);

  @override
  State<PhotoScreen> createState() => _PhotoScreenState();
}

class _PhotoScreenState extends State<PhotoScreen> {
  List<PhotoList> photoList = <PhotoList>[];

  Future<dynamic> getCommentsfromApi() async {
    String albumId = widget.albumId.toString();
    http
        .get(Uri.parse(
            "https://jsonplaceholder.typicode.com/photos?albumId=$albumId"))
        .then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        photoList = list.map((model) => PhotoList.fromJson(model)).toList();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getCommentsfromApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bodybgColor,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: appbarColor,
            ),
          ),
        ),

        elevation: 0,
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            fontFamily: 'Raleway',
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 14,
        ),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 150,
            mainAxisSpacing: 6,
            crossAxisSpacing: 6,
            childAspectRatio: 1 / 1,
          ),
          itemCount: photoList.length,
          itemBuilder: (BuildContext ctx, index) {
            return Container(
              height: 111,
              decoration: const BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 14,
                  left: 11,
                  bottom: 9,
                  top: 80,
                ),
                child: Expanded(
                  child: Text(
                    photoList[index].title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'Raleway',
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
