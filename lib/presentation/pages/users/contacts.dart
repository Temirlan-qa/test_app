import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:test_app/presentation/pages/profile.dart';
import '../../../core/utils/colors.dart';
import 'dart:async';
import '../../../../data/datasources/chapter.dart';
import '../../../data/models/contacts/contacts_db.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  List<ContactsList> characterList = <ContactsList>[];

  Future<dynamic> getCharactersfromApi() async {
    GetApi.getUsers().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        characterList =
            list.map((model) => ContactsList.fromJson(model)).toList();
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
      body: FutureBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (characterList.isEmpty) {
            return const Center(
              child: Text(
                'Error or Loading',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Raleway',
                  fontSize: 16
                ),
              ),
            );
          } else {
            return ListView.separated(
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(
                height: 18,
              ),
              padding: const EdgeInsets.all(16),
              itemCount: characterList.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfileScreen(
                          company: characterList[index].company.name,
                          address: characterList[index].address.street,
                          name: characterList[index].name,
                          email: characterList[index].email,
                          web_site: characterList[index].website,
                          phone_number: characterList[index].phone,
                        ),
                      ),
                    );
                  },
                  leading: icon(),
                  title: Text(
                    characterList[index].name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

Icon icon() {
  return const Icon(
    Icons.person,
    size: 16,
    color: Color(0xFF979797),
  );
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
      'Contacts',
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
