import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  final _taskBox = Hive.box('taskBox');
  List todoList = [];

  void createInitialData() {
    todoList = [
      ['Task 1 ...', false],
      ['Task 2 ...', false],
    ];
  }

  void loadData() {
    todoList = _taskBox.get('TODOLIST');
  }

  void updateDatabase() {
    _taskBox.put('TODOLIST', todoList);
  }
}
