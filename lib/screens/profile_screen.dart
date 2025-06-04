import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wgic_app/utils/screen_provider.dart';
import 'package:wgic_app/utils/profile_provider.dart';
import 'package:wgic_app/widgets/professional_app_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  Widget _buildSettingsItem(BuildContext context, {required IconData icon, required String title, required String subtitle, required AppScreen screenTarget}) {
    final screenProvider = Provider.of<ScreenProvider>(context, listen: false);
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        leading: Icon(icon, color: Colors.grey[400]),
        title: Text(title, style: Theme.of(context).textTheme.titleSmall),
        subtitle: Text(subtitle, style: Theme.of(context).textTheme.bodySmall),
        trailing: Icon(Icons.chevron_right, color: Colors.grey[600]),
        onTap: () => screenProvider.setCurrentScreen(screenTarget),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenProvider = Provider.of<ScreenProvider>(context, listen: false);
    return Scaffold(
      appBar: ProfessionalAppBar(
        title: 'My Profile',
        previousScreen: AppScreen.home,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () {
              // Navigate to settings screen
              final screenProvider = Provider.of<ScreenProvider>(context, listen: false);
              screenProvider.setCurrentScreen(AppScreen.settings);
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Column(
            children: [
              CircleAvatar(
                radius: 48,
                backgroundColor: Colors.grey[600],
                child: const Icon(Icons.person, size: 48, color: Colors.white),
              ),
              const SizedBox(height: 16),
              Consumer<ProfileProvider>(
                builder: (context, ProfileProvider profile, _) {
                  final name = profile.name ?? 'John Doe';
                  final house = profile.houseColour;
                  return Column(
                    children: [
                      Text(name, style: Theme.of(context).textTheme.headlineSmall),
                      Text('Member since 2020', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey[400])),
                      if (house != null) ...[
                        const SizedBox(height: 8),
                        Chip(
                          label: Text('$house House'),
                          backgroundColor: _houseColor(house),
                          labelStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ]
                    ],
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text('Quick Actions', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.5,
            children: [
              _quickActionCard(context, Icons.qr_code_scanner, 'Check In', AppScreen.checkIn),
              _quickActionCard(context, Icons.navigation_outlined, 'Navigation', AppScreen.navigation),
              _quickActionCard(context, Icons.notifications_outlined, 'Notifications', AppScreen.notifications),
              _quickActionCard(context, Icons.favorite_border_outlined, 'Prayer Requests', AppScreen.pastoralCare),
            ],
          ),
          const SizedBox(height: 24),
          Text('Settings', style: Theme.of(context).textTheme.titleMedium),
          _buildSettingsItem(context, icon: Icons.notifications_outlined, title: 'Notifications', subtitle: 'Service reminders, prayer updates', screenTarget: AppScreen.notifications),
          _buildSettingsItem(context, icon: Icons.location_on_outlined, title: 'Location Services', subtitle: 'Auto check-in, route optimization', screenTarget: AppScreen.locationServices),
          _buildSettingsItem(context, icon: Icons.person_outline, title: 'Profile Settings', subtitle: 'Personal information, preferences', screenTarget: AppScreen.profileSettings),
          _buildSettingsItem(context, icon: Icons.privacy_tip_outlined, title: 'Privacy', subtitle: 'Data sharing, visibility settings', screenTarget: AppScreen.privacy),
          _buildSettingsItem(context, icon: Icons.info_outline, title: 'About WGIC', subtitle: 'Our mission, vision & history', screenTarget: AppScreen.aboutUs),
          const SizedBox(height: 24),
          OutlinedButton.icon(
            onPressed: () => screenProvider.setCurrentScreen(AppScreen.auth),
            icon: const Icon(Icons.logout, color: Colors.redAccent),
            label: const Text('Sign Out', style: TextStyle(color: Colors.redAccent)),
            style: OutlinedButton.styleFrom(side: const BorderSide(color: Colors.redAccent)),
          ),
        ],
      ),
    );
  }

  Widget _quickActionCard(BuildContext context, IconData icon, String label, AppScreen screenTarget) {
    final screenProvider = Provider.of<ScreenProvider>(context, listen: false);
    return Card(
      child: InkWell(
        onTap: () => screenProvider.setCurrentScreen(screenTarget),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 32, color: Colors.white),
            const SizedBox(height: 8),
            Text(label, style: Theme.of(context).textTheme.titleSmall),
          ],
        ),
      ),
    );
  }
}

// Place this outside the ProfileScreen class
Color? _houseColor(String? house) {
  switch (house) {
    case 'Red':
      return Colors.redAccent;
    case 'Blue':
      return Colors.blueAccent;
    case 'Green':
      return Colors.green;
    case 'Yellow':
      return Colors.amber;
    default:
      return Colors.grey;
  }
}