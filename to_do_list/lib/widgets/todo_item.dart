import 'package:flutter/material.dart';
import '../models/todo.dart';

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
      title: Text(
        todo.title,
        style: TextStyle(
          color: Colors.white,
          decoration: todo.isDone ? TextDecoration.lineThrough : null,
        ),
      ),
      leading: Theme(
        data: ThemeData(unselectedWidgetColor: Colors.white),
        child: Checkbox(
        value: todo.isDone,
        onChanged: (value) => onToggle(),
        activeColor: Colors.white,
        checkColor: Colors.black,
      ),
      ),
      trailing: IconButton(
        icon: Icon(Icons.delete, color: Colors.red,),
        onPressed: onDelete,
      ),
    );
  }
}
