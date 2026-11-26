import 'package:flutter/material.dart';
import 'screens/about_screen.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const Lab5NavigationApp());
}

/// Root widget for Laboratory Exercise #5 (Navigation).
///
/// Navigation Architecture:
/// Uses a single root [Navigator] managed by [MaterialApp] with distinct routes:
/// - '/' -> [HomeScreen] (initial root route with navigation Drawer)
/// - [ProfileScreen] -> pushed from Home via [Navigator.push] + [MaterialPageRoute]
///   and dismissed via [Navigator.pop]
/// - '/about' -> [AboutScreen] (distinct route opened from the Drawer, keeping
///   the Drawer accessible and returning to Home predictably via [Navigator.popUntil]
///   or the system back action)
class Lab5NavigationApp extends StatelessWidget {
  const Lab5NavigationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 5 - Navigation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1F6A42),
        ),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1F6A42),
          foregroundColor: Colors.white,
          centerTitle: false,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/about': (context) => const AboutScreen(),
      },
    );
  }
}
