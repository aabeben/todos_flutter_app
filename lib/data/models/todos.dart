class Todo {
  String todoMessage;
  bool isCompleted;
  int id;

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
      todoMessage: json["todo"],
      isCompleted: json["isCompleted"] == "true",
      id: json["id"] as int);

  Todo(
      {required this.todoMessage, required this.isCompleted, required this.id});
}
