import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../core/utils/colors.dart';
import '../../../../../data/models/comments_db.dart';

// ignore: must_be_immutable
class OnlyCommentsScreen extends StatefulWidget {
  String title;
  int postId;
  OnlyCommentsScreen({Key? key, required this.title, required this.postId})
      : super(key: key);

  @override
  State<OnlyCommentsScreen> createState() => _OnlyCommentsScreenState();
}

class _OnlyCommentsScreenState extends State<OnlyCommentsScreen> {
  List<CommentsList> commentsList = <CommentsList>[];

  Future<dynamic> getCommentsfromApi() async {
    String w = widget.postId.toString();
    http
        .get(Uri.parse(
            "https://jsonplaceholder.typicode.com/comments?postId=$w"))
        .then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        commentsList =
            list.map((model) => CommentsList.fromJson(model)).toList();
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
          top: 25,
          bottom: 16,
        ),
        child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
          padding: const EdgeInsets.only(bottom: 10),
          itemCount: commentsList.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 165,
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Color(0xFF221C44),
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      avatar(),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Text(
                          commentsList[index].name,
                          style: const TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                  sizedBox16(),
                  Expanded(
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        commentsList[index].body,
                        style: const TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      backgroundColor: bodybgColor,
    );
  }
}


SizedBox sizedBox16() {
  return const SizedBox(
    height: 16,
  );
}

CircleAvatar avatar() {
  return CircleAvatar(
    // 263238
    backgroundColor: const Color(0xFF263238).withOpacity(0.38),
    child: const Icon(
      Icons.person,
      size: 16,
      color: Color(0xFF979797),
    ),
  );
}
