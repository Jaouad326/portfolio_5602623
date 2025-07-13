import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/projects_page.dart';
import 'pages/about_page.dart';
import 'pages/contact_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF007AFF)),
        primaryColor: const Color(0xFF007AFF),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
          displayMedium: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
          bodyLarge: TextStyle(fontSize: 16, height: 1.5),
          labelLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF007AFF),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => const HomePage(),
        '/projects': (_) => const ProjectsPage(),
        '/about': (_) => const AboutPage(),
        '/contact': (_) => const ContactPage(),
      },
    );
  }
}
