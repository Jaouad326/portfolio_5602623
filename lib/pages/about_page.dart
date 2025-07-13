import 'package:flutter/material.dart';
import '../widgets/main_app_bar.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(currentRoute: '/about'),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Über mich', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            Text(
              'Hallo! Ich bin Jaouad Achamlal und studiere an der Technischen Hochschule Mittelhessen. '
              'In diesem Portfolio zeige ich meine Flutter-Projekte und mein Designverständnis.',
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}
