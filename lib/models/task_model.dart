
class Task {
  String? taskName;
  bool? isDone;

  Task({this.taskName, this.isDone = false});

  void toggleCheckBox() {
    isDone = !isDone!;

  }
}