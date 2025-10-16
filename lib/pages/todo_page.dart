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

  final List tasks = [];
  //  final List tasks = [
  //   ['Finding a Job', false],
  //   ['Walking with Bobby', false],
  //   ['Washing Dishes', false],
  // ];

  // checkBoxChnaged
  void checkBoxChnaged(int index) {
    setState(() {
      tasks[index][1] = !tasks[index][1];
    });
  }

  // saveNewTask
  void saveNewTask() {
    setState(() {
      _newTaskInputFieldController.text.isEmpty
          ? ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('No task to add ...'),
                duration: Duration(seconds: 3),
                backgroundColor: Color(0xFF4A3780),
              ),
            )
          : tasks.add([_newTaskInputFieldController.text, false]);
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

  // onDelete
  void onDelete(index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 44, 49, 55),
      appBar: AppBar(
        title: Text('T O D O', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: tasks.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'No Tasks ...',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4A3780),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Icon(
                    Icons.hourglass_empty,
                    size: 80,
                    color: Color(0xFF4A3780),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return TodoTile(
                  todoTask: tasks[index][0],
                  isCompleted: tasks[index][1],
                  onChanged: (value) {
                    checkBoxChnaged(index);
                  },
                  onDelete: (context) {
                    onDelete(index);
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
