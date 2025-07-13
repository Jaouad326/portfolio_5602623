import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String email = '';
  String message = '';

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 600;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kontakt'),
        centerTitle: false,
        leading:
            isMobile
                ? IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                )
                : null,
        actions:
            isMobile
                ? null
                : [
                  TextButton(
                    onPressed:
                        ModalRoute.of(context)?.settings.name != '/'
                            ? () => Navigator.pushReplacementNamed(context, '/')
                            : null,
                    child: const Text('Home'),
                  ),
                  TextButton(
                    onPressed:
                        ModalRoute.of(context)?.settings.name != '/projects'
                            ? () => Navigator.pushReplacementNamed(
                              context,
                              '/projects',
                            )
                            : null,
                    child: const Text('Work'),
                  ),
                  TextButton(
                    onPressed:
                        ModalRoute.of(context)?.settings.name != '/about'
                            ? () => Navigator.pushReplacementNamed(
                              context,
                              '/about',
                            )
                            : null,
                    child: const Text('About'),
                  ),
                  TextButton(
                    onPressed:
                        ModalRoute.of(context)?.settings.name != '/contact'
                            ? () => Navigator.pushReplacementNamed(
                              context,
                              '/contact',
                            )
                            : null,
                    child: const Text('Contact'),
                  ),
                ],
      ),
      drawer:
          isMobile
              ? Drawer(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    const DrawerHeader(
                      decoration: BoxDecoration(color: Colors.blueGrey),
                      child: Text(
                        'Navigation',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    ListTile(
                      title: const Text('Home'),
                      onTap: () {
                        Navigator.pop(context);
                        if (ModalRoute.of(context)?.settings.name != '/') {
                          Navigator.pushReplacementNamed(context, '/');
                        }
                      },
                    ),
                    ListTile(
                      title: const Text('Work'),
                      onTap: () {
                        Navigator.pop(context);
                        if (ModalRoute.of(context)?.settings.name !=
                            '/projects') {
                          Navigator.pushReplacementNamed(context, '/projects');
                        }
                      },
                    ),
                    ListTile(
                      title: const Text('About'),
                      onTap: () {
                        Navigator.pop(context);
                        if (ModalRoute.of(context)?.settings.name != '/about') {
                          Navigator.pushReplacementNamed(context, '/about');
                        }
                      },
                    ),
                    ListTile(
                      title: const Text('Contact'),
                      onTap: () {
                        Navigator.pop(context);
                        if (ModalRoute.of(context)?.settings.name !=
                            '/contact') {
                          Navigator.pushReplacementNamed(context, '/contact');
                        }
                      },
                    ),
                  ],
                ),
              )
              : null,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Bitte einen Namen eingeben';
                  }
                  return null;
                },
                onSaved: (val) => name = val?.trim() ?? '',
              ),
              const SizedBox(height: 12),
              TextFormField(
                decoration: const InputDecoration(labelText: 'E-Mail-Adresse'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Bitte eine E-Mail-Adresse eingeben';
                  }
                  if (!value.contains('@') || !value.contains('.')) {
                    return 'Bitte eine gültige E-Mail-Adresse eingeben';
                  }
                  return null;
                },
                onSaved: (val) => email = val?.trim() ?? '',
              ),
              const SizedBox(height: 12),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Nachricht'),
                maxLines: 5,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Bitte eine Nachricht eingeben';
                  }
                  return null;
                },
                onSaved: (val) => message = val?.trim() ?? '',
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    _formKey.currentState?.save();
                    // Show confirmation
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Vielen Dank! Ihre Nachricht wurde gesendet.',
                        ),
                      ),
                    );
                    // Reset form fields
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
