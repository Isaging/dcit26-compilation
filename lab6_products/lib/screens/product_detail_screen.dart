import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({
    super.key,
    required this.product,
  });

  final Product product;

  static const Color _brandGreen = Color(0xFF1F6A42);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            Center(
              child: Container(
                width: 112,
                height: 112,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFFE6F2EC),
                  border: Border.all(
                    color: _brandGreen,
                    width: 2,
                  ),
                ),
                child: product.id == 'P-003'
                ? ClipOval(
                  child: Image.asset(
                    'assets/angelo.jpg'
                  )
                )
                : const Icon(
                  Icons.inventory_2_outlined,
                  size: 48,
                  color: _brandGreen,
                ),
              ),
            ),
            const SizedBox(height: 28),
            Text(
              product.title,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Description',
              style: TextStyle(
                color: _brandGreen,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              product.description,
              style: const TextStyle(
                fontSize: 15,
                height: 1.5,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Rating: ${product.rating.toStringAsFixed(1)} / 5',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Product key: ${product.id}',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
