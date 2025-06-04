import 'package:flutter/material.dart';
import 'package:wgic_app/widgets/professional_app_bar.dart';
import 'package:wgic_app/utils/screen_provider.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ProfessionalAppBar(
        title: 'Notifications',
        previousScreen: AppScreen.home,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.notifications_active_outlined, size: 64, color: Colors.orangeAccent),
            const SizedBox(height: 16),
            Text('Notifications', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            Text('No notifications yet.', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey[400])),
          ],
        ),
      ),
    );
  }
}
