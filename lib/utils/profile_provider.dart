import 'package:flutter/material.dart';

class ProfileProvider extends ChangeNotifier {
  // Example profile data
  String? name;
  String? email;
  DateTime? baptismDate;
  List<String> spiritualGifts = [];
  List<String> ministryPreferences = [];
  String? houseColour;
  static const List<String> houseColours = [
    'Red', 'Blue', 'Green', 'Yellow'
  ];

  void updateProfile({String? name, String? email, DateTime? baptismDate, List<String>? gifts, List<String>? ministries}) {
    this.name = name ?? this.name;
    this.email = email ?? this.email;
    this.baptismDate = baptismDate ?? this.baptismDate;
    if (gifts != null) spiritualGifts = gifts;
    if (ministries != null) ministryPreferences = ministries;
    notifyListeners();
  }

  /// Assigns a house colour to the member, optionally using a custom algorithm.
  void assignHouse({String? memberId, int? age, String? familyId, String? location}) {
    // Example: random assignment for now, can be replaced with a smarter algorithm
    houseColour = (houseColours..shuffle()).first;
    notifyListeners();
  }
}
