import 'package:flutter/material.dart';

class AboutMePage extends StatelessWidget {
  const AboutMePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Über mich"),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: const [
          Text(
            "Hallo, ich bin Jaouad Achamlal",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 24),
          Text(
            "Ich studiere an der THM Medieninformatik und arbeite aktuell an meinem Flutter-Portfolio. "
            "In meiner Freizeit interessiere ich mich für App-Entwicklung, UI-Design und alles, was mit moderner Technologie zu tun hat.",
            style: TextStyle(fontSize: 18, height: 1.5, color: Colors.black87),
          ),
          SizedBox(height: 40),
          Text(
            "Skills",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 12),
          Text(
            "- Flutter & Dart\n- Git & GitHub\n- UI/UX Design mit Figma\n- HTML & CSS",
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 40),
          Text(
            "Kontakt",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 12),
          Text(
            "E-Mail: jaouad.achamlal@mnd.thm.de",
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
