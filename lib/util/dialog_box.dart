import 'package:flutter/material.dart';
import 'package:to_do_app/util/my_button.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController textController;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  const DialogBox({
    super.key,
    required this.textController,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: SizedBox(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextField(
              controller: textController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Add a new Task'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MyButton(
                  text: 'Add',
                  onPressed: onSave,
                ),
                MyButton(
                  text: 'Cancel',
                  onPressed: onCancel,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
