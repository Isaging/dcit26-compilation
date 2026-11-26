import 'package:flutter/material.dart';

void main() {
  runApp(const Lab2StudentProfileApp());
}

/// Root widget for Laboratory Activity #2: Student Profile.
/// Implements a responsive, clean vertical profile layout displaying
/// all six required profile fields: Name, Age, Course/Year/Section,
/// About me, Achievements, and Skills.
class Lab2StudentProfileApp extends StatelessWidget {
  const Lab2StudentProfileApp({super.key});

  static const Color primaryGreen = Color(0xFF1F6A42);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 2 - Student Profile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryGreen,
          primary: primaryGreen,
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF4F7F5),
        appBarTheme: const AppBarTheme(
          backgroundColor: primaryGreen,
          foregroundColor: Colors.white,
          centerTitle: false,
          elevation: 2,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: const StudentProfileScreen(),
    );
  }
}

class StudentProfileScreen extends StatelessWidget {
  const StudentProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF1F6A42);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Profile'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Top Header Card with Avatar, Student Name and Subtitle
            Card(
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: BorderSide(color: primaryColor.withValues(alpha: 0.15)),
              ),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Container(
                      width: 72,
                      height: 72,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xFFE8F3ED),
                        border: Border.all(
                          color: primaryColor,
                          width: 2.5,
                        ),
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/pusa.jpg'
                        ),
                      )
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Joyce E. Alvarez',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1A1A1A),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'BSCS 3-1',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.shade700,
                            ),
                          ),
                          const SizedBox(height: 2),
                          const Text(
                            'Cavite State University',
                            style: TextStyle(
                              fontSize: 12,
                              color: primaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Profile Fields Container / Cards
            Card(
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    // Field 1: Name
                    _ProfileFieldItem(
                      label: 'Name',
                      value: 'Alvarez, Joyce E.',
                      icon: Icons.badge_outlined,
                    ),
                    Divider(height: 24, thickness: 0.8),

                    // Field 2: Age
                    _ProfileFieldItem(
                      label: 'Age',
                      value: '20',
                      icon: Icons.cake_outlined,
                    ),
                    Divider(height: 24, thickness: 0.8),

                    // Field 3: Course/Year/Section
                    _ProfileFieldItem(
                      label: 'Course/Year/Section',
                      value: 'BS Computer Science 3-1',
                      icon: Icons.school_outlined,
                    ),
                    Divider(height: 24, thickness: 0.8),

                    // Field 4: About me
                    _ProfileFieldItem(
                      label: 'About me',
                      value:
                          'A passionate Computer Science student at Cavite State University interested in mobile application development, UI/UX design, and emerging technologies.',
                      icon: Icons.info_outline,
                    ),
                    Divider(height: 24, thickness: 0.8),

                    // Field 5: Achievements
                    _ProfileFieldItem(
                      label: 'Achievements',
                      value:
                          '• Dean\'s Lister (A.Y. 2024–2025)\n• Hackathon Participant\n• University Academic Scholar',
                      icon: Icons.emoji_events_outlined,
                    ),
                    Divider(height: 24, thickness: 0.8),

                    // Field 6: Skills
                    _ProfileFieldItem(
                      label: 'Skills',
                      value:
                          'Flutter, Dart, Mobile App Development, Java, Python, Git & GitHub, UI/UX Design, Team Collaboration',
                      icon: Icons.psychology_outlined,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileFieldItem extends StatelessWidget {
  const _ProfileFieldItem({
    required this.label,
    required this.value,
    required this.icon,
  });

  final String label;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF1F6A42);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 18, color: primaryColor),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: primaryColor,
                letterSpacing: 0.2,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Padding(
          padding: const EdgeInsets.only(left: 26),
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 15,
              color: Color(0xFF2C3E50),
              height: 1.4,
            ),
          ),
        ),
      ],
    );
  }
}
