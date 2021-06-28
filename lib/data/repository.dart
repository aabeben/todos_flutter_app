import 'package:todos_app/data/network_service.dart';

import 'models/todos.dart';

class Repository {
  final NetworkService networkService;

  Repository({required this.networkService});
  Future<List<Todo>> fetchTodos() async {
    final todos = await networkService.fetchTodos();
    return todos.map((e) => Todo.fromJson(e as Map<String, dynamic>)).toList();
  }

  Future<bool> changeCompletion(bool isCompleted, int id) async {
    final todo = {"isCompleted": isCompleted.toString()};
    return await networkService.patchObject(todo, id);
  }

  Future<Todo?> addTodo(String message) async {
    final newTodo = {"todo": message, "isCompleted": "false"};
    final createdTodo = await networkService.addTodo(newTodo);
    return (createdTodo.isNotEmpty) ? Todo.fromJson(createdTodo) : null;
  }
}
