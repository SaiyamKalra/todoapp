import 'package:flutter/material.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      //padding for edges
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        height: 150,
        child: Card(
          elevation: 20,
          child: Center(
            child: Text(
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              toDoList[index][0],
            ),
          ),
        ),
      ),
    );
  }
}
