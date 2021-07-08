import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTile;
  final checkboxCallback;
  

  TaskTile(
      {required this.isChecked,
      required this.taskTile,
      required this.checkboxCallback,
     });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              taskTile,
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    fontSize: 20,
                    decoration: isChecked ? TextDecoration.lineThrough : null,
                    fontWeight: FontWeight.w400
                  ),
            ),
          ),
          Transform.scale(
            scale: 1.3,
            child: Checkbox(
              splashRadius: 5,
              onChanged: checkboxCallback,
              activeColor: Colors.lightBlueAccent,
              value: isChecked,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
            ),
          ),
        ],
      ),
    );

  
  }
}

