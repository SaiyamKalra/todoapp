import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/cubit/todo_cubit.dart';
import 'package:todoapp/models/todo.dart';
import 'package:todoapp/pages/add_task_screen.dart';
import 'package:todoapp/utils/glass_button.dart';
import 'package:todoapp/utils/todo_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, // Makes the body extend behind the footer
      appBar: AppBar(
        // Making the App bar part with text ToDo App displayed on it
        title: const Center(
          child: Text(
            '⌁ T O D O ⌁',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Stack(
        children: [
          BlocBuilder<TodoCubit, List<Todo>>(
            builder: (context, todos) {
              if (todos.isEmpty) {
                return const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'No tasks yet. Add one below!',
                        style: TextStyle(fontSize: 16.0, color: Colors.grey),
                      ),
                      SizedBox(height: 120),
                    ],
                  ),
                );
              }
              return ListView.builder(
                padding: const EdgeInsets.only(bottom: 80),
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  final todo = todos[index];
                  return Dismissible(
                    key: Key(
                      todo.data.toString(),
                    ), // Ensure each item has a unique key
                    direction: DismissDirection.horizontal,
                    background: Container(
                      height: 10,
                      color: const Color.fromARGB(16, 88, 58, 58),
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: const Icon(Icons.done, color: Colors.white),
                    ),
                    onDismissed: (direction) {
                      context.read<TodoCubit>().removeTodo(todo);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Task "${todo.data}" deleted')),
                      );
                    },
                    child: TodoCard(taskName: todo.data),
                  );
                },
              );
            },
          ),

          Positioned(
            left: 0,
            right: 0,
            bottom: 20,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GlassmorphicButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AddTaskScreen(),
                    ),
                  );
                },
                text: 'A D D  T A S K',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
