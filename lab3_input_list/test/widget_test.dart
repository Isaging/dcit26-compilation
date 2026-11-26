import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lab3_input_list/main.dart';

void main() {
  testWidgets('Adds items to the visible list, clears input, and ignores empty input',
      (WidgetTester tester) async {
    await tester.pumpWidget(const Lab3InputListApp());

    // Verify AppBar title and hint
    expect(find.text('Item List'), findsOneWidget);
    expect(find.text('Enter Item'), findsOneWidget);
    expect(find.text('ADD'), findsOneWidget);

    // Initial state: empty prompt visible
    expect(find.textContaining('No items added yet'), findsOneWidget);

    // 1. Tapping ADD with empty string should NOT add anything
    await tester.tap(find.text('ADD'));
    await tester.pumpAndSettle();
    expect(find.textContaining('No items added yet'), findsOneWidget);

    // 2. Tapping ADD with whitespace-only should NOT add anything
    await tester.enterText(find.byType(TextField), '    ');
    await tester.tap(find.text('ADD'));
    await tester.pumpAndSettle();
    expect(find.textContaining('No items added yet'), findsOneWidget);

    // 3. Add first item "Notebook"
    await tester.enterText(find.byType(TextField), 'Notebook');
    await tester.tap(find.text('ADD'));
    await tester.pumpAndSettle();

    // Verify item is added and TextField is cleared
    expect(find.text('Notebook'), findsOneWidget);
    final textField = tester.widget<TextField>(find.byType(TextField));
    expect(textField.controller?.text, '');

    // 4. Add second item "USB drive"
    await tester.enterText(find.byType(TextField), 'USB drive');
    await tester.tap(find.text('ADD'));
    await tester.pumpAndSettle();

    expect(find.text('Notebook'), findsOneWidget);
    expect(find.text('USB drive'), findsOneWidget);
    expect(textField.controller?.text, '');

    // 5. Add third item "Calculator"
    await tester.enterText(find.byType(TextField), 'Calculator');
    await tester.tap(find.text('ADD'));
    await tester.pumpAndSettle();

    expect(find.text('Notebook'), findsOneWidget);
    expect(find.text('USB drive'), findsOneWidget);
    expect(find.text('Calculator'), findsOneWidget);
  });
}
