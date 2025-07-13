import 'package:flutter/material.dart';
import '../widgets/main_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const MainAppBar(currentRoute: '/'),
      body: Column(
        children: [
          // Hero-Bereich mit blau-weißem Gradient
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.white, Color(0xFF007AFF)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hallo, ich bin Jaouad.',
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge
                            ?.copyWith(color: Colors.black),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Willkommen auf meinem Portfolio!',
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(color: Colors.black87),
                      ),
                      const SizedBox(height: 32),
                      Wrap(
                        spacing: 16,
                        children: [
                          ElevatedButton(
                            onPressed: () => Navigator.pushReplacementNamed(
                                context, '/projects'),
                            child: const Text('Projekte ansehen'),
                          ),
                          OutlinedButton(
                            onPressed: () =>
                                Navigator.pushReplacementNamed(
                                    context, '/contact'),
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: Color(0xFF007AFF)),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 32, vertical: 16),
                              foregroundColor: const Color(0xFF007AFF),
                            ),
                            child: const Text('Kontakt'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Highlights
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Highlights',
                    style:
                        Theme.of(context).textTheme.displayMedium),
                const SizedBox(height: 16),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 5)),
                    ],
                  ),
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('• Marketing-Website',
                          style: TextStyle(fontSize: 16)),
                      SizedBox(height: 8),
                      Text('• Interaktive Flutter-Formulare',
                          style: TextStyle(fontSize: 16)),
                      SizedBox(height: 8),
                      Text('• Responsive Designs',
                          style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
