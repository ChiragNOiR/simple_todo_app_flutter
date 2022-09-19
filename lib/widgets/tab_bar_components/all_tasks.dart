import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/todos_model.dart';
import 'package:todo/widgets/task_list.dart';

class AllTasksTab extends StatelessWidget {
  const AllTasksTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TodosModel>(
      builder: (context, todos, child) => TaskList(
        tasks: todos.allTasks,
      ),
    );
  }
}
