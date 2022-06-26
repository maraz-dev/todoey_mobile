import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/models.dart';

class BuildAddTaskBottomSheet extends StatelessWidget {
  const BuildAddTaskBottomSheet(
      {Key? key,
      required this.width,
      required this.height,
      })
      : super(key: key);

  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {

    String? addedTask;
    TextEditingController controller = TextEditingController();

    return SingleChildScrollView(
      child: Container(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(width! * 0.09),
                topRight: Radius.circular(width! * 0.09))),
        child: Container(
          padding: EdgeInsets.only(
            top: height! * 0.03,
            left: width! * 0.07,
            right: width! * 0.07,
          ),
          child: Column(
            children: [
              Text(
                'Add Task',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: width! * 0.07),
              ),
              SizedBox(
                height: height! * 0.012,
              ),
              TextFormField(
                controller: controller,
                autofocus: true,
                textAlign: TextAlign.center,
                onChanged: (newValue) {
                  addedTask = newValue;
                },
              ),
              SizedBox(
                height: height! * 0.04,
              ),
              MaterialButton(
                color: Colors.grey,
                elevation: 0,
                minWidth: double.infinity,
                onPressed: () {
                  final addTask = Task(taskName: addedTask);
                  Provider.of<TaskListener>(context, listen: false).tasks.add(addTask);
                  controller.clear();
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: height! * 0.025),
                  child: const Text(
                    'Add',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              SizedBox(
                height: height! * 0.02,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
