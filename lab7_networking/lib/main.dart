import 'package:flutter/material.dart';

import 'home_screen.dart';

void main() {
  runApp(const RandomUserApp());
}

class RandomUserApp extends StatelessWidget {
  const RandomUserApp({super.key});

  static const Color seed = Color(0xFF256F46);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 7 - Networking',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: seed, primary: seed),
        scaffoldBackgroundColor: const Color(0xFFF7F9F8),
        appBarTheme: const AppBarTheme(
          backgroundColor: seed,
          foregroundColor: Colors.white,
          centerTitle: false,
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            backgroundColor: seed,
            foregroundColor: Colors.white,
            minimumSize: const Size.fromHeight(48),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}