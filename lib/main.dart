import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:todos_app/presentation/app_router.dart';

void main() {
  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  final appRouter;

  const MyApp({Key? key, this.appRouter}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Todos App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
