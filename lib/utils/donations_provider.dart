import 'package:flutter/material.dart';

class DonationsProvider extends ChangeNotifier {
  final List<Donation> _donations = [];

  List<Donation> get donations => List.unmodifiable(_donations);

  void addDonation({required String donorName, required double amount, required String method}) {
    _donations.insert(0, Donation(
      donorName: donorName,
      amount: amount,
      dateTime: DateTime.now(),
      method: method,
    ));
    notifyListeners();
  }
}

class Donation {
  final String donorName;
  final double amount;
  final DateTime dateTime;
  final String method;

  Donation({required this.donorName, required this.amount, required this.dateTime, required this.method});
}
