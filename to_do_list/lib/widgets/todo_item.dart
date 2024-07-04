import 'package:flutter/material.dart';
import '../models/todo.dart';
import 'package:intl/intl.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;
  final VoidCallback onToggle;
  final VoidCallback onDelete;

  const TodoItem({
    required this.todo,
    required this.onToggle,
    required this.onDelete,
  });

    @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            todo.title,
            style: TextStyle(
              color: Colors.white, // Change the text color here
              decoration: todo.isDone ? TextDecoration.lineThrough : null,
            ),
          ),
          Text(
            DateFormat('yyyy-MM-dd – kk:mm').format(todo.dueDate),
            style: TextStyle(color: Colors.white70),
          ),
        ],
      ),
      leading: Theme(
        data: ThemeData(
          unselectedWidgetColor: Colors.white, // Change the checkbox border color here
        ),
        child: Checkbox(
          value: todo.isDone,
          onChanged: (value) => onToggle(),
          activeColor: Colors.white, // Change the fill color of the checkbox
          checkColor: Colors.black, // Change the check mark color
        ),
      ),
      trailing: IconButton(
        icon: Icon(Icons.delete, color: Colors.red), // Change the trash icon color to red
        onPressed: onDelete,
      ),
    );
  }
}
