import 'package:flutter/material.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Meine Projekte")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          ProjectCard(
            title: 'Notizen-App',
            description:
                'Eine einfache App zum Erstellen, Speichern und Bearbeiten von Notizen. Entwickelt mit Flutter und lokalem Speicher.',
          ),
          SizedBox(height: 12),
          ProjectCard(
            title: 'Timer für Workouts',
            description:
                'Ein Timer mit verschiedenen Trainingsphasen für Intervalltraining. Mit Start/Stop und Tonbenachrichtigung.',
          ),
          SizedBox(height: 12),
          ProjectCard(
            title: 'Portfolio-Website',
            description:
                'Eine persönliche Website mit Informationen über mich, Skills und Kontaktmöglichkeiten – mit HTML, CSS und JavaScript.',
          ),
        ],
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final String title;
  final String description;

  const ProjectCard({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(description),
          ],
        ),
      ),
    );
  }
}
