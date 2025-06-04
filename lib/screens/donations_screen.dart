import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wgic_app/utils/screen_provider.dart';
import 'package:wgic_app/widgets/professional_app_bar.dart';
import 'package:wgic_app/utils/donations_provider.dart';

class DonationsScreen extends StatefulWidget {
  const DonationsScreen({super.key});

  @override
  State<DonationsScreen> createState() => _DonationsScreenState();
}

class _DonationsScreenState extends State<DonationsScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _amountController = TextEditingController();
  String _method = 'Cash';

  @override
  void dispose() {
    _nameController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _submitDonation(BuildContext context) {
    if (_formKey.currentState?.validate() ?? false) {
      final name = _nameController.text.trim();
      final amount = double.tryParse(_amountController.text.trim()) ?? 0.0;
      Provider.of<DonationsProvider>(context, listen: false).addDonation(
        donorName: name.isEmpty ? 'Anonymous' : name,
        amount: amount,
        method: _method,
      );
      _amountController.clear();
      _nameController.clear();
      setState(() => _method = 'Cash');
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Thank you for your donation!')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ProfessionalAppBar(
        title: 'Donations',
        previousScreen: AppScreen.home,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Text('Make a Donation', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 12),
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Your Name (optional)'),
                ),
                TextFormField(
                  controller: _amountController,
                  decoration: const InputDecoration(labelText: 'Amount (ZAR)'),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  validator: (v) {
                    final value = double.tryParse(v ?? '');
                    if (value == null || value <= 0) return 'Enter a valid amount.';
                    return null;
                  },
                ),
                DropdownButtonFormField<String>(
                  value: _method,
                  items: const [
                    DropdownMenuItem(value: 'Cash', child: Text('Cash')),
                    DropdownMenuItem(value: 'Card', child: Text('Card')),
                    DropdownMenuItem(value: 'EFT', child: Text('EFT/Bank Transfer')),
                  ],
                  onChanged: (val) => setState(() => _method = val ?? 'Cash'),
                  decoration: const InputDecoration(labelText: 'Payment Method'),
                ),
                const SizedBox(height: 8),
                ElevatedButton.icon(
                  onPressed: () => _submitDonation(context),
                  icon: const Icon(Icons.volunteer_activism_outlined),
                  label: const Text('Donate'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          Text('Recent Donations', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          Consumer<DonationsProvider>(
            builder: (context, provider, _) => provider.donations.isEmpty
                ? const Text('No donations yet.')
                : Column(
                    children: provider.donations.map((don) => Card(
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      child: ListTile(
                        leading: const Icon(Icons.volunteer_activism, color: Colors.green),
                        title: Text('${don.donorName} donated R${don.amount.toStringAsFixed(2)}'),
                        subtitle: Text('${don.method} • ${_formatDate(don.dateTime)}'),
                      ),
                    )).toList(),
                  ),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    if (date.year == now.year && date.month == now.month && date.day == now.day) {
      return 'Today, ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
    }
    return '${date.day}/${date.month}/${date.year}';
  }
}
