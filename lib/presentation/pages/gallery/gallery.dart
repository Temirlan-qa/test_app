import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:test_app/presentation/pages/photos.dart';
import '../../../core/utils/colors.dart';
import '../../../../data/datasources/chapter.dart';
import '../../../../data/models/gallery_db.dart';
class GalleryScreen extends StatefulWidget {
  const GalleryScreen({Key? key}) : super(key: key);

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  List<GalleryList> characterList = <GalleryList>[];

  Future<dynamic> getCharactersfromApi() async {
    GetApi.getAlbums().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        characterList = list.map((model) => GalleryList.fromJson(model)).toList();
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
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: bodybgColor,
      appBar: appBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 1 / 1,
          ),
          itemCount: characterList.length,
          itemBuilder: (BuildContext ctx, index) {
            return Container(
              height: height * 2.5,
              decoration: const BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PhotoScreen(
                        title: characterList[index].title,
                        albumId: characterList[index].id,
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 16,
                    left: 16,
                    bottom: 8,
                    top: 120,
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            characterList[index].title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'Raleway',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
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
      'Gallery',
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
