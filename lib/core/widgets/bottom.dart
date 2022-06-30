import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../../presentation/pages/gallery/gallery_page.dart';
import '../../presentation/pages/posts/posts_page.dart';
import '../../presentation/pages/todo/todo_page.dart';
import '../../presentation/pages/users/contacts.dart';
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
            // android: AndroidNotificationDetails(channel.id, channel.name, channel.description,
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
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();

  //   FirebaseMessaging.instance.getToken().then((value) {
  //     print("FIREBASE TOKEN: $value");
  //   });

  //   //Foreground work
  //   FirebaseMessaging.instance.getInitialMessage();
  //   FirebaseMessaging.onMessage.listen((massage) {
  //     print(massage.notification!.body);
  //     print(massage.notification!.title);
  //   });

  //   // When the app is in background but opened and user taps
  //   // on the notifi.
  //   FirebaseMessaging.onMessageOpenedApp.listen((massage) {
  //     print(massage.data['route']);
  //   });
  // }

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
        // selectedItemColor: const Color(0xFF322C54),
        // background: linear-gradient(180deg, #322C54 0%, #231D49 100%);
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        // selectedFontSize: 13.0,
        // unselectedFontSize: 13.0,
        selectedItemColor: Colors.white,
        unselectedItemColor: const Color(0xFF7F78A7),
      ),
    );
  }
}

// BottomNavigationBar bottom() {
  // int _selectedIndex = 0;
  // static const TextStyle optionStyle =
  //     TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  // static const List<Widget> _widgetOptions = <Widget>[
  //   Text(
  //     'Index 0: Home',
  //     style: optionStyle,
  //   ),
  //   Text(
  //     'Index 1: Business',
  //     style: optionStyle,
  //   ),
  //   Text(
  //     'Index 2: School',
  //     style: optionStyle,
  //   ),
  // ];
  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }
//   return BottomNavigationBar(
//     items: const <BottomNavigationBarItem>[
//       BottomNavigationBarItem(
//         icon: Icon(
//           Icons.home,
//           size: 18,
//           color: Colors.white,
//         ),
//         label: 'News',
//         backgroundColor: Colors.white,
//       ),
//       BottomNavigationBarItem(
//         icon: Icon(
//           Icons.book,
//           size: 18,
//           color: Colors.white,
//         ),
//         label: 'Gallery',
//         backgroundColor: Colors.white,
//       ),
//       BottomNavigationBarItem(
//         icon: Icon(
//           Icons.favorite_border,
//           size: 18,
//           color: Colors.white,
//         ),
//         label: 'Check',
//         backgroundColor: Colors.white,
//       ),
//       BottomNavigationBarItem(
//         icon: Icon(
//           Icons.favorite_border,
//           size: 18,
//           color: Colors.white,
//         ),
//         label: 'Contacts',
//         backgroundColor: Colors.white,
//       ),
//     ],
//     selectedItemColor: const Color(0xFF322C54),
//     // background: linear-gradient(180deg, #322C54 0%, #231D49 100%);
//     currentIndex: _selectedIndex, 
//     onTap: _onItemTapped,
//   );
// }
