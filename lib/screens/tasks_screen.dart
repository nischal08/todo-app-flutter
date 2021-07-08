import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'package:todoey_flutter/screens/add_task_screen.dart';
import 'package:todoey_flutter/widgets/tasks_list.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation:
          Provider.of<TaskData>(context).taskCount == 0
              ? FloatingActionButtonLocation.centerFloat
              : FloatingActionButtonLocation.endFloat,
      backgroundColor: Theme.of(context).primaryColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context, builder: (context) => AddTaskScreen());
        },
        child: Icon(Icons.add),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(
              top: 70.0,
              left: 30.0,
              right: 30.0,
              bottom: 30.0,
            ),
            child: Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      child: Icon(
                        Icons.fact_check_outlined,
                        size: 40.0,
                        color: Theme.of(context).primaryColor,
                      ),
                      backgroundColor: Colors.white,
                      radius: 30.0,
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Text(
                      "DoIt",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 50.0,
                          fontWeight: FontWeight.w700),
                    ),
                    
                  ],
                ),
                Text(
                  "${Provider.of<TaskData>(context).taskCount} tasks",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20.0),
                  topLeft: Radius.circular(20.0),
                ),
              ),
              child: Provider.of<TaskData>(context).taskCount == 0
                  ? Container(
                      width: double.infinity,
                      child: Column(
                        children: [
                           SizedBox(
                            height: 80,
                          ),
                          Container(
                            height: 110,
                            width: 110,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xffD7DEDE),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.done_rounded,
                                color: Color(0xff8C959A),
                                size: 60,
                              ),
                            ),
                          ),
                           SizedBox(
                            height: 40,
                          ),
                          Text(
                            "No Tasks",
                            style:
                                Theme.of(context).textTheme.headline5!.copyWith(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                          SizedBox(
                            height: 0,
                          ),
                          Text(
                            "Click + to add new tasks",
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(
                                    color: Colors.grey.shade600,
                                    fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    )
                  : TasksList(),
            ),
          ),
        ],
      ),
    );
  }
}
