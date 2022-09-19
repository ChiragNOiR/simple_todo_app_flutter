import 'package:flutter/material.dart';
import 'package:todo/models/task.dart';
import 'package:todo/models/todos_model.dart';
import 'package:provider/provider.dart';

class TaskListItem extends StatelessWidget {
  final Task task;

  const TaskListItem({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: task.completed,
        onChanged: (bool? checked) {
          Provider.of<TodosModel>(context, listen: false).toggleTodo(task);
        },
      ),
      title: Text(task.title),
      trailing: IconButton(
        icon: const Icon(
          Icons.delete_forever,
          color: Colors.grey,
        ),
        onPressed: () {
          Provider.of<TodosModel>(context, listen: false).deleteTodo(task);
        },
      ),
    );
  }
}
