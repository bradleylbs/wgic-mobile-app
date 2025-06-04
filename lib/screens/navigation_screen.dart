import 'package:flutter/material.dart';
import 'package:wgic_app/utils/screen_provider.dart';
import 'package:wgic_app/widgets/professional_app_bar.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  bool _routeStarted = false;
  final Map<String, String> _weather = {
    'temp': '22°C',
    'condition': 'Partly Cloudy',
    'icon': '☁️',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfessionalAppBar(
        title: 'Navigation to WGIC',
        previousScreen: AppScreen.home,
        actions: [
          IconButton(
            icon: const Icon(Icons.map_outlined),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Map View'),
                  content: SizedBox(
                    width: 300,
                    height: 200,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.map, size: 64, color: Colors.blueAccent),
                          const SizedBox(height: 16),
                          Text('Static map view coming soon!', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey[400])),
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
          Text(
            'Optimized route with live updates',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey[400]),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),

          // Weather Card
          Card(
            color: Colors.grey[800],
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Today\'s Weather', style: Theme.of(context).textTheme.titleMedium),
                      Text(_weather['condition']!, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey[400])),
                    ],
                  ),
                  Column(
                    children: [
                      Text(_weather['icon']!, style: const TextStyle(fontSize: 32)),
                      Text(_weather['temp']!, style: Theme.of(context).textTheme.headlineSmall),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Perfect weather for church service! 🙏',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey[400]),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),

          // Route Information
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Icon(Icons.location_on_outlined, color: Colors.white),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('61 Borough Road, Wiggins', style: Theme.of(context).textTheme.titleMedium),
                            Text('Durban, 4091, South Africa', style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey[400])),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildRouteInfo(context, '12', 'MINUTES'),
                      _buildRouteInfo(context, '8.5', 'KM'),
                      _buildRouteInfo(context, '🚗', 'DRIVING'),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _routeStarted = !_routeStarted;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _routeStarted ? Colors.redAccent : Colors.white,
                      foregroundColor: _routeStarted ? Colors.white : Colors.black,
                    ),
                    child: Text(_routeStarted ? 'Stop Navigation' : 'Start Navigation'),
                  ),
                ],
              ),
            ),
          ),

          // Live Route Updates
          if (_routeStarted) ...[
            const SizedBox(height: 16),
            Card(
              color: Colors.grey[800],
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 12,
                          height: 12,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text('Live Navigation Active', style: Theme.of(context).textTheme.titleMedium),
                      ],
                    ),
                    const SizedBox(height: 12),
                    ...[
                      '📍 Current: 2.3 km from church',
                      '🚦 Next: Turn right on Borough Road in 800m',
                      '⏱️ ETA: 8 minutes (7:22 AM)',
                      '🚗 Traffic: Light traffic ahead',
                    ].map((update) => Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Text(update, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey[300])),
                    )),
                  ],
                ),
              ),
            ),
          ],

          const SizedBox(height: 16),

          // Alternative Routes
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Route Options', style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 12),
                  ...[
                    {"name": "Fastest Route", "time": "12 min", "distance": "8.5 km", "traffic": "Light", "recommended": true},
                    {"name": "Scenic Route", "time": "16 min", "distance": "11.2 km", "traffic": "None", "recommended": false},
                    {"name": "Highway Route", "time": "14 min", "distance": "9.8 km", "traffic": "Moderate", "recommended": false},
                  ].map((route) => Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(8),
                      border: route['recommended'] == true ? Border.all(color: Colors.white) : null,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(route['name']! as String, style: Theme.of(context).textTheme.titleSmall),
                                  if (route['recommended'] == true) ...[
                                    const SizedBox(width: 8),
                                    Chip(
                                      label: const Text('Recommended', style: TextStyle(fontSize: 10)),
                                      backgroundColor: Colors.white,
                                      padding: EdgeInsets.zero,
                                    ),
                                  ],
                                ],
                              ),
                              Text('${route['time']} • ${route['distance']} • ${route['traffic']} traffic', 
                                   style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey[400])),
                            ],
                          ),
                        ),
                        const Icon(Icons.chevron_right, color: Colors.grey),
                      ],
                    ),
                  )),
                ],
              ),
            ),
          ),

          // Parking Information
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.grey[800],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(Icons.local_parking_outlined, color: Colors.white),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Parking Available', style: Theme.of(context).textTheme.titleMedium),
                            Text('Free parking on-site', style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey[400])),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildParkingInfo(context, '45', 'Available Spots'),
                      _buildParkingInfo(context, 'FREE', 'Parking Cost'),
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

  Widget _buildRouteInfo(BuildContext context, String value, String label) {
    return Column(
      children: [
        Text(value, style: Theme.of(context).textTheme.headlineSmall),
        Text(label, style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 10)),
      ],
    );
  }

  Widget _buildParkingInfo(BuildContext context, String value, String label) {
    return Column(
      children: [
        Text(value, style: Theme.of(context).textTheme.titleLarge),
        Text(label, style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 10)),
      ],
    );
  }
}