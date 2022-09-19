import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/todos_model.dart';
import 'package:todo/widgets/task_list.dart';

class IncompleteTasksTab extends StatelessWidget {
  const IncompleteTasksTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TodosModel>(
      builder: (context, todos, child) => TaskList(
        tasks: todos.incompleteTasks,
      ),
    );
  }
}
