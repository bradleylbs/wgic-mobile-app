import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wgic_app/utils/screen_provider.dart';
import 'package:wgic_app/widgets/professional_app_bar.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenProvider = Provider.of<ScreenProvider>(context, listen: false);
    
    final services = [
      {
        "day": "Sunday",
        "events": [
          {
            "name": "Morning Worship",
            "time": "7:30 AM – 9:30 AM",
            "description": "Join us for our main worship service",
            "icon": Icons.calendar_today_outlined,
          },
          {
            "name": "Evening Worship",
            "time": "5:30 PM – 6:30 PM",
            "description": "Evening service for reflection and worship",
            "icon": Icons.calendar_today_outlined,
          },
        ],
      },
      {
        "day": "Tuesday",
        "events": [
          {
            "name": "Bible Study",
            "time": "6:00 PM – 7:30 PM",
            "description": "Led by Pastor G. Gobhozi - In-depth exploration of Scripture",
            "icon": Icons.book_outlined,
          },
        ],
      },
      {
        "day": "Friday",
        "events": [
          {
            "name": "Youth Night",
            "time": "6:30 PM – 8:30 PM",
            "description": "Engaging the youth through worship and fellowship",
            "icon": Icons.groups_outlined,
          },
        ],
      },
      {
        "day": "Saturday",
        "events": [
          {
            "name": "Worship Night",
            "time": "6:00 PM – 8:00 PM",
            "description": "A special evening dedicated to worship and spiritual renewal",
            "icon": Icons.favorite_border_outlined,
          },
        ],
      },
    ];

    return Scaffold(
      appBar: ProfessionalAppBar(
        title: 'Weekly Services',
        previousScreen: AppScreen.home,
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_month_outlined),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Calendar View'),
                  content: SizedBox(
                    width: 300,
                    height: 300,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.calendar_month_outlined, size: 64, color: Colors.purpleAccent),
                          const SizedBox(height: 16),
                          Text('Calendar view coming soon!', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey[400])),
                        ],
                      ),
                    ),
                  ),
                  actions: [
                    TextButton(onPressed: () => Navigator.pop(context), child: const Text('Close')),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Header
          Text(
            'Join us for worship and fellowship',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey[400]),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),

          // Location Card
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
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(Icons.location_on_outlined, color: Colors.black),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Our Location', style: Theme.of(context).textTheme.titleMedium),
                            Text('World Gospel Impact Church', style: Theme.of(context).textTheme.bodySmall),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    '61 Borough Road, Wiggins\nDurban, 4091\nSouth Africa',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: () => screenProvider.setCurrentScreen(AppScreen.navigation),
                    icon: const Icon(Icons.directions_outlined, size: 18),
                    label: const Text('Get Directions'),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Services Schedule
          ...services.map((daySchedule) => Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(daySchedule['day'] as String, style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 12),
                  ...((daySchedule['events'] as List).map((event) => Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.grey[700],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(event['icon'] as IconData, color: Colors.white, size: 20),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(event['name'] as String, style: Theme.of(context).textTheme.titleMedium),
                                  Chip(
                                    label: Text(event['time'] as String, style: const TextStyle(fontSize: 10)),
                                    backgroundColor: Colors.grey[600],
                                    padding: EdgeInsets.zero,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Text(event['description'] as String, style: Theme.of(context).textTheme.bodySmall),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ))),
                ],
              ),
            ),
          )),

          // Quick Actions
          Row(
            children: [
              Expanded(
                child: Card(
                  child: InkWell(
                    onTap: () => screenProvider.setCurrentScreen(AppScreen.checkIn),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          const Icon(Icons.qr_code_scanner, size: 32, color: Colors.white),
                          const SizedBox(height: 8),
                          Text('Check In', style: Theme.of(context).textTheme.titleSmall),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Card(
                  child: InkWell(
                    onTap: () => screenProvider.setCurrentScreen(AppScreen.navigation),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          const Icon(Icons.navigation_outlined, size: 32, color: Colors.white),
                          const SizedBox(height: 8),
                          Text('Get Directions', style: Theme.of(context).textTheme.titleSmall),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Next Service Countdown
          Card(
            color: Colors.grey[800],
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text('Next Service', style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 8),
                  Text('Sunday Morning Worship', style: Theme.of(context).textTheme.headlineSmall),
                  Text('7:30 AM – 9:30 AM', style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey[400])),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildCountdownItem(context, '2', 'DAYS'),
                      _buildCountdownItem(context, '14', 'HOURS'),
                      _buildCountdownItem(context, '32', 'MINS'),
                    ],
                  ),
                ],
              ),
            ),
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
}
