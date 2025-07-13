import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 600;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Über mich'),
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
      body: Padding(
        padding: const EdgeInsets.all(24.0),
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
