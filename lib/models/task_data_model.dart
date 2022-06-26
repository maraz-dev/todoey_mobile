import 'package:flutter/foundation.dart';
import 'models.dart';

class TaskListener extends ChangeNotifier {
  List<Task> tasks = [
    Task(taskName: 'Wash Plates'),
    Task(taskName: 'Code for an hour'),
    Task(taskName: 'Finish all your gigs')
  ];

  int get taskCount {
    return tasks.length;
  }

  void updateTask(Task task) {
    task.toggleCheckBox();
    notifyListeners();
  }

  void removeTask(Task task) {
    tasks.remove(task);
    notifyListeners();
  }
}