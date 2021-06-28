import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todos_app/cubit/edit_todo_cubit.dart';
import 'package:todos_app/data/models/todos.dart';

class EditTodos extends StatelessWidget {
  EditTodos({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _controller.text = todo.todoMessage;
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Todo"),
        actions: [
          InkWell(
            onTap: () {
              BlocProvider.of<EditTodoCubit>(context).deleteTodo();
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.delete),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              autocorrect: true,
              decoration: InputDecoration(
                hintText: "Change todo message",
              ),
            ),
            SizedBox(height: 10),
            InkWell(
              onTap: () {
                BlocProvider.of<EditTodoCubit>(context).updateTodo();
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 50.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    10.0,
                  ),
                ),
                child: Center(
                  child: Text("Update"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  final Todo todo;
  final TextEditingController _controller = TextEditingController();
}
