import 'package:flutter/material.dart';
import '../models/book.dart';

/// Draws a simple book cover from the book's colour and title,
/// so the app does not need any image assets.
class BookCover extends StatelessWidget {
  final Book book;
  final double iconSize;
  final bool showTitle;

  const BookCover({
    super.key,
    required this.book,
    this.iconSize = 40,
    this.showTitle = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [book.coverColor, book.coverColor.withValues(alpha: 0.7)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.menu_book, color: Colors.white70, size: iconSize),
          if (showTitle) ...[
            const SizedBox(height: 8),
            Text(
              book.title,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
