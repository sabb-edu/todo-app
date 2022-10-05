import 'package:hive/hive.dart';

part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel extends HiveObject {
  @HiveField(0)
  late String title;

  @HiveField(1)
  late String time;

  @HiveField(2)
  late bool isToday;

  @HiveField(3)
  late bool isFinished;

  TaskModel({
    required this.isToday,
    required this.time,
    required this.title,
    required this.isFinished,
  });

  void change(bool isFinish) {
    isFinished = isFinish;
  }
}
