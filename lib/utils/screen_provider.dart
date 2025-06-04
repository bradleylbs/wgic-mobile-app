import 'package:flutter/material.dart';

enum AppScreen {
  splash,
  auth,
  home,
  ai,
  ministries,
  content,
  profile,
  services,
  checkIn,
  navigation,
  notifications,
  locationServices,
  settings, // Added for dedicated settings screen
  aboutUs,
  discipleship,
  pastoralCare,
  donations,
  kidsQuiz, // Added for kids quiz feature
  profileSettings, // Added for profile settings screen
  privacy // Added for privacy screen
}

class ScreenProvider extends ChangeNotifier {
  AppScreen _currentScreen = AppScreen.splash;

  AppScreen get currentScreen => _currentScreen;

  void setCurrentScreen(AppScreen screen) {
    _currentScreen = screen;
    notifyListeners();
  }
}
