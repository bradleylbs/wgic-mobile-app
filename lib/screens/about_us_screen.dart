import 'package:flutter/material.dart';
import 'package:wgic_app/utils/screen_provider.dart';
import 'package:wgic_app/widgets/professional_app_bar.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ProfessionalAppBar(
        title: 'About WGIC',
        previousScreen: AppScreen.profile,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Church Image/Logo
          Container(
            height: 200,
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.circular(12),
              image: const DecorationImage(
                image: AssetImage('assets/images/logo.png'),
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Mission Statement
          Text('Our Mission', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          Text(
            'To impact the world with the Gospel of Jesus Christ, transforming lives and communities through worship, discipleship, and service.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 24),

          // Vision Statement
          Text('Our Vision', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          Text(
            'A world where every person experiences the love, hope, and transformation found in Jesus Christ.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 24),

          // Values
          Text('Our Values', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 12),
          ...[
            'Faith - Trusting in God\'s plan and promises',
            'Love - Showing Christ\'s love to all people',
            'Unity - Building a diverse, inclusive community',
            'Service - Serving others with compassion',
            'Growth - Encouraging spiritual maturity',
          ].map((value) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 6,
                  height: 6,
                  margin: const EdgeInsets.only(top: 6, right: 12),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
                Expanded(
                  child: Text(
                    value,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          )),
          const SizedBox(height: 24),

          // Contact Information
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Contact Us', style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 12),
                  _buildContactItem(
                    context,
                    Icons.location_on_outlined,
                    'Address',
                    '61 Borough Road, Wiggins\nDurban, 4091\nSouth Africa',
                  ),
                  const SizedBox(height: 8),
                  _buildContactItem(
                    context,
                    Icons.phone_outlined,
                    'Phone',
                    '+27 (0) 31 123 4567',
                  ),
                  const SizedBox(height: 8),
                  _buildContactItem(
                    context,
                    Icons.email_outlined,
                    'Email',
                    'info@wgic.org.za',
                  ),
                  const SizedBox(height: 8),
                  _buildContactItem(
                    context,
                    Icons.language_outlined,
                    'Website',
                    'www.wgic.org.za',
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Leadership
          Text('Leadership Team', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 12),
          ...[
            {'name': 'Pastor John Smith', 'role': 'Senior Pastor'},
            {'name': 'Pastor Mary Johnson', 'role': 'Associate Pastor'},
            {'name': 'Elder David Wilson', 'role': 'Ministry Leader'},
            {'name': 'Deacon Sarah Brown', 'role': 'Community Outreach'},
          ].map((leader) => Card(
            margin: const EdgeInsets.only(bottom: 8),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey[600],
                    child: Text(
                      leader['name']!.split(' ').map((n) => n[0]).join(),
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          leader['name']!,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        Text(
                          leader['role']!,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.grey[400],
                          ),
                        ),
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

  Widget _buildContactItem(BuildContext context, IconData icon, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 18, color: Colors.grey[400]),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.grey[400],
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                value,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
