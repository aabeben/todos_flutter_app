import 'dart:convert';

import 'package:http/http.dart' as http;

import 'models/todos.dart';

class NetworkService {
  //final baseUrl = 'http://10.0.2.2:3000';
  final baseUrl = 'http://localhost:3000';
  Future<List> fetchTodos() async {
    try {
      final response = await http.get(Uri.parse(baseUrl + "/todos"));
      print("response.body: ${response.body}");
      return jsonDecode(response.body) as List;
    } catch (e) {
      print("Error: ${e.toString()}");
      return <Todo>[];
    }
  }

  Future<bool> patchObject(Map<String, String> todo, int id) async {
    try {
      await http.patch(Uri.parse(baseUrl + '/todos'), body: todo);
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  Future<Map<String, dynamic>> addTodo(Map<String, String> newTodo) async {
    try {
      final response =
          await http.post(Uri.parse(baseUrl + "/todos"), body: newTodo);
      return jsonDecode(response.body);
    } catch (e) {
      print(e.toString());
      return const {};
    }
  }
}
