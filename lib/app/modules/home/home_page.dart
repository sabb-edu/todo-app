import 'package:flutter/material.dart';
import 'package:todoapp/app/modules/home/widgets/app_bar_widget.dart';
import 'package:todoapp/app/modules/home/widgets/item_list_widget.dart';
import 'package:todoapp/app/modules/home/widgets/title_widget.dart';
import 'package:todoapp/app/shared/models/task_model.dart';
import 'package:todoapp/app/shared/repository/task_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<TaskModel> allTasks = [];

  bool isLoading = false;

  void getAllTasks() async {
    setState(() {
      isLoading = true;
    });
    final taskRepository = TaskRepository();

    final tasks = await taskRepository.getAll();
    setState(() {
      allTasks = tasks;
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getAllTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () async {
          final result = await Navigator.pushNamed(context, '/add-task');
          if (result != null) {
            await TaskRepository.addNewTask(result as TaskModel);
            getAllTasks();
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
            const TitleWidget(text: 'Todo'),
            _buildTaskList(),
          ],
        ),
      ),
    );
  }

  Widget _buildTaskList() {
    if (isLoading) {
      return const CircularProgressIndicator();
    }
    if (allTasks.isEmpty) {
      return const Center(child: Text("Sem atividades registradas"));
    }
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) => ItemListWidget(
          item: allTasks[index],
          changeTask: () async {
            await TaskRepository.changeTheTask(index, allTasks[index]);
            getAllTasks();
          },
          deleteTask: () async {
            await TaskRepository.deleteTask(allTasks[index]);
            getAllTasks();
          },
        ),
        itemCount: allTasks.length,
      ),
    );
  }
}
