class TaskModel {
  late String title;
  late String time;
  late bool isToday;
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
