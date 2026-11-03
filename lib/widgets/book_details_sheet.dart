import 'package:flutter/material.dart';
import '../models/book.dart';
import 'book_cover.dart';
import 'price_label.dart';
import 'rating_badge.dart';

/// Bottom sheet with the full details of a book.
/// Opened when the user taps a grid or list card.
class BookDetailsSheet extends StatelessWidget {
  final Book book;

  const BookDetailsSheet({super.key, required this.book});

  /// Closes the sheet and confirms the book was added to the cart.
  void _addToCart(BuildContext context) {
    final messenger = ScaffoldMessenger.of(context);
    Navigator.pop(context);
    messenger.showSnackBar(
      SnackBar(content: Text('"${book.title}" added to cart')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                  width: 100,
                  height: 140,
                  child: BookCover(book: book, iconSize: 32),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      book.title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'by ${book.author}',
                      style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                    ),
                    const SizedBox(height: 8),
                    RatingBadge(
                      rating: book.rating,
                      reviews: book.reviews,
                      size: 18,
                    ),
                    const SizedBox(height: 8),
                    PriceLabel(book: book, fontSize: 20),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            book.summary,
            style: const TextStyle(fontSize: 14, height: 1.4),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              Chip(
                avatar: const Icon(Icons.category, size: 16),
                label: Text(book.genre),
              ),
              Chip(
                avatar: const Icon(Icons.description_outlined, size: 16),
                label: Text('${book.pages} pages'),
              ),
              Chip(
                avatar: Icon(
                  book.inStock ? Icons.check_circle : Icons.cancel,
                  size: 16,
                ),
                label: Text(book.inStock ? 'In stock' : 'Out of stock'),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              onPressed: book.inStock ? () => _addToCart(context) : null,
              icon: const Icon(Icons.add_shopping_cart),
              label: Text(
                book.inStock ? 'Add to Cart' : 'Currently unavailable',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
