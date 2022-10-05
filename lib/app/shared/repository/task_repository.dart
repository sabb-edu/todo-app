import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapp/app/shared/models/task_model.dart';

class TaskRepository {
  static Future<void> addNewTask(TaskModel task) async {
    final box = Hive.box<TaskModel>('tasks');
    await box.add(task);
  }

  Future<List<TaskModel>> getAll() async {
    await Future.delayed(const Duration(seconds: 1));
    final box = Hive.box<TaskModel>('tasks');
    final values = box.values.toList();
    return values;
  }

  static Future<void> changeTheTask(int position, TaskModel task) async {
    final box = Hive.box<TaskModel>('tasks');
    await box.put(position, task);
  }

  static Future<void> deleteTask(TaskModel task) async {
    await task.delete();
  }
}
