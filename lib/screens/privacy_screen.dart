import 'package:flutter/material.dart';
import 'package:wgic_app/widgets/professional_app_bar.dart';
import 'package:wgic_app/utils/screen_provider.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ProfessionalAppBar(
        title: 'Privacy',
        previousScreen: AppScreen.settings,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Text('Privacy Settings', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 16),
          SwitchListTile(
            value: true,
            onChanged: (val) {},
            title: const Text('Show my profile to other members'),
            subtitle: const Text('Allow others to see your profile information.'),
          ),
          SwitchListTile(
            value: false,
            onChanged: (val) {},
            title: const Text('Share my attendance with group leaders'),
            subtitle: const Text('Leaders can see your check-in history.'),
          ),
          SwitchListTile(
            value: true,
            onChanged: (val) {},
            title: const Text('Allow notifications'),
            subtitle: const Text('Receive updates and reminders.'),
          ),
        ],
      ),
    );
  }
}
