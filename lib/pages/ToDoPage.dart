import 'package:flutter/material.dart';
import 'package:to_do_app/util/dialog_box.dart';

import '../util/to_to_tile.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  final TextEditingController addToDoController = TextEditingController();
  List toDoLists = [];

  void checkBoxChange(bool? value, int index) {
    setState(() {
      toDoLists[index]['isCompleted'] = !toDoLists[index]['isCompleted'];
      addToDoController.clear();
    });
  }

  void showDialogNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            textController: addToDoController,
            onSave: saveNewTask,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }

  void saveNewTask() {
    setState(() {
      toDoLists.add({
        'taskName': addToDoController.text,
        'isCompleted': false,
      });
    });
    Navigator.of(context).pop();
    addToDoController.clear();
  }

  void deleteTask(int index) {
    setState(() {
      toDoLists.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Text('To Do'),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: toDoLists.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: toDoLists[index]['taskName'],
            taskCompleted: toDoLists[index]['isCompleted'],
            onChange: (value) => checkBoxChange(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow,
        onPressed: showDialogNewTask,
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
