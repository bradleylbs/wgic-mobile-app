import 'package:flutter/material.dart';
import 'package:wgic_app/widgets/professional_app_bar.dart';
import 'package:wgic_app/utils/screen_provider.dart';

class ProfileSettingsScreen extends StatelessWidget {
  const ProfileSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ProfessionalAppBar(
        title: 'Profile Settings',
        previousScreen: AppScreen.settings,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Text('Edit your profile information below:', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 16),
          TextField(
            decoration: const InputDecoration(labelText: 'Full Name'),
          ),
          const SizedBox(height: 12),
          TextField(
            decoration: const InputDecoration(labelText: 'Email'),
          ),
          const SizedBox(height: 12),
          TextField(
            decoration: const InputDecoration(labelText: 'Phone Number'),
          ),
          const SizedBox(height: 12),
          TextField(
            decoration: const InputDecoration(labelText: 'Baptism Date'),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Profile updated!')));
            },
            icon: const Icon(Icons.save),
            label: const Text('Save Changes'),
          ),
        ],
      ),
    );
  }
}
