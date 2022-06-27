import '../../../data/models/check_db.dart';
import '../../../services/todo/todo_repository.dart';
import 'todo_event.dart';
import 'todo_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToDoBloc extends Bloc<ToDoEvent, ToDoState> {
  final ToDoRepository todoRepository;
  ToDoBloc({required this.todoRepository}) : super(ToDoEmptyState()) {
    on<ToDoLoadEvent>(
      (event, emit) async {
        emit(ToDoLoadingState());

        try {
          final List<TodosList> loadedToDoList = await todoRepository.getAllToDo();
          emit(ToDoLoadedState(loadedToDo: loadedToDoList));
        } catch (_) {
          emit(ToDoErrorState());
        }
      },
    );
  }
}