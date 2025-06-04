import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wgic_app/widgets/professional_app_bar.dart';
import 'package:wgic_app/utils/screen_provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    final screenProvider = Provider.of<ScreenProvider>(context, listen: false);
    return Scaffold(
      appBar: const ProfessionalAppBar(
        title: 'Settings',
        previousScreen: AppScreen.profile,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          SwitchListTile(
            value: _notificationsEnabled,
            onChanged: (val) => setState(() => _notificationsEnabled = val),
            title: const Text('Enable Notifications'),
            subtitle: const Text('Service reminders, prayer updates, and more.'),
          ),
          const SizedBox(height: 24),
          ListTile(
            leading: const Icon(Icons.person_outline),
            title: const Text('Profile Settings'),
            subtitle: const Text('Personal information, preferences'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => screenProvider.setCurrentScreen(AppScreen.profileSettings),
          ),
          ListTile(
            leading: const Icon(Icons.privacy_tip_outlined),
            title: const Text('Privacy'),
            subtitle: const Text('Data sharing, visibility settings'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => screenProvider.setCurrentScreen(AppScreen.privacy),
          ),
        ],
      ),
    );
  }
}
