import '../../../core/utils/colors.dart';
import '../../../services/posts/posts_repository.dart';
import '../../bloc/posts/posts_bloc.dart';
import '../../bloc/posts/posts_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'posts_list.dart';

class PostPage extends StatelessWidget {
  const PostPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => PostsRepository(),
      child: BlocProvider(
        create: (context) =>
            PostsBloc(postsRepository: context.read<PostsRepository>())
              ..add(PostsLoadEvent()),
        child: Scaffold(
          backgroundColor: bodybgColor,
          appBar: appBar(),
          body: PostsList(),
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
      'News',
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