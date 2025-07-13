import 'package:flutter/material.dart';
import 'profile_form_page.dart';
import 'slider_page.dart';
import 'settings_page.dart';
import 'summary_page.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 600;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meine Projekte'),
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
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const ProjectCard(
            title: 'Notizen-App',
            description:
                'Eine einfache App zum Erstellen, Speichern und Bearbeiten von Notizen. Entwickelt mit Flutter und lokalem Speicher.',
          ),
          const SizedBox(height: 12),
          const ProjectCard(
            title: 'Timer für Workouts',
            description:
                'Ein Timer mit verschiedenen Trainingsphasen für Intervalltraining. Mit Start/Stop und Tonbenachrichtigung.',
          ),
          const SizedBox(height: 12),
          const ProjectCard(
            title: 'Portfolio-Website',
            description:
                'Eine persönliche Website mit Informationen über mich, Skills und Kontaktmöglichkeiten – mit HTML, CSS und JavaScript.',
          ),
          const SizedBox(height: 12),
          ProjectCard(
            title: 'Interaktives Formular',
            description:
                'Ein mehrschrittiges Formular (Profil, Slider, Einstellungen) mit Validierung, das die eingegebenen Daten auf einer Übersichtsseite zusammenfasst.',
            onTap: () async {
              // Step 1: Profile Form
              final profileResult = await Navigator.push<Map<String, String>>(
                context,
                MaterialPageRoute(builder: (_) => const ProfileFormPage()),
              );
              if (profileResult == null) return;
              // Step 2: Slider selection (initial value 50)
              final sliderResult = await Navigator.push<double>(
                context,
                MaterialPageRoute(
                  builder: (_) => const SliderPage(initialValue: 50),
                ),
              );
              if (sliderResult == null) return;
              // Step 3: Settings
              final settingsResult = await Navigator.push<Map<String, bool>>(
                context,
                MaterialPageRoute(builder: (_) => const SettingsPage()),
              );
              if (settingsResult == null) return;
              // Step 4: Summary
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (_) => SummaryPage(
                        sliderValue: sliderResult,
                        name: profileResult['name'] ?? '',
                        email: profileResult['email'] ?? '',
                        about: profileResult['about'] ?? '',
                        newsletter: settingsResult['newsletter'] ?? false,
                        notifications: settingsResult['notifications'] ?? false,
                        darkMode: settingsResult['darkMode'] ?? false,
                        offlineMode: settingsResult['offlineMode'] ?? false,
                      ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback? onTap;

  const ProjectCard({
    super.key,
    required this.title,
    required this.description,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(description),
            ],
          ),
        ),
      ),
    );
  }
}
