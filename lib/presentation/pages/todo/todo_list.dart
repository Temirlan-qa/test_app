import 'dart:developer';
import 'package:shimmer/shimmer.dart';
import '../../../core/utils/colors.dart';
import '../../bloc/todo/todo_bloc.dart';
import '../../bloc/todo/todo_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToDoList extends StatefulWidget {
  const ToDoList({Key? key}) : super(key: key);

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  void checkBoxCallBack(bool? checkBoxState) {
    if (checkBoxState != null) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
      };
      if (states.any(interactiveStates.contains)) {
        return const Color(0xFF6C63FF);
      }
      return const Color(0xFF7F78A7);
    }

    return BlocConsumer<ToDoBloc, ToDoState>(
      listener: ((context, state) {
        log(state.toString());
        if (state is ToDoLoadedState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('ToDo is Loaded')));
        }
      }),
      builder: (context, state) {
        if (state is ToDoEmptyState) {
          return const Center(
            child: Text(
              'No data received. Please button "Load"',
              style: TextStyle(fontSize: 20),
            ),
          );
        }

        if (state is ToDoLoadingState) {
          return getShimmerLoading(width,height);
        }

        if (state is ToDoLoadedState) {
          return ListView.builder(
            itemCount: state.loadedToDo.length,
            itemBuilder: (BuildContext context, int index) {
              return SingleChildScrollView(
                child: Container(
                  color: true == state.loadedToDo[index].completed
                      ? const Color(0xFF6C63FF).withOpacity(0.24)
                      : bodybgColor,
                  margin: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    top: 16,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Checkbox(
                        fillColor: MaterialStateProperty.resolveWith(getColor),
                        value: true == state.loadedToDo[index].completed
                            ? true
                            : false,
                        onChanged: checkBoxCallBack,
                        checkColor: bodybgColor,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Text(
                          state.loadedToDo[index].title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'Raleway',
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
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
        if (state is ToDoErrorState) {
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

Shimmer getShimmerLoading(width,hight) {
  return Shimmer.fromColors(
    baseColor: Colors.white,
    highlightColor: const Color(0xFF221C44),
    child: ListView.builder(
      itemCount: 40,
      itemBuilder: (BuildContext context, int index) {
        return SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(
              left: 16,
              right: 16,
              top: 16,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Icons.check_box_outline_blank),
                const SizedBox(
                  width: 5,
                ),
                Container(
                  width: width -100 ,
                  height: 10,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}
