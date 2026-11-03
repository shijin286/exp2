import 'package:flutter/material.dart';
import '../models/book.dart';

/// Shows the selling price, the MRP struck through and,
/// optionally, the offer percentage.
class PriceLabel extends StatelessWidget {
  final Book book;
  final double fontSize;
  final bool showOffer;

  const PriceLabel({
    super.key,
    required this.book,
    this.fontSize = 16,
    this.showOffer = true,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 6,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(
          '₹${book.price.toStringAsFixed(0)}',
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: Colors.teal[800],
          ),
        ),
        if (book.hasOffer)
          Text(
            '₹${book.mrp.toStringAsFixed(0)}',
            style: TextStyle(
              fontSize: fontSize * 0.75,
              color: Colors.grey[500],
              decoration: TextDecoration.lineThrough,
            ),
          ),
        if (book.hasOffer && showOffer)
          Text(
            '${book.offPercent}% off',
            style: TextStyle(
              fontSize: fontSize * 0.75,
              color: Colors.green[700],
              fontWeight: FontWeight.w600,
            ),
          ),
      ],
    );
  }
}
