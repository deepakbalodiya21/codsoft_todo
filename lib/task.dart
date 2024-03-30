// task.dart
import 'dart:convert';

class Task {
  String title;
  String description;
  bool isCompleted;
  DateTime dueDate;
  int priority; // 1: Low, 2: Medium, 3: High

  Task({
    required this.title,
    this.description = '',
    this.isCompleted = false,
    required this.dueDate,
    this.priority = 2,
  });

  static List<Task> decodeTasks(List<String> encodedTasks) {
    return encodedTasks.map((taskJson) {
      Map<String, dynamic> taskMap = jsonDecode(taskJson);
      return Task(
        title: taskMap['title'],
        description: taskMap['description'],
        isCompleted: taskMap['isCompleted'],
        dueDate: DateTime.now(),
      );
    }).toList();
  }

  static List<String> encodeTasks(List<Task> tasks) {
    return tasks.map((task) => jsonEncode({
      'title': task.title,
      'description': task.description,
      'isCompleted': task.isCompleted,
    })).toList();
  }
}
