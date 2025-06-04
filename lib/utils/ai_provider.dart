import 'package:flutter/material.dart';

class AIProvider extends ChangeNotifier {
  // Example: last AI response
  String? lastResponse;

  Future<void> askAI(String question) async {
    // Simulate AI response (replace with real API call)
    await Future.delayed(const Duration(seconds: 1));
    lastResponse = 'Simulated AI answer for: "$question"';
    notifyListeners();
  }
}
