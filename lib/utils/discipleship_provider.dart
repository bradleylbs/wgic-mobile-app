import 'package:flutter/material.dart';

class DiscipleshipLesson {
  final String title;
  final String description;
  final bool completed;

  DiscipleshipLesson({required this.title, required this.description, this.completed = false});
}

class DiscipleshipProvider extends ChangeNotifier {
  final List<DiscipleshipLesson> _lessons = [
    DiscipleshipLesson(title: 'Salvation', description: 'Understanding the basics of salvation.'),
    DiscipleshipLesson(title: 'Prayer', description: 'How to pray and why it matters.'),
    DiscipleshipLesson(title: 'Bible Study', description: 'How to study the Bible effectively.'),
  ];

  List<DiscipleshipLesson> get lessons => List.unmodifiable(_lessons);

  void markCompleted(int index) {
    if (index >= 0 && index < _lessons.length) {
      _lessons[index] = DiscipleshipLesson(
        title: _lessons[index].title,
        description: _lessons[index].description,
        completed: true,
      );
      notifyListeners();
    }
  }
}
