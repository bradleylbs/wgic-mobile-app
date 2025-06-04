import 'package:flutter/material.dart';
import 'package:wgic_app/utils/screen_provider.dart';
import 'package:wgic_app/widgets/professional_app_bar.dart';

class CheckInScreen extends StatefulWidget {
  const CheckInScreen({super.key});

  @override
  State<CheckInScreen> createState() => _CheckInScreenState();
}

class _CheckInScreenState extends State<CheckInScreen> {
  bool _isScanning = false;
  bool _checkedIn = false;
  final String _currentService = "Sunday Morning Worship";
  final TextEditingController _memberIdController = TextEditingController();

  void _handleCheckIn() {
    setState(() {
      _isScanning = true;
    });
    
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _isScanning = false;
          _checkedIn = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfessionalAppBar(
        title: 'Service Check-In',
        previousScreen: AppScreen.home,
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Check-In Help'),
                  content: SizedBox(
                    width: 300,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.help_outline, size: 48, color: Colors.blueAccent),
                        const SizedBox(height: 16),
                        Text('Need help with check-in?\n\n- Scan the QR code at the entrance.\n- Or enter your member ID manually.\n- For assistance, ask a greeter or usher.',
                          style: Theme.of(context).textTheme.bodyMedium,
                          textAlign: TextAlign.center,
                        ),
                      ],
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
            'Scan QR code or tap to check in',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey[400]),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),

          // Current Service
          Card(
            color: Colors.grey[800],
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.calendar_today_outlined, color: Colors.white),
                      const SizedBox(width: 8),
                      Text(_currentService, style: Theme.of(context).textTheme.titleMedium),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text('Today • 7:30 AM - 9:30 AM', style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey[400])),
                  const SizedBox(height: 8),
                  Chip(
                    label: const Text('Live Now', style: TextStyle(color: Colors.black)),
                    backgroundColor: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // QR Scanner
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Container(
                    height: 250,
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: _isScanning
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const CircularProgressIndicator(color: Colors.white),
                                const SizedBox(height: 16),
                                Text('Scanning...', style: Theme.of(context).textTheme.titleMedium),
                              ],
                            )
                          : _checkedIn
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.check_circle, size: 64, color: Colors.greenAccent),
                                    const SizedBox(height: 16),
                                    Text('Checked In!', style: Theme.of(context).textTheme.titleLarge),
                                    Text('Welcome to service', style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey[400])),
                                  ],
                                )
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 120,
                                      height: 120,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey[600]!, width: 2, style: BorderStyle.solid),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: const Icon(Icons.qr_code_scanner, size: 32, color: Colors.grey),
                                    ),
                                    const SizedBox(height: 16),
                                    Text('Position QR code in frame', style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey[400])),
                                  ],
                                ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  if (!_checkedIn)
                    ElevatedButton(
                      onPressed: _handleCheckIn,
                      child: Text(_isScanning ? 'Scanning...' : 'Scan QR Code'),
                    ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Manual Check-in
          if (!_checkedIn)
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Manual Check-in', style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 8),
                    Text('Can\'t scan? Enter your member ID', style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey[400])),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _memberIdController,
                            decoration: const InputDecoration(hintText: 'Member ID'),
                          ),
                        ),
                        const SizedBox(width: 12),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _checkedIn = true;
                            });
                          },
                          child: const Text('Check In'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

          // Attendance History
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Recent Attendance', style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 12),
                  ...[
                    {"service": "Sunday Evening Worship", "date": "Jan 21, 2025", "time": "5:30 PM"},
                    {"service": "Friday Youth Night", "date": "Jan 19, 2025", "time": "6:30 PM"},
                    {"service": "Tuesday Bible Study", "date": "Jan 16, 2025", "time": "6:00 PM"},
                  ].map((attendance) => Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.check_circle, color: Colors.greenAccent, size: 20),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(attendance['service']!, style: Theme.of(context).textTheme.titleSmall),
                              Text('${attendance['date']} • ${attendance['time']}', style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey[400])),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _memberIdController.dispose();
    super.dispose();
  }
}
