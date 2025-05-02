import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  const TodoCard({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
  });

  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
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
            child: Row(
              children: [
                Checkbox(
                  value: taskCompleted,
                  onChanged: onChanged,
                ), //value checks the original tick or not in the check box and onchange changes the value
                Text(
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    decoration:
                        taskCompleted
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                    decorationThickness: 4,
                  ),
                  taskName,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
