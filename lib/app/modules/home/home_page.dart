import 'package:flutter/material.dart';
import 'package:todoapp/app/modules/home/widgets/app_bar_widget.dart';
import 'package:todoapp/app/modules/home/widgets/item_list_widget.dart';
import 'package:todoapp/app/modules/home/widgets/title_widget.dart';
import 'package:todoapp/app/shared/models/task_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<TaskModel> allTasks = [
    TaskModel(
      isToday: true,
      time: '10:00',
      title: 'Fazer um app',
      isFinished: false,
    ),
    TaskModel(
      isToday: true,
      time: '10:00',
      title: 'Fazer atividade',
      isFinished: true,
    ),
    TaskModel(
      isToday: true,
      time: '10:00',
      isFinished: false,
      title: 'Limpar a casa',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () async {
          final result = await Navigator.pushNamed(context, '/add-task');
          if (result != null) {
            setState(() {
              allTasks.add(result as TaskModel);
            });
          }
        },
        child: const Icon(Icons.add),
      ),
      backgroundColor: Colors.white,
      appBar: const AppBarWidget(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TitleWidget(text: 'Today'),
            _buildTaskList(),
          ],
        ),
      ),
    );
  }

  Widget _buildTaskList() {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) => ItemListWidget(
          item: allTasks[index],
        ),
        itemCount: allTasks.length,
      ),
    );
  }
}
