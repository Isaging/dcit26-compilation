import 'package:flutter/material.dart';

/// Circular network image with a loading indicator and an error fallback.
class UserAvatar extends StatelessWidget {
  const UserAvatar({super.key, required this.url, required this.size});

  final String? url;
  final double size;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    Widget fallback() => Container(
          color: scheme.primary.withOpacity(0.12),
          alignment: Alignment.center,
          child: Icon(Icons.person, size: size * 0.55, color: scheme.primary),
        );

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: scheme.primary, width: 2),
      ),
      child: ClipOval(
        child: (url == null || url!.isEmpty)
            ? fallback()
            : Image.network(
                url!,
                width: size,
                height: size,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, progress) {
                  if (progress == null) return child;
                  final total = progress.expectedTotalBytes;
                  return Center(
                    child: CircularProgressIndicator(
                      value: total == null
                          ? null
                          : progress.cumulativeBytesLoaded / total,
                    ),
                  );
                },
                errorBuilder: (context, error, stack) => fallback(),
              ),
      ),
    );
  }
}