import 'package:flutter/material.dart';
import 'package:todoapp/app/shared/models/task_model.dart';
import 'package:todoapp/app/shared/repository/task_repository.dart';

class ItemListWidget extends StatefulWidget {
  const ItemListWidget({
    super.key,
    required this.item,
    required this.changeTask,
    required this.deleteTask,
  });

  final Function() changeTask;
  final Function() deleteTask;
  final TaskModel item;

  @override
  State<ItemListWidget> createState() => _ItemListWidgetState();
}

class _ItemListWidgetState extends State<ItemListWidget> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: IconButton(
        onPressed: () {
          widget.deleteTask();
        },
        icon: Icon(Icons.delete),
      ),
      leading: Checkbox(
        onChanged: (value) {
          setState(() {
            widget.item.change(value!);
          });
          widget.changeTask();
        },
        value: widget.item.isFinished,
      ),
      title: Text(
        widget.item.title,
        style: const TextStyle(
          fontSize: 14,
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        widget.item.time,
        style: const TextStyle(
          fontSize: 12,
          color: Colors.grey,
        ),
      ),
    );
  }
}
