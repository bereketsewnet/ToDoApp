import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List toDoList = [];
  final _myBox = Hive.box('MyBox');

  void createInitialData() {
    toDoList = [
      {
        'taskName': 'Learn Flutter',
        'isCompleted': true,
      },
      {
        'taskName': 'Go to sleep',
        'isCompleted': false,
      },
    ];
  }

  void loadData() {
    toDoList = _myBox.get('TODOLIST');
  }

  void updateData() {
    _myBox.put('TODOLIST', toDoList);
  }
}
