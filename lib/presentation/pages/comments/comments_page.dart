import 'package:test_app/presentation/pages/comments/comments_list.dart';
import '../../../core/utils/colors.dart';
import '../../../services/comments/comments_repository.dart';
import '../../bloc/comments/comments_bloc.dart';
import '../../bloc/comments/comments_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentsPage extends StatefulWidget {
  int postId;
  String title;
  String body;
  CommentsPage(
      {Key? key, required this.postId, required this.title, required this.body})
      : super(key: key);

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => CommentsListRepository(),
      child: BlocProvider(
        create: (context) => CommentsBloc(
            commentsRepository: context.read<CommentsListRepository>())
          ..add(CommentsLoadEvent(widget.postId)),
        child: Scaffold(
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
              widget.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
                fontFamily: 'Raleway',
              ),
            ),
            centerTitle: true,
          ),
          body: CommentsListScreen(body: widget.body, postId: widget.postId,title: widget.title,),
        ),
      ),
    );
  }
}
