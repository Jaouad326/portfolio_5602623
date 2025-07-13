import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Kontakt")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "E-Mail (THM):",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SelectableText("jaouad.achamlal@mnd.thm.de"),
            SizedBox(height: 20),
            Text(
              "Private E-Mail:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SelectableText("a.jaouad326@gmail.com"),
            SizedBox(height: 20),
            Text("GitHub:", style: TextStyle(fontWeight: FontWeight.bold)),
            SelectableText("https://github.com/Jaouad326"),
          ],
        ),
      ),
    );
  }
}
