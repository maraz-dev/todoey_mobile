import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {

  String? taskTitle;
  bool? isChecked;
  Function(bool?)? toggleCheckbox;
  Function()? onLongPressCallback;


  TaskTile({Key? key, this.taskTitle, this.isChecked, this.toggleCheckbox, this.onLongPressCallback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: onLongPressCallback,
      title: Text(
        taskTitle!,
        style: TextStyle(
            decoration: isChecked == true ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        activeColor: Colors.grey,
        value: isChecked,
        onChanged: toggleCheckbox,
      ),
    );
  }
}

