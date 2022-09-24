import 'package:flutter/material.dart';
import 'package:todoapp/app/modules/add_task/add_task_page.dart';
import 'package:todoapp/app/modules/home/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      routes: {
        "/": (context) => const HomePage(),
        "/add-task": (context) => const AddTaskPage()
      },
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
    );
  }
}
