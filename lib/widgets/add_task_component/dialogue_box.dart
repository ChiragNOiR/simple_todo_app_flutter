import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/task.dart';
import 'package:todo/models/todos_model.dart';
import 'package:todo/styles/app_style.dart';

class DialogueBox extends StatefulWidget {
  const DialogueBox({super.key});

  @override
  State<DialogueBox> createState() => _DialogueBoxState();
}

class _DialogueBoxState extends State<DialogueBox> {
  final taskTitleController = TextEditingController();

  @override
  void dispose() {
    taskTitleController.dispose();
    super.dispose();
  }

  void onAdd() {
    final String textVal = taskTitleController.text;

    if (textVal.isNotEmpty) {
      final Task todo = Task(
        title: textVal,
      );
      Provider.of<TodosModel>(context, listen: false).addTodo(todo);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Add a New Task',
            style: AppStyle.h1Text,
          ),
          const SizedBox(
            height: 8,
          ),
          TextField(
            controller: taskTitleController,
            decoration: const InputDecoration(
              hintText: 'Add New Task',
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.purple),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Colors.purple.shade900),
              ),
              onPressed: onAdd,
              child: const Text('Submit'),
            ),
          )
        ],
      ),
    );
  }
}
