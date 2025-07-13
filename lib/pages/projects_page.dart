import 'package:flutter/material.dart';
import '../widgets/main_app_bar.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    final projects = [
      {
        'title': 'Notizen-App',
        'description':
            'Erstelle, speichere und bearbeite Notizen lokal mit Flutter.',
      },
      {
        'title': 'Portfolio-Webseite',
        'description':
            'Persönliche Website mit Infos, Skills und Kontakt – HTML, CSS & JS.',
      },
      {
        'title': 'Interaktives Formular',
        'description':
            'Daten aus Formular, Slider und Einstellungen werden zusammengefasst.',
      },
    ];

    return Scaffold(
      appBar: const MainAppBar(currentRoute: '/projects'),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: isMobile ? 1 : 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 3 / 1, // flacher, breiter
          ),
          itemCount: projects.length,
          itemBuilder: (ctx, i) {
            final proj = projects[i];
            return InkWell(
              onTap: () {
                // hier könntest du später Detailseiten öffnen
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  child: Row(
                    children: [
                      // kleines Icon oder Platzhalter
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(Icons.work, color: Color(0xFF007AFF)),
                      ),
                      const SizedBox(width: 16),
                      // Text-Bereich
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              proj['title']!,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              proj['description']!,
                              style: const TextStyle(fontSize: 14),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
