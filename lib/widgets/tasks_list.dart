import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'package:todoey_flutter/widgets/task_tile.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, taskdata, _) {
      return ListView.builder(
        itemBuilder: (context, index) {
          final task = taskdata.tasks[index];
          return Dismissible(
            direction: DismissDirection.endToStart,
            confirmDismiss: (direction) {
              return showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text("Delete task"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                      child: Text("cancel"),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      },
                      child: Text("ok"),
                    ),
                  ],
                ),
              );
            },
            onDismissed: (direction) {
              taskdata.deleteTask(task);
            },
            background: Container(
              padding: EdgeInsets.only(right: 20),
              alignment: Alignment.centerRight,
              color: Theme.of(context).errorColor,
              child: Icon(
                Icons.delete_forever,
                size: 30,
                color: Colors.white,
              ),
            ),
            key: ValueKey(task.name),
            child: InkWell(
              onTap:  () => taskdata.updateTask(task),
              child: TaskTile(
                taskTile: task.name,
                isChecked: task.isDone,
                checkboxCallback: (checkboxState) {
                  taskdata.updateTask(task);
                },
              ),
            ),
          );
        },
        itemCount: taskdata.taskCount,
      );
    });
  }
}
