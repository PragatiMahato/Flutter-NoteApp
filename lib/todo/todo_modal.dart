import 'package:flutter/cupertino.dart';

class Todo {
  final String task;
  final int id;
  bool isDone;

  Todo({required this.task, required this.id,this.isDone = false});
}

class TodoProvider with ChangeNotifier {
  final List<Todo> _todos = [];

  List<Todo> get todos => _todos;

  void addTodo(Todo todo) {
    _todos.add(todo);
    notifyListeners();
  }

 void removeNote(Todo todo) {
    _todos.removeWhere((item) => item.id == todo.id);
    notifyListeners();
  }

  void toggleTodo(Todo todo) {
    final index = _todos.indexOf(todo);
    _todos[index].isDone = !_todos[index].isDone;
    notifyListeners();
  }
}
