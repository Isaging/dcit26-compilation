import '../models/product.dart';

/// In-memory list of sample products (no API or database persistence).
const List<Product> sampleProducts = [
  Product(
    id: 'P-001',
    title: 'Wireless Mouse',
    description:
        'Comfortable wireless mouse for daily work with ergonomic grip, quiet clicks, and long-lasting battery life.',
    rating: 4.5,
  ),
  Product(
    id: 'P-002',
    title: 'Notebook Set',
    description:
        'Pack of three smooth-paper ruled notebooks ideal for lecture notes, sketches, and daily planning.',
    rating: 4.2,
  ),
  Product(
    id: 'P-003',
    title: 'Angelo Metillo',
    description:
        'Pogi',
    rating: 5,
  ),
  Product(
    id: 'P-004',
    title: 'Mechanical Keyboard',
    description:
        'Compact tactile mechanical keyboard built for responsive typing and durable everyday coding sessions.',
    rating: 4.8,
  ),
  Product(
    id: 'P-005',
    title: 'USB-C Hub',
    description:
        'Multi-port USB-C adapter featuring HDMI output, high-speed USB ports, and pass-through charging.',
    rating: 4.4,
  ),
];
