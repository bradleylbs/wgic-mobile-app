import 'package:flutter/material.dart';

class QuizQuestion {
  final String question;
  final List<String> options;
  final int correctIndex;

  QuizQuestion({required this.question, required this.options, required this.correctIndex});
}

class QuizProvider extends ChangeNotifier {
  final List<QuizQuestion> _questions = [
    QuizQuestion(
      question: 'Who built the ark?',
      options: ['Moses', 'Noah', 'Abraham', 'David'],
      correctIndex: 1,
    ),
    QuizQuestion(
      question: 'What is the first book of the Bible?',
      options: ['Exodus', 'Genesis', 'Matthew', 'Psalms'],
      correctIndex: 1,
    ),
  ];

  int _current = 0;
  int _score = 0;
  bool _completed = false;

  List<QuizQuestion> get questions => List.unmodifiable(_questions);
  int get current => _current;
  int get score => _score;
  bool get completed => _completed;

  void answer(int selected) {
    if (_completed) return;
    if (selected == _questions[_current].correctIndex) {
      _score++;
    }
    if (_current < _questions.length - 1) {
      _current++;
    } else {
      _completed = true;
    }
    notifyListeners();
  }

  void reset() {
    _current = 0;
    _score = 0;
    _completed = false;
    notifyListeners();
  }
}
