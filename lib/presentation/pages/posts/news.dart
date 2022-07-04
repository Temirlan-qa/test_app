import 'dart:convert';
import 'package:flutter/material.dart';
import '../../../core/utils/colors.dart';
import '../../../data/datasources/chapter.dart';
import '../../../data/models/news_db.dart';
import '../comments/comments.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  List<NewsList> characterList = <NewsList>[];

  Future<dynamic> getCharactersfromApi() async {
    GetApi.getNews().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        characterList = list.map((model) => NewsList.fromJson(model)).toList();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getCharactersfromApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bodybgColor,
      appBar: appBar(),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemCount: characterList.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CommentsScreen(
                    postId: characterList[index].id,
                    title: characterList[index].title,
                    body: characterList[index].body,
                  ),
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Color(0xFF221C44),
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      characterList[index].title,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        fontSize: 16,
                        color: white,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Raleway',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      characterList[index].body,
                      style: const TextStyle(
                        fontSize: 14,
                        color: white,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Raleway',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

AppBar appBar() {
  return AppBar(
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
    title: const Text(
      'News ',
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w600,
        fontFamily: 'Raleway',
      ),
    ),
    centerTitle: true,
  );
}
