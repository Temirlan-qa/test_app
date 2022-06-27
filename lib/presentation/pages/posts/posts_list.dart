import 'dart:developer';
import '../../../core/utils/colors.dart';
import '../../bloc/posts/posts_bloc.dart';
import '../../bloc/posts/posts_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../comments/comments_page.dart';
//
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class PostsList extends StatelessWidget {
  PostsList({Key? key}) : super(key: key);
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  void showNotification(BuildContext context, postId, title) {
    flutterLocalNotificationsPlugin.show(
      0,
      "Post ID: $postId",
      "Post title is $title",
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

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostsBloc, PostsState>(
      listener: ((context, state) {
        log(state.toString());
        if (state is PostsLoadedState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Posts is Loaded')));
        }
      }),
      builder: (context, state) {
        if (state is PostsEmptyState) {
          return const Center(
            child: Text(
              'No data received. Please button "Load"',
              style: TextStyle(fontSize: 20),
            ),
          );
        }

        if (state is PostsLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is PostsLoadedState) {
          return ListView.separated(
            padding: const EdgeInsets.all(16),
            // itemBuilder:
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
            itemCount: state.loadedPosts.length,
            // itemCount: snapshot.data?,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CommentsPage(
                        postId: state.loadedPosts[index].id,
                        title: state.loadedPosts[index].title,
                        body: state.loadedPosts[index].body,
                      ),
                    ),
                  );
                  showNotification(context, state.loadedPosts[index].id,state.loadedPosts[index].title);
                  // CommentsScreen
                },
                child: Container(
                  // height: 95,
                  // width: 358,
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    color: Color(0xFF221C44),
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  // padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          state.loadedPosts[index].title,
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
                          state.loadedPosts[index].body,
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
          );
        }
// state.loadedPosts[index].title,
        if (state is PostsErrorState) {
          return const Center(
            child: Text(
              'Error fetching users',
              style: TextStyle(fontSize: 20.0),
            ),
          );
        }
        return const SizedBox.shrink();
      },
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
    // backgroundColor: Color(0xFF322C54),
    //  #322C54 ,#231D49
    flexibleSpace: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          // colors: <Color>[Colors.black,Colors.white,]
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
