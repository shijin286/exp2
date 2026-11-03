import 'package:flutter/material.dart';

/// Shows a star with the average rating and the number of reviews.
class RatingBadge extends StatelessWidget {
  final double rating;
  final int reviews;
  final double size;

  const RatingBadge({
    super.key,
    required this.rating,
    required this.reviews,
    this.size = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.star_rounded, color: Colors.amber[700], size: size),
        const SizedBox(width: 2),
        Text(
          rating.toStringAsFixed(1),
          style: TextStyle(fontSize: size * 0.8, fontWeight: FontWeight.w600),
        ),
        const SizedBox(width: 4),
        Text(
          '($reviews)',
          style: TextStyle(fontSize: size * 0.7, color: Colors.grey[600]),
        ),
      ],
    );
  }
}
