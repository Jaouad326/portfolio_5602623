import 'package:flutter/material.dart';

class SummaryPage extends StatelessWidget {
  final double sliderValue;
  final String name;
  final String email;
  final String about;
  final bool newsletter;
  final bool notifications;
  final bool darkMode;
  final bool offlineMode;

  const SummaryPage({
    super.key,
    required this.sliderValue,
    required this.name,
    required this.email,
    required this.about,
    required this.newsletter,
    required this.notifications,
    required this.darkMode,
    required this.offlineMode,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Zusammenfassung")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Slider-Wert:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('${sliderValue.round()}'),

            const SizedBox(height: 16),
            const Text(
              'Formulardaten:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('Name: $name'),
            Text('E-Mail: $email'),
            Text('Über mich: $about'),

            const SizedBox(height: 16),
            const Text(
              'Einstellungen:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('Newsletter: ${newsletter ? "Ja" : "Nein"}'),
            Text('Benachrichtigungen: ${notifications ? "Ja" : "Nein"}'),
            Text('Dark Mode: ${darkMode ? "Ein" : "Aus"}'),
            Text('Offline-Modus: ${offlineMode ? "Ein" : "Aus"}'),
          ],
        ),
      ),
    );
  }
}
