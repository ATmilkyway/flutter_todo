import 'package:flutter/material.dart';
import 'package:todo/util/todo_tile.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final List tasks = [
    ['Finding a Job', false],
    ['Walking with Bobby', false],
    ['Washing Dishes', false],
  ];

  // checkBoxChnaged
  void checkBoxChnaged(int index) {
    setState(() {
      tasks[index][1] = !tasks[index][1];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1F5F9),
      appBar: AppBar(
        title: Text('T O D O', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return TodoTile(
            todoTask: tasks[index][0],
            isCompleted: tasks[index][1],
            onChanged: (value) {
              checkBoxChnaged(index);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
