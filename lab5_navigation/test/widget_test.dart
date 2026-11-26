import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lab5_navigation/main.dart';

void main() {
  testWidgets('Navigates Home <-> Profile and Home <-> About via Drawer',
      (WidgetTester tester) async {
    await tester.pumpWidget(const Lab5NavigationApp());

    // Starts on Home
    expect(find.text('Welcome Home'), findsOneWidget);

    // Home -> Profile
    await tester.tap(find.text('OPEN PROFILE'));
    await tester.pumpAndSettle();
    expect(find.text('Profile screen'), findsOneWidget);

    // Profile -> Home
    await tester.tap(find.text('GO HOME'));
    await tester.pumpAndSettle();
    expect(find.text('Welcome Home'), findsOneWidget);

    // Open Drawer on Home -> navigate to About
    final ScaffoldState homeScaffold = tester.firstState(find.byType(Scaffold));
    homeScaffold.openDrawer();
    await tester.pumpAndSettle();

    await tester.tap(find.text('About'));
    await tester.pumpAndSettle();
    expect(find.text('About this app'), findsOneWidget);

    // Verify Drawer is still available on About and navigates back to Home
    final ScaffoldState aboutScaffold = tester.firstState(find.byType(Scaffold));
    aboutScaffold.openDrawer();
    await tester.pumpAndSettle();

    await tester.tap(find.text('Home'));
    await tester.pumpAndSettle();
    expect(find.text('Welcome Home'), findsOneWidget);
  });
}
