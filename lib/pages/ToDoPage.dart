import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/util/dialog_box.dart';

import '../data/database.dart';
import '../util/to_to_tile.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  final TextEditingController addToDoController = TextEditingController();
  ToDoDataBase db = ToDoDataBase();

  final _myBox = Hive.box('MyBox');

  void checkBoxChange(bool? value, int index) {
    setState(() {
      db.toDoList[index]['isCompleted'] = !db.toDoList[index]['isCompleted'];
    });
    db.updateData();
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
      db.toDoList.add({
        'taskName': addToDoController.text,
        'isCompleted': false,
      });
    });
    Navigator.of(context).pop();
    addToDoController.clear();
    db.updateData();
  }

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateData();
  }

  @override
  void initState() {
    if (_myBox.get('TODOLIST') == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
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
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: db.toDoList[index]['taskName'],
            taskCompleted: db.toDoList[index]['isCompleted'],
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
