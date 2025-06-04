import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wgic_app/utils/screen_provider.dart';
import 'package:wgic_app/widgets/professional_app_bar.dart';
import 'package:wgic_app/utils/pastoral_care_provider.dart';

class PastoralCareScreen extends StatefulWidget {
  const PastoralCareScreen({super.key});

  @override
  State<PastoralCareScreen> createState() => _PastoralCareScreenState();
}

class _PastoralCareScreenState extends State<PastoralCareScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _requestController = TextEditingController();
  bool _isAnonymous = false;

  @override
  void dispose() {
    _nameController.dispose();
    _requestController.dispose();
    super.dispose();
  }

  void _submitRequest(BuildContext context) {
    if (_formKey.currentState?.validate() ?? false) {
      Provider.of<PastoralCareProvider>(context, listen: false).addRequest(
        _nameController.text.trim(),
        _requestController.text.trim(),
        isAnonymous: _isAnonymous,
      );
      _requestController.clear();
      if (!_isAnonymous) _nameController.clear();
      setState(() => _isAnonymous = false);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Prayer request submitted!')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ProfessionalAppBar(
        title: 'Pastoral Care',
        previousScreen: AppScreen.home,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Text('Submit a Prayer Request', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 12),
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (!_isAnonymous)
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(labelText: 'Your Name'),
                    validator: (v) => v == null || v.trim().isEmpty ? 'Please enter your name or choose anonymous.' : null,
                  ),
                TextFormField(
                  controller: _requestController,
                  decoration: const InputDecoration(labelText: 'Prayer Request'),
                  minLines: 2,
                  maxLines: 4,
                  validator: (v) => v == null || v.trim().isEmpty ? 'Please enter your prayer request.' : null,
                ),
                Row(
                  children: [
                    Checkbox(
                      value: _isAnonymous,
                      onChanged: (val) => setState(() => _isAnonymous = val ?? false),
                    ),
                    const Text('Submit as anonymous'),
                  ],
                ),
                ElevatedButton.icon(
                  onPressed: () => _submitRequest(context),
                  icon: const Icon(Icons.send),
                  label: const Text('Submit'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          Text('Recent Prayer Requests', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          Consumer<PastoralCareProvider>(
            builder: (context, provider, _) => provider.requests.isEmpty
                ? const Text('No requests yet.')
                : Column(
                    children: provider.requests.map((req) => Card(
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      child: ListTile(
                        leading: Icon(Icons.favorite, color: req.isAnonymous ? Colors.grey : Colors.redAccent),
                        title: Text(req.request),
                        subtitle: Text('${req.name} • ${_formatDate(req.date)}'),
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
