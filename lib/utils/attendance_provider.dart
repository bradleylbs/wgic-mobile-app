import 'package:flutter/material.dart';

/// AttendanceProvider manages check-in and attendance data for members.
class AttendanceProvider extends ChangeNotifier {
  final List<AttendanceRecord> _records = [];

  List<AttendanceRecord> get records => List.unmodifiable(_records);

  void checkIn(String memberId, DateTime dateTime) {
    _records.add(AttendanceRecord(memberId: memberId, dateTime: dateTime));
    notifyListeners();
  }

  int get totalCheckIns => _records.length;
}

class AttendanceRecord {
  final String memberId;
  final DateTime dateTime;

  AttendanceRecord({required this.memberId, required this.dateTime});
}
