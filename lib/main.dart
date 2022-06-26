import 'package:flutter/material.dart';
import 'package:todoey/screens/tasks_screen.dart';
import 'models/models.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TaskListener>(
      create: (BuildContext context) => TaskListener(),
      child: MaterialApp(
        initialRoute: TasksScreen.id,
        routes: {
          TasksScreen.id : (context) => const TasksScreen()
        },
      ),
    );
  }
}

