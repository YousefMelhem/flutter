class Todo {
  String title;
  DateTime dueDate;
  bool isDone;

  Todo({
    required this.title,
    required this.dueDate,
    this.isDone = false,
  });
}
