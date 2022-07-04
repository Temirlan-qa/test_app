import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:test_app/presentation/pages/onlycomments.dart';
import '../../../../core/utils/colors.dart';
import '../../../../../../data/models/comments_db.dart';
import '../../../../../../data/datasources/chapter.dart';

// ignore: must_be_immutable
class CommentsScreen extends StatefulWidget {
  int postId;
  String title;
  String body;
  CommentsScreen(
      {Key? key, required this.postId, required this.title, required this.body})
      : super(key: key);

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  List<CommentsList> characterList = <CommentsList>[];

  Future<dynamic> getCharactersfromApi() async {
    GetApi.getComments().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        characterList =
            list.map((model) => CommentsList.fromJson(model)).toList();
      });
    });
  }

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
    getCharactersfromApi();
    getCommentsfromApi();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
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
      body: Container(
        padding: const EdgeInsets.only(left: 16, top: 33, right: 16),
        child: Column(
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                widget.body,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  fontFamily: 'Raleway',
                ),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            ListView.separated(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
              padding: const EdgeInsets.only(bottom: 10),
              itemCount: 5 == commentsList.length
                  ? commentsList.length - 3
                  : commentsList.length,
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
                          CircleAvatar(
                            backgroundColor:
                                const Color(0xFF263238).withOpacity(0.38),
                            child: const Icon(
                              Icons.person,
                              size: 16,
                              color: Color(0xFF979797),
                            ),
                          ),
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
                    ],
                  ),
                );
              },
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.only(
                top: 8,
                bottom: 8,
                left: 25,
              ),
              width: width,
              height: 64,
              decoration: const BoxDecoration(
                color: Color(0xFF6C63FF),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OnlyCommentsScreen(
                        title: widget.title,
                        postId: widget.postId,
                      ),
                    ),
                  );
                },
                child: Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Show me ',
                        style: const TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                              text: '${commentsList.length} results',
                              style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'Raleway',
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              )),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 125,
                    ),
                    const Icon(
                      Icons.remove_red_eye,
                      size: 32,
                      color: white,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

SizedBox sizedBox16() {
  return const SizedBox(
    height: 16,
  );
}
