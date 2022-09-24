import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:todoapp/app/modules/home/widgets/app_bar_widget.dart';
import 'package:todoapp/app/modules/home/widgets/title_widget.dart';
import 'package:todoapp/app/shared/models/task_model.dart';

import 'widgets/item_title_widget.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  DateTime? date;
  final _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppBarWidget(),
      body: ListView(
        padding: const EdgeInsets.all(18.0),
        children: [
          const TitleWidget(text: 'Add a task'),
          const SizedBox(
            height: 50,
          ),
          _buildTitle(),
          const SizedBox(
            height: 20,
          ),
          _buildSelectHour(),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.black),
            ),
            onPressed: () {
              final item = TaskModel(
                isToday: true,
                time: '${date?.hour}:${date?.minute}',
                title: _nameController.text,
                isFinished: false,
              );
              Navigator.pop(context, item);
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Row(
      children: [
        const ItemTitleWidget(text: 'Name'),
        const SizedBox(
          width: 17,
        ),
        Expanded(
          child: TextField(
            controller: _nameController,
            decoration: const InputDecoration(
              hintText: 'Write something',
              hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSelectHour() {
    return Row(
      children: [
        const ItemTitleWidget(text: 'Hour'),
        const SizedBox(
          width: 17,
        ),
        Expanded(child: timePicker())
      ],
    );
  }

  Widget timePicker() {
    return TimePickerSpinner(
      is24HourMode: true,
      normalTextStyle: const TextStyle(fontSize: 14, color: Colors.grey),
      highlightedTextStyle: const TextStyle(
        fontSize: 24,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      spacing: 50,
      itemHeight: 100,
      isForce2Digits: true,
      onTimeChange: (time) {
        print(time.toString());
        setState(() {
          date = time;
        });
      },
    );
  }
}
