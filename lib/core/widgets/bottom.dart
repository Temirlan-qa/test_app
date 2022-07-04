import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../../presentation/pages/gallery/gallery_page.dart';
import '../../presentation/pages/posts/posts_page.dart';
import '../../presentation/pages/todo/todo_page.dart';
import '../../presentation/pages/users/user_page.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class Bottom extends StatefulWidget {
  const Bottom({Key? key}) : super(key: key);

  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  @override
  void initState() {
    super.initState();
    FirebaseMessaging.instance.getInitialMessage();

    FirebaseMessaging.onMessage.listen((message) {
      if (message.notification != null) {
        print(message.notification!.title);
        print(message.notification!.body);
        flutterLocalNotificationsPlugin.show(
          1,
          message.notification!.title,
          message.notification!.body,
          const NotificationDetails(
            android: AndroidNotificationDetails(
              '1',
              '2',
              importance: Importance.high,
              color: Colors.blue,
              playSound: true,
              icon: '@mipmap/ic_launcher',
            ),
          ),
        );
      }
    });
  }
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    PostPage(),
    GalleryPage(),
    TodoPage(),
    HomePage(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 18,
            ),
            label: 'News',
            backgroundColor: Color(0xFF322C54),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.book,
              size: 18,
            ),
            label: 'Gallery',
            backgroundColor: Color(0xFF322C54),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_border,
              size: 18,
            ),
            label: 'Check',
            backgroundColor: Color(0xFF322C54),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_border,
              size: 18,
            ),
            label: 'Contacts',
            backgroundColor: Color(0xFF322C54),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.white,
        unselectedItemColor: const Color(0xFF7F78A7),
      ),
    );
  }
}