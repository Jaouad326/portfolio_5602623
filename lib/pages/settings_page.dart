import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool newsletter = false;
  bool notifications = false;
  bool darkMode = false;
  bool offlineMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Einstellungen')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CheckboxListTile(
              title: const Text('Newsletter abonnieren'),
              value: newsletter,
              onChanged: (val) => setState(() => newsletter = val ?? false),
            ),
            CheckboxListTile(
              title: const Text('Benachrichtigungen erlauben'),
              value: notifications,
              onChanged: (val) => setState(() => notifications = val ?? false),
            ),
            const Divider(),
            SwitchListTile(
              title: const Text('Dunkler Modus'),
              value: darkMode,
              onChanged: (val) => setState(() => darkMode = val),
            ),
            SwitchListTile(
              title: const Text('Offline-Modus'),
              value: offlineMode,
              onChanged: (val) => setState(() => offlineMode = val),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, {
                  'newsletter': newsletter,
                  'notifications': notifications,
                  'darkMode': darkMode,
                  'offlineMode': offlineMode,
                });
              },
              child: const Text('Zurück zur Startseite'),
            ),
          ],
        ),
      ),
    );
  }
}
