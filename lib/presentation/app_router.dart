import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todos_app/constants/strings.dart';
import 'package:todos_app/cubit/add_todo_cubit.dart';
import 'package:todos_app/cubit/edit_todo_cubit.dart';
import 'package:todos_app/cubit/todos_cubit.dart';
import 'package:todos_app/data/models/todos.dart';
import 'package:todos_app/data/network_service.dart';
import 'package:todos_app/data/repository.dart';
import 'package:todos_app/presentation/screens/add_todos.dart';
import 'package:todos_app/presentation/screens/edit_todos.dart';
import 'package:todos_app/presentation/screens/home_todos.dart';

class AppRouter {
  late Repository repo;
  late TodosCubit todosCubit;

  AppRouter() {
    repo = Repository(
      networkService: NetworkService(),
    );
    todosCubit = TodosCubit(
      repo: repo,
    );
  }

  Route generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case HOME_ROUTE:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: todosCubit,
            child: HomeTodos(),
          ),
        );
      case EDIT_ROUTE:
        var todo = routeSettings.arguments as Todo;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                EditTodoCubit(repo: repo, todosCubit: todosCubit),
            child: EditTodos(
              todo: todo,
            ),
          ),
        );
      case ADD_ROUTE:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => AddTodoCubit(
              repo: repo,
              todosCubit: todosCubit,
            ),
            child: AddTodos(),
          ),
        );
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child:
                        Text("No such route defined for {$routeSettings.name}"),
                  ),
                ));
    }
  }
}
