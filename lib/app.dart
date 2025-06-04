import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wgic_app/screens/about_us_screen.dart';
import 'package:wgic_app/screens/ai_chat_screen.dart';
import 'package:wgic_app/screens/auth_screen.dart';
import 'package:wgic_app/screens/check_in_screen.dart';
import 'package:wgic_app/screens/home_screen.dart';
import 'package:wgic_app/screens/ministries_screen.dart';
import 'package:wgic_app/screens/navigation_screen.dart';
import 'package:wgic_app/screens/profile_screen.dart';
import 'package:wgic_app/screens/services_screen.dart';
import 'package:wgic_app/screens/splash_screen.dart';
import 'package:wgic_app/utils/screen_provider.dart';
import 'package:wgic_app/widgets/bottom_nav_bar.dart';
import 'package:wgic_app/screens/settings_screen.dart';
import 'package:wgic_app/screens/donations_screen.dart';
import 'package:wgic_app/screens/content_screen.dart';
import 'package:wgic_app/screens/notifications_screen.dart';
import 'package:wgic_app/screens/location_services_screen.dart';
import 'package:wgic_app/screens/discipleship_screen.dart';
import 'package:wgic_app/screens/pastoral_care_screen.dart';
import 'package:wgic_app/screens/kids_quiz_screen.dart';
import 'package:wgic_app/screens/profile_settings_screen.dart';
import 'package:wgic_app/screens/privacy_screen.dart';


// Placeholder Screens for remaining features
class PlaceholderScreen extends StatelessWidget {
  final String title;
  const PlaceholderScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final screenProvider = Provider.of<ScreenProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => screenProvider.setCurrentScreen(AppScreen.home),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.construction_outlined, size: 64, color: Colors.grey[400]),
            const SizedBox(height: 16),
            Text('$title Screen', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            Text('Coming Soon!', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey[400])),
          ],
        ),
      ),
    );
  }
}

class WGICMobileApp extends StatelessWidget {
  const WGICMobileApp({super.key});

  Widget _buildScreen(AppScreen screen) {
    switch (screen) {
      case AppScreen.splash:
        return const SplashScreen();
      case AppScreen.auth:
        return const AuthScreen();
      case AppScreen.home:
        return const HomeScreen();
      case AppScreen.profile:
        return const ProfileScreen();
      case AppScreen.aboutUs:
        return const AboutUsScreen();
      case AppScreen.ai:
        return const AIChatScreen();
      case AppScreen.ministries:
        return const MinistriesScreen();
      case AppScreen.services:
        return const ServicesScreen();
      case AppScreen.checkIn:
        return const CheckInScreen();
      case AppScreen.navigation:
        return const NavigationScreen();
      case AppScreen.donations:
        return const DonationsScreen();
      case AppScreen.content:
        return const ContentScreen();
      case AppScreen.notifications:
        return const NotificationsScreen();
      case AppScreen.locationServices:
        return const LocationServicesScreen();
      case AppScreen.discipleship:
        return const DiscipleshipScreen();
      case AppScreen.pastoralCare:
        return const PastoralCareScreen();
      case AppScreen.settings:
        return const SettingsScreen();
      case AppScreen.kidsQuiz:
        return const KidsQuizScreen();
      case AppScreen.profileSettings:
        return const ProfileSettingsScreen();
      case AppScreen.privacy:
        return const PrivacyScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenProvider = Provider.of<ScreenProvider>(context);
    final currentScreen = screenProvider.currentScreen;

    final bool showNavBar = currentScreen != AppScreen.splash && currentScreen != AppScreen.auth;

    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: _buildScreen(currentScreen),
      ),
      bottomNavigationBar: showNavBar ? const BottomNavBar() : null,
    );
  }
}
