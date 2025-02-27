import 'package:flutter/material.dart';
import 'task.dart';

class EditTaskDialog extends StatefulWidget {
  final Task task;

  EditTaskDialog({required this.task});

  @override
  _EditTaskDialogState createState() => _EditTaskDialogState();
}

class _EditTaskDialogState extends State<EditTaskDialog> {
  late TextEditingController _titleController;
  late String _status;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.task.title);
    _status = widget.task.status;
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Edytuj zadanie'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _titleController,
            decoration: InputDecoration(labelText: 'Tytuł zadania'),
          ),
          DropdownButton<String>(
            value: _status,
            onChanged: (String? newValue) {
              setState(() {
                _status = newValue!;
              });
            },
            items: <String>['Do zrobienia', 'W trakcie', 'Ukończone']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Anuluj'),
        ),
        TextButton(
          onPressed: () {
            final updatedTask = Task(
              title: _titleController.text,
              isDone: widget.task.isDone,
              category: widget.task.category,
              deadline: widget.task.deadline,
              status: _status,
            );
            Navigator.of(context).pop(updatedTask);
          },
          child: Text('Zapisz'),
        ),
      ],
    );
  }
}