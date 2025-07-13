import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 600;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mein Portfolio'),
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Hallo, ich bin Jaouad.',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Text(
              'Willkommen in meinem Portfolio-Projekt.',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                if (ModalRoute.of(context)?.settings.name != '/projects') {
                  Navigator.pushReplacementNamed(context, '/projects');
                }
              },
              child: const Text('Projekte ansehen'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                if (ModalRoute.of(context)?.settings.name != '/contact') {
                  Navigator.pushReplacementNamed(context, '/contact');
                }
              },
              child: const Text('Kontakt'),
            ),
          ],
        ),
      ),
    );
  }
}
