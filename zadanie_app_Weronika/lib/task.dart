class Task {
  String title;
  bool isDone;
  String category;
  DateTime? deadline;
  String status;

  Task({
    required this.title,
    this.isDone = false,
    required this.category,
    this.deadline,
    this.status = 'Do zrobienia',
  });
}

