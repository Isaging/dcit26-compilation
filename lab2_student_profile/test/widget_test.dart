import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lab2_student_profile/main.dart';

void main() {
  testWidgets('Renders all six required profile fields in a scrollable view',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const Lab2StudentProfileApp());

    // Verify AppBar title
    expect(find.text('Student Profile'), findsOneWidget);

    // Verify all 6 required labels exist
    expect(find.text('Name'), findsOneWidget);
    expect(find.text('Age'), findsOneWidget);
    expect(find.text('Course/Year/Section'), findsOneWidget);
    expect(find.text('About me'), findsOneWidget);
    expect(find.text('Achievements'), findsOneWidget);
    expect(find.text('Skills'), findsOneWidget);

    // Verify values exist
    expect(find.text('Alvarez, Joyce E.'), findsOneWidget);
    expect(find.text('20'), findsOneWidget);
    expect(find.text('BS Computer Science 3-1'), findsOneWidget);

    // Verify SingleChildScrollView is present to prevent clipping
    expect(find.byType(SingleChildScrollView), findsOneWidget);
  });
}
