import 'package:flutter/material.dart';
import '../models/book.dart';
import 'book_cover.dart';
import 'price_label.dart';
import 'rating_badge.dart';

/// Card used in the grid layout: cover on top, details below.
/// The cover takes whatever height is left after the details.
class BookGridCard extends StatelessWidget {
  final Book book;
  final VoidCallback onTap;

  const BookGridCard({super.key, required this.book, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Cover with offer and bestseller tags
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  BookCover(book: book),
                  if (book.hasOffer)
                    Positioned(
                      top: 8,
                      left: 8,
                      child: _Tag(
                        text: '${book.offPercent}% OFF',
                        color: Colors.red.shade600,
                      ),
                    ),
                  if (book.isBestseller)
                    Positioned(
                      top: 8,
                      right: 8,
                      child: _Tag(
                        text: 'Bestseller',
                        color: Colors.amber.shade800,
                      ),
                    ),
                ],
              ),
            ),
            // Book details
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    book.genre.toUpperCase(),
                    style: TextStyle(
                      fontSize: 10,
                      letterSpacing: 0.8,
                      fontWeight: FontWeight.w600,
                      color: Colors.teal[700],
                    ),
                  ),
                  const SizedBox(height: 4),
                  SizedBox(
                    height: 38,
                    child: Text(
                      book.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        height: 1.3,
                      ),
                    ),
                  ),
                  Text(
                    book.author,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                  ),
                  const SizedBox(height: 6),
                  RatingBadge(rating: book.rating, reviews: book.reviews),
                  const SizedBox(height: 6),
                  PriceLabel(book: book, showOffer: false),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Small coloured label placed on top of the cover.
class _Tag extends StatelessWidget {
  final String text;
  final Color color;

  const _Tag({required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
