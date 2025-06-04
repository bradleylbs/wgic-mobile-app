import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wgic_app/utils/screen_provider.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final screenProvider = Provider.of<ScreenProvider>(context);
    final currentScreen = screenProvider.currentScreen;

    // Determine the current index based on AppScreen
    int currentIndex = 0;
    if (currentScreen == AppScreen.home) currentIndex = 0;
    if (currentScreen == AppScreen.ai) currentIndex = 1;
    if (currentScreen == AppScreen.ministries) currentIndex = 2;
    if (currentScreen == AppScreen.content) currentIndex = 3;
    if (currentScreen == AppScreen.profile) currentIndex = 4;

    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[900],
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          currentIndex: currentIndex,
          onTap: (index) {
            switch (index) {
              case 0:
                screenProvider.setCurrentScreen(AppScreen.home);
                break;
              case 1:
                screenProvider.setCurrentScreen(AppScreen.ai);
                break;
              case 2:
                screenProvider.setCurrentScreen(AppScreen.ministries);
                break;
              case 3:
                screenProvider.setCurrentScreen(AppScreen.content);
                break;
              case 4:
                screenProvider.setCurrentScreen(AppScreen.profile);
                break;
            }
          },
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey[600],
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          items: [
            _buildNavItem(Icons.home_outlined, Icons.home, 'Home', currentIndex == 0),
            _buildNavItem(Icons.chat_bubble_outline, Icons.chat_bubble, 'Ask Bible', currentIndex == 1),
            _buildNavItem(Icons.groups_outlined, Icons.groups, 'Ministries', currentIndex == 2),
            _buildNavItem(Icons.play_circle_outline, Icons.play_circle, 'Content', currentIndex == 3),
            _buildNavItem(Icons.person_outline, Icons.person, 'Profile', currentIndex == 4),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(IconData icon, IconData activeIcon, String label, bool isActive) {
    return BottomNavigationBarItem(
      icon: Container(
        padding: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: isActive ? Colors.white : Colors.transparent,
              width: 2,
            ),
          ),
        ),
        child: Icon(isActive ? activeIcon : icon),
      ),
      label: label,
    );
  }
}