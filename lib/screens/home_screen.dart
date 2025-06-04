import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wgic_app/utils/screen_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Widget _buildQuickActionCard(BuildContext context, {required IconData icon, required String label, String? subtitle, required AppScreen screenTarget}) {
    final screenProvider = Provider.of<ScreenProvider>(context, listen: false);
    return Card(
      child: InkWell(
        onTap: () => screenProvider.setCurrentScreen(screenTarget),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 32, color: Colors.white),
              const SizedBox(height: 8),
              Text(label, textAlign: TextAlign.center, style: Theme.of(context).textTheme.titleSmall),
              if (subtitle != null) ...[
                const SizedBox(height: 4),
                Text(subtitle, textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 10)),
              ]
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureCard(BuildContext context, {required IconData icon, required String label, required AppScreen screenTarget}) {
    final screenProvider = Provider.of<ScreenProvider>(context, listen: false);
    return Card(
      child: InkWell(
        onTap: () => screenProvider.setCurrentScreen(screenTarget),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 28, color: Colors.white),
              const SizedBox(height: 8),
              Text(label, textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenProvider = Provider.of<ScreenProvider>(context, listen: false);
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Welcome Header
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Welcome Back', style: Theme.of(context).textTheme.headlineSmall),
                    Row(
                      children: [
                        Icon(Icons.location_on_outlined, size: 16, color: Colors.grey[400]),
                        const SizedBox(width: 4),
                        Text('2.3 km from WGIC', style: Theme.of(context).textTheme.bodySmall),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        const Text('☀️', style: TextStyle(fontSize: 24)),
                        const SizedBox(width: 4),
                        Text('22°C', style: Theme.of(context).textTheme.titleMedium),
                      ],
                    ),
                    Text('Partly Cloudy', style: Theme.of(context).textTheme.bodySmall),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Location-Based Alert
          Card(
            color: Colors.grey[800],
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(color: Colors.grey[700], borderRadius: BorderRadius.circular(8)),
                    child: const Icon(Icons.notifications_active_outlined, color: Colors.white),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Service Starting Soon!', style: Theme.of(context).textTheme.titleMedium),
                        Text('Sunday Morning Worship in 45 minutes', style: Theme.of(context).textTheme.bodySmall),
                      ],
                    ),
                  ),
                  Chip(label: Text('Live', style: TextStyle(color: Colors.grey[900])), backgroundColor: Colors.white, padding: EdgeInsets.zero),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Quick Actions Grid
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.2,
            children: [
              _buildQuickActionCard(context, icon: Icons.qr_code_scanner, label: 'Quick Check-In', subtitle: 'Tap to check in', screenTarget: AppScreen.checkIn),
              _buildQuickActionCard(context, icon: Icons.directions_outlined, label: 'Get Directions', subtitle: '12 min • 8.5 km', screenTarget: AppScreen.navigation),
              _buildQuickActionCard(context, icon: Icons.calendar_today_outlined, label: 'Service Check-In', subtitle: 'QR Code Scanner', screenTarget: AppScreen.checkIn),
              _buildQuickActionCard(context, icon: Icons.access_time_outlined, label: 'Service Times', subtitle: 'View schedule', screenTarget: AppScreen.services),
              // Dashboard quick action
              //_buildQuickActionCard(context, icon: Icons.dashboard_outlined, label: 'Dashboard', subtitle: 'Feature Overview', screenTarget: AppScreen.dashboard),
              _buildQuickActionCard(context, icon: Icons.quiz_outlined, label: 'Kids Quiz', subtitle: 'Bible Fun', screenTarget: AppScreen.kidsQuiz),
            ],
          ),
          const SizedBox(height: 16),

          // Live Service Status
          Card(
            color: Colors.grey[800],
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
                        child: Image.asset('assets/images/logo.png', height: 24, width: 24),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Sunday Morning Worship', style: Theme.of(context).textTheme.titleMedium),
                            Text('7:30 AM – 9:30 AM • Starting in 45 min', style: Theme.of(context).textTheme.bodySmall),
                          ],
                        ),
                      ),
                      Container(
                        width: 10, height: 10,
                        decoration: const BoxDecoration(color: Colors.greenAccent, shape: BoxShape.circle),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildCountdownItem(context, '0', 'HOURS'),
                      _buildCountdownItem(context, '45', 'MINS'),
                      _buildCountdownItem(context, '23', 'SECS'),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(child: ElevatedButton.icon(onPressed: () => screenProvider.setCurrentScreen(AppScreen.ai), icon: const Icon(Icons.chat_bubble_outline, size: 18), label: const Text('Ask Bible AI'))),
                      const SizedBox(width: 12),
                      Expanded(child: OutlinedButton.icon(onPressed: () => screenProvider.setCurrentScreen(AppScreen.navigation), icon: const Icon(Icons.navigation_outlined, size: 18), label: const Text('Navigate'))),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Location Updates
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [const Icon(Icons.notifications_outlined, size: 20), const SizedBox(width: 8), Text('Location Updates', style: Theme.of(context).textTheme.titleMedium)]),
                  const SizedBox(height: 12),
                  _buildNotificationItem(context, icon: Icons.location_on_outlined, text: "You're 2.3 km from church", time: "Now", action: "Get directions", color: Colors.blueAccent),
                  _buildNotificationItem(context, icon: Icons.access_time_outlined, text: "Leave in 15 minutes for on-time arrival", time: "7:15 AM", action: "Set reminder", color: Colors.orangeAccent),
                  _buildNotificationItem(context, icon: Icons.check_circle_outline, text: "Parking available - 45 free spots", time: "Live", action: "View map", color: Colors.greenAccent),
                ],
              ),
            )
          ),
          const SizedBox(height: 16),

          // Secondary Features
          Text('Discover More', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.8,
            children: [
              _buildFeatureCard(context, icon: Icons.groups_outlined, label: 'Ministries', screenTarget: AppScreen.ministries),
              _buildFeatureCard(context, icon: Icons.school_outlined, label: 'Discipleship', screenTarget: AppScreen.discipleship),
              _buildFeatureCard(context, icon: Icons.favorite_border_outlined, label: 'Pastoral Care', screenTarget: AppScreen.pastoralCare),
              _buildFeatureCard(context, icon: Icons.volunteer_activism_outlined, label: 'Donations', screenTarget: AppScreen.donations),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCountdownItem(BuildContext context, String value, String label) {
    return Column(
      children: [
        Text(value, style: Theme.of(context).textTheme.headlineSmall),
        Text(label, style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 10)),
      ],
    );
  }

  Widget _buildNotificationItem(BuildContext context, {required IconData icon, required String text, required String time, required String action, Color? color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, size: 20, color: color ?? Colors.white),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(text, style: Theme.of(context).textTheme.bodyMedium),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(time, style: Theme.of(context).textTheme.bodySmall),
                    TextButton(onPressed: (){}, child: Text(action, style: TextStyle(color: color ?? Colors.blueAccent, fontSize: 12))),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
