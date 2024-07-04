import 'package:flutter/material.dart';
import '../models/todo.dart';
import '../widgets/todo_item.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Todo> _todos = [];

  final TextEditingController _controller = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  void _addTodo() {
    final String title = _controller.text;
    if (title.isNotEmpty) {
      setState(() {
        _todos.add(Todo(
          title: title,
          dueDate: _selectedDate,
        ));
      });
      _controller.clear();
    }
  }

  void _toggleTodoStatus(int index) {
    setState(() {
      _todos[index].isDone = !_todos[index].isDone;
    });
  }

  void _removeTodo(int index) {
    setState(() {
      _todos.removeAt(index);
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
      });
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(_selectedDate),
    );
    if (picked != null)
      setState(() {
        _selectedDate = DateTime(
          _selectedDate.year,
          _selectedDate.month,
          _selectedDate.day,
          picked.hour,
          picked.minute,
        );
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 17, 17, 17), // Change the background color here
      appBar: AppBar(
        title: Text('To-Do List'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              style: TextStyle(color: Colors.white), // Change input text color here
              decoration: InputDecoration(
                labelText: 'Enter a task',
                labelStyle: TextStyle(color: Colors.purple), // Change label text color here
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.purple), // Change border color here
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.purple), // Change focused border color here
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.add, color: Colors.purple), // Change "+" button color here
                  onPressed: _addTodo,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => _selectDate(context),
                child: Text('Select date'),
              ),
              SizedBox(width: 8),
              ElevatedButton(
                onPressed: () => _selectTime(context),
                child: Text('Select time'),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _todos.length,
              itemBuilder: (context, index) {
                final todo = _todos[index];
                return TodoItem(
                  todo: todo,
                  onToggle: () => _toggleTodoStatus(index),
                  onDelete: () => _removeTodo(index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
