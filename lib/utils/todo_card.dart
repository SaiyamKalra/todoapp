import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  const TodoCard({
    super.key,
    required this.taskName,
    this.onDelete,
    this.onToggle,
    this.isCompleted = false,
  });

  final String taskName;
  final VoidCallback? onDelete;
  final ValueChanged<bool>? onToggle;
  final bool isCompleted;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.white.withAlpha(25), Colors.white.withAlpha(5)],
          ),
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(color: Colors.white.withAlpha(50), width: 1.2),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(38),
              blurRadius: 12,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              if (onToggle != null)
                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: IconButton(
                    icon: Icon(
                      isCompleted ? Icons.check_circle : Icons.circle_outlined,
                      color: isCompleted ? Colors.green : Colors.grey[400],
                    ),
                    onPressed: () {
                      onToggle?.call(!isCompleted);
                    },
                  ),
                ),
              Expanded(
                child: Text(
                  taskName,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                    decoration: isCompleted ? TextDecoration.lineThrough : null,
                    color:
                        isCompleted
                            ? Colors.white.withAlpha(153)
                            : Colors.white.withAlpha(242),
                    shadows: [
                      Shadow(
                        color: Colors.black.withAlpha(77),
                        offset: Offset(0, 1),
                        blurRadius: 2,
                      ),
                    ],
                  ),
                ),
              ),
              if (onDelete != null)
                IconButton(
                  icon: const Icon(
                    Icons.delete_outline,
                    color: Colors.redAccent,
                  ),
                  onPressed: onDelete,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
