import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oktoast/oktoast.dart';
import 'package:todos_app/cubit/add_todo_cubit.dart';

class AddTodos extends StatelessWidget {
  AddTodos({Key? key}) : super(key: key);
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Todos")),
      body: BlocListener<AddTodoCubit, AddTodoState>(
        listener: (context, state) {
          if (state is AddTodoAdded) {
            Navigator.pop(context);
            return;
          } else if (state is AddTodoError) {
            showToast(state.error, backgroundColor: Colors.red);
          }
        },
        child: Container(
          margin: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                autofocus: true,
                controller: _controller,
                decoration: InputDecoration(hintText: "Input your todo name?"),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 50.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.black,
                ),
                child: InkWell(
                  onTap: () {
                    final message = _controller.text;
                    BlocProvider.of<AddTodoCubit>(context).addTodo(message);
                  },
                  child: Center(
                    child: BlocBuilder<AddTodoCubit, AddTodoState>(
                      builder: (context, state) {
                        if (state is AddTodoLoading) {
                          return CircularProgressIndicator();
                        }
                        return Text(
                          "Add",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
