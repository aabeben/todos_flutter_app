import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todos_app/cubit/todos_cubit.dart';
import 'package:todos_app/data/repository.dart';

part 'edit_todo_state.dart';

class EditTodoCubit extends Cubit<EditTodoState> {
  EditTodoCubit({required this.repo, required this.todosCubit})
      : super(EditTodoInitial());
  final Repository repo;
  final TodosCubit todosCubit;

  void deleteTodo() {}

  void updateTodo() {}
}
