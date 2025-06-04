import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wgic_app/utils/screen_provider.dart';
import 'package:wgic_app/widgets/professional_app_bar.dart';
import 'package:wgic_app/utils/discipleship_provider.dart';

class DiscipleshipScreen extends StatelessWidget {
  const DiscipleshipScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ProfessionalAppBar(
        title: 'Discipleship',
        previousScreen: AppScreen.home,
      ),
      body: Consumer<DiscipleshipProvider>(
        builder: (context, provider, _) {
          final completed = provider.lessons.where((l) => l.completed).length;
          final total = provider.lessons.length;
          return ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              Text('Your Discipleship Journey', style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 12),
              LinearProgressIndicator(
                value: total == 0 ? 0 : completed / total,
                minHeight: 8,
                backgroundColor: Colors.grey[800],
                color: Colors.green,
              ),
              const SizedBox(height: 16),
              ...provider.lessons.asMap().entries.map((entry) {
                final i = entry.key;
                final lesson = entry.value;
                return Card(
                  child: ListTile(
                    leading: Icon(
                      lesson.completed ? Icons.check_circle : Icons.radio_button_unchecked,
                      color: lesson.completed ? Colors.green : Colors.grey,
                    ),
                    title: Text(lesson.title),
                    subtitle: Text(lesson.description),
                    trailing: lesson.completed
                        ? const Text('Completed', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold))
                        : ElevatedButton(
                            onPressed: () => provider.markCompleted(i),
                            child: const Text('Mark as Done'),
                          ),
                  ),
                );
              }),
            ],
          );
        },
      ),
    );
  }
}
