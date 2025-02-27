import 'package:flutter/material.dart';
import 'task.dart';
import 'edit_task_dialog.dart';

class TaskList extends StatefulWidget {
  final List<Task> tasks;

  TaskList({required this.tasks});

  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.tasks.length,
      itemBuilder: (context, index) {
        final task = widget.tasks[index];
        return ListTile(
          title: Text(task.title),
          trailing: IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              _editTask(context, task);
            },
          ),
        );
      },
    );
  }

  void _editTask(BuildContext context, Task task) async {
    final updatedTask = await showDialog<Task>(
      context: context,
      builder: (context) {
        return EditTaskDialog(task: task);
      },
    );

    if (updatedTask != null) {
      setState(() {
        final index = widget.tasks.indexOf(task);
        widget.tasks[index] = updatedTask;
      });
    }
  }
}