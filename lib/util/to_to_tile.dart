import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChange;

  const ToDoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 25,
        left: 25,
        right: 25,
      ),
      child: Slidable(
        child: Container(
          padding: const EdgeInsets.all(25),
          decoration: const BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Row(
            children: [
              Checkbox(
                activeColor: Colors.black,
                value: taskCompleted,
                onChanged: onChange,
              ),
              Text(
                taskName,
                style: TextStyle(
                  decoration: taskCompleted ? TextDecoration.lineThrough : null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
