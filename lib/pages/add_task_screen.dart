import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:todoapp/models/todo.dart';

import '../cubit/todo_cubit.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TextEditingController _taskController = TextEditingController();

  @override
  void dispose() {
    _taskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('A D D  N E W  T A S K'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: _taskController,
              decoration: const InputDecoration(
                labelText: 'Task Description',
                border: OutlineInputBorder(),
              ),
              maxLines: null, // Allows for multiline input
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                final taskText = _taskController.text.trim();
                if (taskText.isNotEmpty) {
                  final newTodo = Todo(
                    data: taskText,
                    createdAt: DateTime.now(),
                  );
                  BlocProvider.of<TodoCubit>(context).addTodo(newTodo);
                  Navigator.pop(context); // Go back to the previous screen
                } else {
                  // Optionally show an error message if the task is empty
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please enter a task.')),
                  );
                }
              },
              child: const Text('Add Task'),
            ),
          ],
        ),
      ),
    );
  }
}
