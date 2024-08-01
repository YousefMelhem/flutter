import 'package:flutter/material.dart';
import '../models/todo.dart';
import '../widgets/todo_item.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Todo> _todos = [];

  void _addTodo() {
    if (_controller.text.isEmpty) return;
    setState(() {
      _todos.add(Todo(
        title: _controller.text,
      ));
      _controller.clear();
    });
  }

  void _removeTodoAt(int index) {
    setState(() {
      _controller.text = _todos[index].title;
      _todos.removeAt(index);
    });
  }

  void _toggleTodoStatus(int index) {
    setState(() {
      _todos[index].isDone = !_todos[index].isDone;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ToDo List',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                labelText: 'Enter a task',
                labelStyle:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.add, color: Colors.black),
                  onPressed: _addTodo,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _todos.length,
                itemBuilder: (context, index) {
                  final todo = _todos[index];
                  return TodoItem(
                    todo: todo,
                    onToggle: () => _toggleTodoStatus(index),
                    onDelete: () => _removeTodoAt(index),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
