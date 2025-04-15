import 'package:flutter/material.dart';
import 'package:todoapp/utils/todo_list.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  List toDoList = [
    ['Learn App Development', false],
    ['Drink Coffee', false],
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //Making the App bar part with text ToDo App displayed on it
        title: Center(
          child: Text(
            'ToDo App',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: ListView.builder(
        //items displayed using a list
        itemCount: toDoList.length,
        itemBuilder: (BuildContext context, index) {
          return TodoList();
        },
      ),
    );
  }
}
