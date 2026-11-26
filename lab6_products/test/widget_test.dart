import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lab6_products/data/sample_products.dart';
import 'package:lab6_products/main.dart';

void main() {
  testWidgets('Displays product list and opens matching details for 3+ products',
      (WidgetTester tester) async {
    await tester.pumpWidget(const Lab6ProductsApp());

    // Home screen displays Products title and scrollable ListView
    expect(find.text('Products'), findsOneWidget);
    expect(find.byType(ListView), findsOneWidget);

    // Test tapping at least three different products and verifying their details
    for (final product in sampleProducts.take(3)) {
      await tester.tap(find.text(product.title));
      await tester.pumpAndSettle();

      expect(find.text('Product Details'), findsOneWidget);
      expect(find.text(product.title), findsOneWidget);
      expect(find.text(product.description), findsOneWidget);
      expect(
        find.text('Rating: ${product.rating.toStringAsFixed(1)} / 5'),
        findsOneWidget,
      );
      expect(find.text('Product key: ${product.id}'), findsOneWidget);

      // Navigate back to the Products list
      await tester.pageBack();
      await tester.pumpAndSettle();
      expect(find.text('Products'), findsOneWidget);
    }
  });
}
