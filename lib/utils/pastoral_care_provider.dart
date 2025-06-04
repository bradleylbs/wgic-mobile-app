import 'package:flutter/material.dart';

class PrayerRequest {
  final String name;
  final String request;
  final DateTime date;
  final bool isAnonymous;

  PrayerRequest({required this.name, required this.request, required this.date, this.isAnonymous = false});
}

class PastoralCareProvider extends ChangeNotifier {
  final List<PrayerRequest> _requests = [];

  List<PrayerRequest> get requests => List.unmodifiable(_requests);

  void addRequest(String name, String request, {bool isAnonymous = false}) {
    _requests.insert(0, PrayerRequest(
      name: isAnonymous ? 'Anonymous' : name,
      request: request,
      date: DateTime.now(),
      isAnonymous: isAnonymous,
    ));
    notifyListeners();
  }
}
