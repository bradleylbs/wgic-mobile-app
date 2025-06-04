import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wgic_app/utils/screen_provider.dart';
import 'package:wgic_app/widgets/professional_app_bar.dart';

class MinistriesScreen extends StatefulWidget {
  const MinistriesScreen({super.key});

  @override
  State<MinistriesScreen> createState() => _MinistriesScreenState();
}

class _MinistriesScreenState extends State<MinistriesScreen> {
  String _search = '';
  String _filter = '';

  @override
  Widget build(BuildContext context) {
    final screenProvider = Provider.of<ScreenProvider>(context, listen: false);
    final ministries = [
      {"name": "Children Ministry", "members": 45, "icon": Icons.child_care_outlined, "description": "Nurturing young hearts for Jesus"},
      {"name": "Evangelism", "members": 32, "icon": Icons.campaign_outlined, "description": "Sharing the Gospel with the world"},
      {"name": "Support Ministry", "members": 28, "icon": Icons.volunteer_activism_outlined, "description": "Caring for those in need"},
      {"name": "Youth Ministry", "members": 67, "icon": Icons.groups_outlined, "description": "Empowering the next generation"},
      {"name": "Worship Team", "members": 24, "icon": Icons.music_note_outlined, "description": "Leading the congregation in worship"},
      {"name": "Prayer Ministry", "members": 38, "icon": Icons.favorite_border_outlined, "description": "Interceding for our community"},
    ];
    final upcomingTasks = [
      {"task": "Outreach Planning Meeting", "time": "Today 3:00 PM", "ministry": "Evangelism", "icon": Icons.campaign_outlined},
      {"task": "Children's Program Prep", "time": "Tomorrow 10:00 AM", "ministry": "Children", "icon": Icons.child_care_outlined},
      {"task": "Youth Event Setup", "time": "Friday 6:00 PM", "ministry": "Youth", "icon": Icons.groups_outlined},
      {"task": "Worship Practice", "time": "Saturday 2:00 PM", "ministry": "Worship", "icon": Icons.music_note_outlined},
    ];
    final filtered = ministries.where((m) {
      final matchesSearch = _search.isEmpty || (m['name'] as String).toLowerCase().contains(_search.toLowerCase());
      final matchesFilter = _filter.isEmpty || (m['description'] as String).toLowerCase().contains(_filter.toLowerCase());
      return matchesSearch && matchesFilter;
    }).toList();
    return Scaffold(
      appBar: ProfessionalAppBar(
        title: 'Ministries',
        previousScreen: AppScreen.home,
        actions: [
          IconButton(
            icon: const Icon(Icons.search_outlined),
            onPressed: () async {
              final result = await showDialog<String>(
                context: context,
                builder: (context) {
                  String temp = _search;
                  return AlertDialog(
                    title: const Text('Search Ministries'),
                    content: TextField(
                      autofocus: true,
                      decoration: const InputDecoration(hintText: 'Enter ministry name'),
                      onChanged: (v) => temp = v,
                      controller: TextEditingController(text: _search),
                    ),
                    actions: [
                      TextButton(onPressed: () => Navigator.pop(context, null), child: const Text('Cancel')),
                      TextButton(onPressed: () => Navigator.pop(context, temp), child: const Text('Search')),
                    ],
                  );
                },
              );
              if (result != null) setState(() => _search = result);
            },
          ),
          IconButton(
            icon: const Icon(Icons.filter_list_outlined),
            onPressed: () async {
              final result = await showDialog<String>(
                context: context,
                builder: (context) {
                  String temp = _filter;
                  return AlertDialog(
                    title: const Text('Filter Ministries'),
                    content: TextField(
                      autofocus: true,
                      decoration: const InputDecoration(hintText: 'Enter keyword'),
                      onChanged: (v) => temp = v,
                      controller: TextEditingController(text: _filter),
                    ),
                    actions: [
                      TextButton(onPressed: () => Navigator.pop(context, null), child: const Text('Cancel')),
                      TextButton(onPressed: () => Navigator.pop(context, temp), child: const Text('Apply')),
                    ],
                  );
                },
              );
              if (result != null) setState(() => _filter = result);
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Text(
            'Get involved and make a difference in our community',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey[400]),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),

          // Ministries Grid
          ...filtered.map((ministry) => Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: InkWell(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${ministry['name']} details - Coming Soon!')),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.grey[700],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(ministry['icon'] as IconData, color: Colors.white, size: 24),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(ministry['name'] as String, style: Theme.of(context).textTheme.titleMedium),
                          Text(ministry['description'] as String, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey[400])),
                          const SizedBox(height: 4),
                          Text('${ministry['members']} active members', style: Theme.of(context).textTheme.bodySmall),
                        ],
                      ),
                    ),
                    const Icon(Icons.chevron_right, color: Colors.grey),
                  ],
                ),
              ),
            ),
          )),

          const SizedBox(height: 24),

          // Join Ministry CTA
          Card(
            color: Colors.grey[800],
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Icon(Icons.add_circle_outline, size: 48, color: Colors.white),
                  const SizedBox(height: 12),
                  Text('Want to Get Involved?', style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 8),
                  Text(
                    'Join one of our ministries and use your gifts to serve God and our community.',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey[300]),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: () => screenProvider.setCurrentScreen(AppScreen.pastoralCare),
                    icon: const Icon(Icons.contact_support_outlined, size: 18),
                    label: const Text('Contact Ministry Leader'),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Upcoming Tasks
          Text('Upcoming Ministry Tasks', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          ...upcomingTasks.map((task) => Card(
            margin: const EdgeInsets.only(bottom: 8),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Icon(task['icon'] as IconData, color: Colors.grey[400], size: 20),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(task['task'] as String, style: Theme.of(context).textTheme.titleSmall),
                        Text('${task['time']} • ${task['ministry']}', style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey[400])),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
        ],
      ),
    );
  }
}
