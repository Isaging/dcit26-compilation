import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lab4_modal/main.dart';
import 'package:lab4_modal/widgets/sample_modal.dart';

void main() {
  testWidgets('Opens, scrolls, and closes SampleModal on a phone-sized viewport',
      (WidgetTester tester) async {
    // Configure phone-sized surface (e.g., 390x844)
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const Lab4ModalApp());

    // Initial screen shows centered button
    expect(find.text('OPEN MODAL'), findsOneWidget);
    expect(find.byType(SampleModal), findsNothing);

    // Tap button to open modal
    await tester.tap(find.text('OPEN MODAL'));
    await tester.pumpAndSettle();

    expect(find.byType(SampleModal), findsOneWidget);
    expect(find.text('CLOSE'), findsOneWidget);

    // Scroll inside the modal text area
    await tester.drag(
      find.byType(SingleChildScrollView),
      const Offset(0, -200),
    );
    await tester.pumpAndSettle();

    // Tap CLOSE to dismiss the modal
    await tester.tap(find.text('CLOSE'));
    await tester.pumpAndSettle();

    expect(find.byType(SampleModal), findsNothing);
  });
}
