import '../../../data/models/check_db.dart';
abstract class ToDoState {}

class ToDoEmptyState extends ToDoState {}

class ToDoLoadingState extends ToDoState {}

class ToDoLoadedState extends ToDoState {
  List<TodosList> loadedToDo;
  ToDoLoadedState({
    required this.loadedToDo,
  });
}

class ToDoErrorState extends ToDoState {}