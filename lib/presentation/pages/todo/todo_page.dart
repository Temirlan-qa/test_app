import '../../../core/utils/colors.dart';
import '../../../services/todo/todo_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/todo/todo_bloc.dart';
import '../../bloc/todo/todo_event.dart';
import 'todo_list.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({Key? key}) : super(key: key);

  // final userRepository = UserRepository();

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => ToDoRepository(),
      child: BlocProvider(
        create: (context) =>
            ToDoBloc(todoRepository: context.read<ToDoRepository>())
              ..add(ToDoLoadEvent()),
        child: Scaffold(
          backgroundColor: bodybgColor,
          appBar: appBar(),
          body: const ToDoList(),
        ),
      ),
    );
  }
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
