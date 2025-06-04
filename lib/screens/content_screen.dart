import 'package:flutter/material.dart';
import 'package:wgic_app/widgets/professional_app_bar.dart';
import 'package:wgic_app/utils/screen_provider.dart';

class ContentScreen extends StatelessWidget {
  const ContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ProfessionalAppBar(
        title: 'Content Library',
        previousScreen: AppScreen.home,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.menu_book_outlined, size: 64, color: Colors.blueAccent),
            const SizedBox(height: 16),
            Text('Content Library', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            Text('Media and resources coming soon!', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey[400])),
          ],
        ),
      ),
    );
  }
}
