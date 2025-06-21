import 'package:flutter/material.dart';
import 'slider_page.dart';
import 'profile_form_page.dart';
import 'settings_page.dart';
import 'summary_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double sliderValue = 0;
  String name = '';
  String email = '';
  String about = '';
  bool newsletter = false;
  bool notifications = false;
  bool darkMode = false;
  bool offlineMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Portfolio von 5602623 - Achamlal, Jaouad'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Willkommen im Portfolio von 5602623 - Achamlal, Jaouad',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final result = await Navigator.push<double>(
                  context,
                  MaterialPageRoute(
                    builder: (_) => SliderPage(initialValue: sliderValue),
                  ),
                );
                if (result != null) {
                  setState(() => sliderValue = result);
                }
              },
              child: const Text('Zur Slider-Seite'),
            ),
            ElevatedButton(
              onPressed: () async {
                final result = await Navigator.push<Map<String, String>>(
                  context,
                  MaterialPageRoute(builder: (_) => ProfileFormPage()),
                );
                if (result != null) {
                  setState(() {
                    name = result['name'] ?? '';
                    email = result['email'] ?? '';
                    about = result['about'] ?? '';
                  });
                }
              },
              child: const Text('Zum Formular'),
            ),
            ElevatedButton(
              onPressed: () async {
                final result = await Navigator.push<Map<String, bool>>(
                  context,
                  MaterialPageRoute(builder: (_) => SettingsPage()),
                );
                if (result != null) {
                  setState(() {
                    newsletter = result['newsletter'] ?? false;
                    notifications = result['notifications'] ?? false;
                    darkMode = result['darkMode'] ?? false;
                    offlineMode = result['offlineMode'] ?? false;
                  });
                }
              },
              child: const Text('Zu den Einstellungen'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (_) => SummaryPage(
                          sliderValue: sliderValue,
                          name: name,
                          email: email,
                          about: about,
                          newsletter: newsletter,
                          notifications: notifications,
                          darkMode: darkMode,
                          offlineMode: offlineMode,
                        ),
                  ),
                );
              },
              child: const Text('Zur Zusammenfassung'),
            ),
          ],
        ),
      ),
    );
  }
}
