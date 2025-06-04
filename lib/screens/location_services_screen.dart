import 'package:flutter/material.dart';
import 'package:wgic_app/widgets/professional_app_bar.dart';
import 'package:wgic_app/utils/screen_provider.dart';

class LocationServicesScreen extends StatefulWidget {
  const LocationServicesScreen({super.key});

  @override
  State<LocationServicesScreen> createState() => _LocationServicesScreenState();
}

class _LocationServicesScreenState extends State<LocationServicesScreen> {
  bool _autoCheckIn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ProfessionalAppBar(
        title: 'Location Services',
        previousScreen: AppScreen.profile,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Text('Current Location', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          Card(
            child: ListTile(
              leading: const Icon(Icons.location_on_outlined, color: Colors.blueAccent),
              title: const Text('2.3 km from WGIC'),
              subtitle: const Text('Durban, South Africa'),
              trailing: IconButton(
                icon: const Icon(Icons.refresh),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Location refresh coming soon!')));
                },
              ),
            ),
          ),
          const SizedBox(height: 24),
          SwitchListTile(
            value: _autoCheckIn,
            onChanged: (val) => setState(() => _autoCheckIn = val),
            title: const Text('Enable Auto Check-In'),
            subtitle: const Text('Automatically check in when you arrive at church.'),
          ),
          const SizedBox(height: 24),
          Text('Recent Location Check-Ins', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          Card(
            child: ListTile(
              leading: const Icon(Icons.check_circle, color: Colors.green),
              title: const Text('Sunday Morning Service'),
              subtitle: const Text('Checked in at 7:32 AM, 2 June 2025'),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.check_circle, color: Colors.green),
              title: const Text('Youth Night'),
              subtitle: const Text('Checked in at 6:28 PM, 30 May 2025'),
            ),
          ),
        ],
      ),
    );
  }
}
