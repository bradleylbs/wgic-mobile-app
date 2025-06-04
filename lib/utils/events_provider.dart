import 'package:flutter/material.dart';

class EventsProvider extends ChangeNotifier {
  final List<Event> _events = [];

  List<Event> get events => List.unmodifiable(_events);

  void addEvent(Event event) {
    _events.add(event);
    notifyListeners();
  }
}

class Event {
  final String title;
  final DateTime dateTime;
  final String location;

  Event({required this.title, required this.dateTime, required this.location});
}
