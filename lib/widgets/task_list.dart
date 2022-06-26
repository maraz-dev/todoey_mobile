import 'package:flutter/material.dart';
import 'task_tile.dart';
import 'package:todoey/models/models.dart';
import 'package:provider/provider.dart';

class TaskList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {


    return Consumer<TaskListener>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemCount: taskData.taskCount,
          itemBuilder: (context, index) {
            return TaskTile(
              taskTitle: taskData.tasks[index].taskName,
              isChecked: taskData.tasks[index].isDone,
              toggleCheckbox: (value) {
                taskData.updateTask(taskData.tasks[index]);
              },
              onLongPressCallback: () {
                taskData.removeTask(taskData.tasks[index]);
              },
            );
          },
        );
      },
    );
  }
}
