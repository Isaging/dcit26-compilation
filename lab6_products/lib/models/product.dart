/// Immutable product model storing product details and a unique identifier.
///
/// Note: The lab's requested product "key" is represented as the data field [id]
/// (distinct from Flutter's widget [Key] used for UI identity).
class Product {
  const Product({
    required this.id,
    required this.title,
    required this.description,
    required this.rating,
  });

  final String id;
  final String title;
  final String description;
  final double rating;
}
