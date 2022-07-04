import 'dart:convert';
import 'package:flutter/material.dart';
import '../../../../data/models/check_db.dart';
import '../../../../data/datasources/chapter.dart';
import '../../../core/utils/colors.dart';

class CheckScreen extends StatefulWidget {
  const CheckScreen({Key? key}) : super(key: key);

  @override
  State<CheckScreen> createState() => _CheckScreenState();
}

class _CheckScreenState extends State<CheckScreen> {
  List<TodosList> characterList = <TodosList>[];

  void getCharactersfromApi() async {
    GetApi.getTodos().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        characterList = list.map((model) => TodosList.fromJson(model)).toList();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getCharactersfromApi();
  }

  void checkBoxCallBack(bool? checkBoxState) {
    if (checkBoxState != null) {
      setState(() {});
    }
  }
  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
      };
      if (states.any(interactiveStates.contains)) {
        return const Color(0xFF6C63FF);
      }
      return const Color(0xFF7F78A7);
    }

    return Scaffold(
      backgroundColor: bodybgColor,
      appBar: appBar(),
      body: ListView.builder(
        itemCount: characterList.length,
        itemBuilder: (BuildContext context, int index) {
          return SingleChildScrollView(
            child: Container(
              color: true == characterList[index].completed
                  ? const Color(0xFF6C63FF).withOpacity(0.24)
                  : bodybgColor,
              margin: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 16,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Checkbox(
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value:
                        true == characterList[index].completed ? true : false,
                    onChanged: checkBoxCallBack,
                    checkColor: bodybgColor,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Text(
                      characterList[index].title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'Raleway',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
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
      'Check',
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
