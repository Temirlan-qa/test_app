import '../../data/models/check_db.dart';
import 'services_api_provider.dart';
class ToDoRepository {
  final ToDoProvider _todoProvider = ToDoProvider();
  Future<List<TodosList>> getAllToDo() => _todoProvider.getToDo();
}