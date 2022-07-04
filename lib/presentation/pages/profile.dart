import 'package:flutter/material.dart';
import 'package:test_app/presentation/pages/map.dart';
import '../../core/utils/colors.dart';

class ProfileScreen extends StatefulWidget {
  final String name;
  final String email;
  final String phone_number;
  final String web_site;
  final String address;
  final String company;
  const ProfileScreen(
      {Key? key,
      required this.name,
      required this.email,
      required this.phone_number,
      required this.web_site,
      required this.address,
      required this.company})
      : super(key: key);
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
          widget.name,
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
        margin: const EdgeInsets.only(
          left: 24,
          right: 16,
          bottom: 33,
          top: 26,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              avatar(),
              sizedBoxHigh5(),
              Text(
                widget.name,
                style: const TextStyle(
                  fontFamily: 'Raleway',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              sizedBoxHigh5(),
              Text(
                widget.email,
                style: const TextStyle(
                  color: Color(0xFF6C63FF),
                  fontFamily: 'Raleway',
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              sizedBoxHigh18(),
              textFieldEmail(text: widget.email),
              sizedBoxHigh18(),
              textFieldPhone(text: widget.phone_number),
              sizedBoxHigh18(),
              textFieldWeb(text: widget.web_site),
              sizedBoxHigh18(),
              textFieldCompany(text: widget.company),
              sizedBoxHigh18(),
              textFieldAdress(text: widget.address),
              RaisedButton(
                child: const Text('Map withoout your location'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MapPage(),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

Container avatar() {
  return Container(
    height: 70,
    width: 70,
    decoration: BoxDecoration(
      color: const Color(
        0xFF263238,
      ).withOpacity(0.38),
      shape: BoxShape.circle,
    ),
    child: const Icon(
      Icons.person,
      size: 28,
      color: Color(0xFF979797),
    ),
  );
}

SizedBox sizedBoxHigh5() {
  return const SizedBox(
    height: 5,
  );
}

SizedBox sizedBoxHigh18() {
  return const SizedBox(
    height: 18,
  );
}

TextField textFieldEmail({required String text}) {
  late TextEditingController emailcontroller =
      TextEditingController(text: text);
  return TextField(
    controller: emailcontroller,
    style: const TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontFamily: 'Raleway',
      fontWeight: FontWeight.w400,
    ),
    readOnly: true,
    decoration: const InputDecoration(
      labelText: 'E-mail',
      labelStyle: TextStyle(
        color: Color(0xFF7F78A7),
        fontFamily: 'Raleway',
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(color: Color(0xFF7F78A7), width: 1.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(color: Color(0xFF7F78A7), width: 1.0),
      ),
    ),
  );
}

TextField textFieldPhone({required String text}) {
  late TextEditingController phone_number_controller =
      TextEditingController(text: text);
  return TextField(
    readOnly: true,
    controller: phone_number_controller,
    style: const TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontFamily: 'Raleway',
      fontWeight: FontWeight.w400,
    ),
    decoration: const InputDecoration(
      labelText: 'Phone number',
      labelStyle: TextStyle(
        color: Color(0xFF7F78A7),
        fontFamily: 'Raleway',
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(color: Color(0xFF7F78A7), width: 1.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(color: Color(0xFF7F78A7), width: 1.0),
      ),
    ),
  );
}

TextField textFieldWeb({required String text}) {
  late TextEditingController web_site_controller =
      TextEditingController(text: text);
  return TextField(
    readOnly: true,
    controller: web_site_controller,
    style: const TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontFamily: 'Raleway',
      fontWeight: FontWeight.w400,
    ),
    decoration: const InputDecoration(
      labelText: 'Website',
      labelStyle: TextStyle(
        color: Color(0xFF7F78A7),
        fontFamily: 'Raleway',
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
      // hintText: 'ripper228_1337@gmail.com',
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(color: Color(0xFF7F78A7), width: 1.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(color: Color(0xFF7F78A7), width: 1.0),
      ),
    ),
  );
}

TextField textFieldCompany({required String text}) {
  TextEditingController address_controller = TextEditingController(text: text);
  return TextField(
    controller: address_controller,
    readOnly: true,
    style: const TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontFamily: 'Raleway',
      fontWeight: FontWeight.w400,
    ),
    decoration: const InputDecoration(
      labelText: 'Company',
      labelStyle: TextStyle(
        color: Color(0xFF7F78A7),
        fontFamily: 'Raleway',
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(color: Color(0xFF7F78A7), width: 1.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(color: Color(0xFF7F78A7), width: 1.0),
      ),
    ),
  );
}

TextField textFieldAdress({required String text}) {
  TextEditingController address_controller = TextEditingController(text: text);
  return TextField(
    controller: address_controller,
    readOnly: true,
    style: const TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontFamily: 'Raleway',
      fontWeight: FontWeight.w400,
    ),
    decoration: const InputDecoration(
      labelText: 'Adress',
      labelStyle: TextStyle(
        color: Color(0xFF7F78A7),
        fontFamily: 'Raleway',
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(color: Color(0xFF7F78A7), width: 1.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(color: Color(0xFF7F78A7), width: 1.0),
      ),
    ),
  );
}
