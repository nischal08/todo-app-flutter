import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTile;
  final Function checkboxCallback;

  TaskTile({this.isChecked, this.taskTile, this.checkboxCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTile,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        onChanged: checkboxCallback,
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
      ),
    );
  }
}

// class TaskCheckbox extends StatelessWidget {
//   final bool checkboxState;
//   final Function toggleCheckboxState;
//
//   TaskCheckbox({this.checkboxState, this.toggleCheckboxState});
//   @override
//   Widget build(BuildContext context) {
//     return;
//   }
// }
