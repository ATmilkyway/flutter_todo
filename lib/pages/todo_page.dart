import 'package:flutter/material.dart';
import 'package:todo/util/dialog_box.dart';
import 'package:todo/util/todo_tile.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final _newTaskInputFieldController = TextEditingController();

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

  // saveNewTask
  void saveNewTask() {
    setState(() {
      tasks.add([_newTaskInputFieldController.text, false]);
    });
    Navigator.of(context).pop();
    _newTaskInputFieldController.clear();
  }

  // addNew task
  void addNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          newTaskInputFieldController: _newTaskInputFieldController,
          onSave: saveNewTask,
          onCancel: Navigator.of(context).pop,
        );
      },
    );
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
        onPressed: () {
          // addNew task
          addNewTask();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
