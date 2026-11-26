import 'package:flutter/material.dart';

void main() {
  runApp(const Lab1HelloWorldApp());
}

/// Root application widget for Laboratory Exercise #1: Hello World.
/// Demonstrates the core Flutter building blocks:
/// [main], [runApp], [MaterialApp], [Scaffold], [Center], and [Text].
class Lab1HelloWorldApp extends StatelessWidget {
  const Lab1HelloWorldApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Lab 1 - Hello World',
      debugShowCheckedModeBanner: false,
      home: HelloWorldScreen(),
    );
  }
}

class HelloWorldScreen extends StatelessWidget {
  const HelloWorldScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // Light-blue background matching the expected output illustration
      backgroundColor: Color(0xFF81D4FA),
      body: Center(
        child: Text(
          'Hello World!',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0D2538), // Dark, high-contrast text
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
  }
}
