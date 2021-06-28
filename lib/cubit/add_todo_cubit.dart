import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todos_app/cubit/todos_cubit.dart';
import 'package:todos_app/data/repository.dart';

part 'add_todo_state.dart';

class AddTodoCubit extends Cubit<AddTodoState> {
  final Repository repo;
  final TodosCubit todosCubit;
  AddTodoCubit({required this.repo, required this.todosCubit})
      : super(AddTodoInitial());

  void addTodo(String message) {
    if (message.isEmpty) {
      emit(AddTodoError(error: "Todo message cannot be blank!"));
      return;
    }
    emit(AddTodoLoading());
    Timer(Duration(seconds: 2), () async {
      final createdTodo = await repo.addTodo(message);
      if (createdTodo != null) {
        todosCubit.addTodo(createdTodo);
        emit(AddTodoAdded());
      }
    });
  }
}
