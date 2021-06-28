part of 'add_todo_cubit.dart';

@immutable
abstract class AddTodoState {}

class AddTodoInitial extends AddTodoState {}

class AddTodoError extends AddTodoState {
  final String error;

  AddTodoError({required this.error});
}

class AddTodoLoading extends AddTodoState {}

class AddTodoAdded extends AddTodoState {}