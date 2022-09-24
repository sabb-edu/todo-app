import 'package:flutter/material.dart';
import 'package:todoapp/app/shared/models/task_model.dart';

class ItemListWidget extends StatefulWidget {
  const ItemListWidget({
    super.key,
    required this.item,
  });

  final TaskModel item;

  @override
  State<ItemListWidget> createState() => _ItemListWidgetState();
}

class _ItemListWidgetState extends State<ItemListWidget> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        setState(() {
          widget.item.change(!widget.item.isFinished);
        });
      },
      leading: Checkbox(
        onChanged: (value) {
          setState(() {
            widget.item.change(value!);
          });
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
