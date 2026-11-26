import 'package:flutter/material.dart';
import '../screens/about_screen.dart';

/// Shared navigation drawer providing links to Home and About.
///
/// Route design note:
/// This app uses one root Navigator with separate routes:
/// - '/' (Home) is the root route.
/// - Profile is pushed from Home using Navigator.push + MaterialPageRoute.
/// - '/about' (About) is pushed as a distinct route from the drawer.
/// Returning to Home pops back to the first route so duplicate Home/About
/// entries are never stacked and the back action behaves predictably.
class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
    required this.currentRoute,
  });

  final String currentRoute;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: colorScheme.primary,
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.navigation_rounded,
                  color: Colors.white,
                  size: 36,
                ),
                SizedBox(height: 12),
                Text(
                  'Lab 5 - Navigation',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Home'),
            selected: currentRoute == '/',
            selectedTileColor: colorScheme.primaryContainer,
            onTap: () {
              // Close the drawer first.
              Navigator.pop(context);
              if (currentRoute != '/') {
                Navigator.popUntil(context, (route) => route.isFirst);
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('About'),
            selected: currentRoute == '/about',
            selectedTileColor: colorScheme.primaryContainer,
            onTap: () {
              // Close the drawer first.
              Navigator.pop(context);
              if (currentRoute != '/about') {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    settings: const RouteSettings(name: '/about'),
                    builder: (context) => const AboutScreen(),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
