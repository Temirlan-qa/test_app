import 'dart:developer';
import 'package:shimmer/shimmer.dart';

import '../../../core/utils/colors.dart';
import '../../bloc/comments/comments_bloc.dart';
import '../../bloc/comments/comments_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../onlycomments.dart';

class CommentsListScreen extends StatefulWidget {
  String body, title;
  int postId;
  CommentsListScreen(
      {Key? key, required this.postId, required this.title, required this.body})
      : super(key: key);

  @override
  State<CommentsListScreen> createState() => _CommentsListScreenState();
}

class _CommentsListScreenState extends State<CommentsListScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CommentsBloc, CommentsState>(
      listener: ((context, state) {
        log(state.toString());
        if (state is CommentsLoadedState) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Comments is Loaded')));
        }
      }),
      builder: (context, state) {
        if (state is CommentsEmptyState) {
          return const Center(
            child: Text(
              'No data received. Please button "Load"',
              style: TextStyle(fontSize: 20),
            ),
          );
        }

        if (state is CommentsLoadingState) {
          return getShimmerLoading();
        }

        if (state is CommentsLoadedState) {
          print(state.loadedComments.length);
          double width = MediaQuery.of(context).size.width;
          return Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(left: 16, top: 33, right: 16),
                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        widget.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
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
                      itemCount: 5 == state.loadedComments.length
                          ? state.loadedComments.length - 3
                          : state.loadedComments.length,
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
                                    // 263238
                                    backgroundColor: const Color(0xFF263238)
                                        .withOpacity(0.38),
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
                                      state.loadedComments[index].name,
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
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    state.loadedComments[index].body,
                                    style: const TextStyle(
                                      fontFamily: 'Raleway',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const Spacer(),
              // Show more
              Container(
                padding: const EdgeInsets.only(
                  top: 8,
                  bottom: 8,
                  left: 25,
                  right: 16,
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              text: '${state.loadedComments.length} results',
                              style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'Raleway',
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(
                        Icons.remove_red_eye,
                        size: 32,
                        color: white,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }
        if (state is CommentsErrorState) {
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
    child: Container(
      padding: const EdgeInsets.only(left: 16, top: 33, right: 16),
      child: Column(
        children: [
          Container(
            width: 340,
            height: 10,
            color: Colors.white,
          ),
          const SizedBox(
            height: 25,
          ),
          Container(
            width: 340,
            height: 50,
            color: Colors.white,
          ),
          const SizedBox(
            height: 32,
          ),
          Container(
            height: 165,
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Color(0xFF221C44),
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            height: 165,
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Color(0xFF221C44),
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
            ),
          ),
        ],
      ),
    ),
  );
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

SizedBox sizedBox16() {
  return const SizedBox(
    height: 16,
  );
}
