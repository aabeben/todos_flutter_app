import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todos_app/data/models/todos.dart';
import 'package:todos_app/data/repository.dart';

part 'todos_state.dart';

class TodosCubit extends Cubit<TodosState> {
  Repository repo;
  TodosCubit({required this.repo}) : super(TodosInitial());

  void fetchTodos() async {
    Timer(Duration(seconds: 3), () async {
      final todos = await repo.fetchTodos();
      emit(TodosLoaded(todos: todos));
    });
  }

  void changeCompletion(Todo todo) async {
    final isChanged = await repo.changeCompletion(!todo.isCompleted, todo.id);
    if (isChanged) {
      todo.isCompleted = !todo.isCompleted;
      emit(TodosLoaded(todos: (state as TodosLoaded).todos));
    }
  }

  void addTodo(Todo createdTodo) {
    if (state is TodosLoaded) {
      (state as TodosLoaded).todos.add(createdTodo);
      emit(TodosLoaded(todos: (state as TodosLoaded).todos));
    }
  }
}
