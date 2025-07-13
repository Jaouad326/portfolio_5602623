import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Über mich')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Über mich',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Hallo! Ich bin Jaouad Achamlal, Student an der Technischen Hochschule Mittelhessen. '
              'In diesem Portfolio-Projekt zeige ich meine Fähigkeiten mit Flutter sowie mein Gespür '
              'für sauberes UI-Design und funktionale Nutzeroberflächen.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            Text(
              '„Technologie sollte zugänglich, einfach und ästhetisch sein.“',
              style: TextStyle(fontStyle: FontStyle.italic, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
