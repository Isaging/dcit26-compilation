import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lab1_hello_world/main.dart';

void main() {
  testWidgets('Renders centered "Hello World!" on light-blue background',
      (WidgetTester tester) async {
    await tester.pumpWidget(const Lab1HelloWorldApp());

    // Verify visible message is exactly "Hello World!"
    final textFinder = find.text('Hello World!');
    expect(textFinder, findsOneWidget);

    // Verify text widget is positioned inside Center
    expect(
      find.ancestor(of: textFinder, matching: find.byType(Center)),
      findsOneWidget,
    );

    // Verify Scaffold background color is light blue
    final scaffold = tester.widget<Scaffold>(find.byType(Scaffold));
    expect(scaffold.backgroundColor, const Color(0xFF81D4FA));
  });
}
