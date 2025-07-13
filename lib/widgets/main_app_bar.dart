import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String currentRoute;
  const MainAppBar({super.key, required this.currentRoute});

  @override
  Widget build(BuildContext context) {
    const routes = ['/', '/projects', '/about', '/contact'];
    const labels = ['Home', 'Work', 'About', 'Contact'];
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(routes.length, (i) {
          final selected = routes[i] == currentRoute;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextButton(
              onPressed: selected
                  ? null
                  : () => Navigator.pushReplacementNamed(context, routes[i]),
              child: Text(
                labels[i],
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: selected ? FontWeight.bold : FontWeight.normal,
                  color: const Color(0xFF007AFF),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
