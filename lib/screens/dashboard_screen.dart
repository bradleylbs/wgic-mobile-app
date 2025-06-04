import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wgic_app/utils/attendance_provider.dart';
import 'package:wgic_app/utils/profile_provider.dart';
import 'package:wgic_app/utils/ai_provider.dart';
import 'package:wgic_app/utils/events_provider.dart';
import 'package:wgic_app/utils/donations_provider.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final attendance = context.watch<AttendanceProvider>();
    final profile = context.watch<ProfileProvider>();
    final ai = context.watch<AIProvider>();
    final events = context.watch<EventsProvider>();
    final donations = context.watch<DonationsProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('Attendance Records: ${attendance.totalCheckIns}'),
          const SizedBox(height: 8),
          Text('Profile Name: ${profile.name ?? "Not set"}'),
          const SizedBox(height: 8),
          Text('Last AI Response: ${ai.lastResponse ?? "No response yet"}'),
          const SizedBox(height: 8),
          Text('Total Events: ${events.events.length}'),
          const SizedBox(height: 8),
          Text('Total Donations: ${donations.donations.length}'),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () => attendance.checkIn('demoUser', DateTime.now()),
            child: const Text('Simulate Check-In'),
          ),
          ElevatedButton(
            onPressed: () => ai.askAI('What is faith?'),
            child: const Text('Ask AI'),
          ),
        ],
      ),
    );
  }
}
