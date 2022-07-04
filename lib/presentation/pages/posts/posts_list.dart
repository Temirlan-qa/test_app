import 'dart:developer';
import 'package:shimmer/shimmer.dart';
import '../../../core/utils/colors.dart';
import '../../bloc/posts/posts_bloc.dart';
import '../../bloc/posts/posts_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../comments/comments_page.dart';
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
          return getShimmerLoading();
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
                  showNotification(context, state.loadedPosts[index].id,
                      state.loadedPosts[index].title);
                  // CommentsScreen
                },
                child: Container(
                  // height: 160,
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

Shimmer getShimmerLoading() {
  return Shimmer.fromColors(
    baseColor: Colors.white,
    highlightColor: const Color(0xFF221C44),
    child: ListView.separated(
      padding: const EdgeInsets.all(16),
      separatorBuilder: (BuildContext context, int index) => const Divider(),
      itemCount: 20,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          child: Container(
            height: 160,
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Color(0xFF221C44),
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            child: Column(
              children: const [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    '',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 16,
                      color: white,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Raleway',
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    '',
                    style: TextStyle(
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
