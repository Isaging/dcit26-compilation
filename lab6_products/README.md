# Lab 6 - Product Data (`lab6_products`)

Flutter application implementing **Laboratory Exercise #6: Product Data** using an in-memory Dart `List<Product>`, `ListView.builder`, and constructor-based navigation to a detail screen (no networking or database persistence).

## Project Structure

- `lib/models/product.dart` — Immutable `Product` class with `id`, `title`, `description`, and `rating`.
- `lib/data/sample_products.dart` — In-memory `List<Product>` with 5 sample products (`P-001` through `P-005`).
- `lib/screens/home_screen.dart` — Scrollable product list built with `ListView.builder`; tapping any item navigates to `ProductDetailScreen` and passes the selected `Product`.
- `lib/screens/product_detail_screen.dart` — Receives `Product` via its constructor and displays its title, description, rating, and identifier (`Product key: <id>`).
- `lib/main.dart` — App entry point and Material 3 theme.
- `test/widget_test.dart` — Verifies selecting and checking details for three different products.

## Running the Project

```bash
flutter create .
flutter pub get
flutter test
flutter run
```
