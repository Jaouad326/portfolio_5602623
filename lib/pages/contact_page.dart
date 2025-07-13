import 'package:flutter/material.dart';
import '../widgets/main_app_bar.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});
  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _formKey = GlobalKey<FormState>();
  String name = '', email = '', message = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(currentRoute: '/contact'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (v) => (v == null || v.isEmpty) ? 'Bitte Name eingeben' : null,
                onSaved: (v) => name = v ?? '',
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(labelText: 'E-Mail'),
                validator: (v) {
                  if (v == null || v.isEmpty) return 'Bitte E-Mail eingeben';
                  if (!v.contains('@') || !v.contains('.')) return 'Ungültige Adresse';
                  return null;
                },
                onSaved: (v) => email = v ?? '',
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Nachricht'),
                maxLines: 5,
                validator: (v) => (v == null || v.isEmpty) ? 'Bitte Nachricht eingeben' : null,
                onSaved: (v) => message = v ?? '',
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    _formKey.currentState?.save();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Vielen Dank! Nachricht gesendet.')),
                    );
                    _formKey.currentState?.reset();
                  }
                },
                child: const Text('Absenden'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
