import 'package:flutter/material.dart';
import 'package:todoey/size-config.dart';
import 'package:todoey/widgets/widgets.dart';
import 'package:todoey/models/models.dart';
import 'package:provider/provider.dart';


class TasksScreen extends StatefulWidget {
  static const id = 'TasksScreen';
  const TasksScreen({Key? key}) : super(key: key);

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {

  TextEditingController controller = TextEditingController();
  String? addNewTask;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double? height = SizeConfig.screenHeight;
    double? width = SizeConfig.screenWidth;

    List listenedTask = Provider.of<TaskListener>(context).tasks;

    return Scaffold(
      backgroundColor: Colors.grey,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(
                top: height! * 0.2,
                left: width! * 0.07,
                right: width * 0.07,
                bottom: height * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: width * 0.07,
                    child: Icon(
                      Icons.list,
                      color: Colors.grey,
                      size: width * 0.08,
                    )),
                SizedBox(
                  height: height * 0.012,
                ),
                Text(
                  'Todoey',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: width * 0.1),
                ),
                Text(
                  '${listenedTask.length} Tasks',
                  style:
                      TextStyle(color: Colors.white, fontSize: width * 0.035),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(
                  top: height * 0.005,
                  left: width * 0.07,
                  right: width * 0.07,
                  bottom: height * 0.005),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(width * 0.09),
                      topRight: Radius.circular(width * 0.09))),
              child: listenedTask.isEmpty
                  ? const Center(
                      child: Text(
                      'Create a Task',
                      style: TextStyle(color: Colors.grey, fontSize: 20),
                    ))
                  : TaskList(),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey,
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            backgroundColor: Colors.transparent,
            builder: (context) {
              return BuildAddTaskBottomSheet(
                width: width,
                height: height,
              );
            },
          );
        },
        child: Icon(
          Icons.add,
          size: width * 0.06,
        ),
      ),
    );
  }
}
