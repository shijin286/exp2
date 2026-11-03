import 'package:flutter/material.dart';

/// Model class representing a book in the store.
class Book {
  final String id;
  final String title;
  final String author;
  final String genre;
  final String summary;
  final double price;
  final double mrp;
  final double rating;
  final int reviews;
  final int pages;
  final Color coverColor;
  final bool isBestseller;
  final bool inStock;

  const Book({
    required this.id,
    required this.title,
    required this.author,
    required this.genre,
    required this.summary,
    required this.price,
    required this.mrp,
    required this.rating,
    required this.reviews,
    required this.pages,
    required this.coverColor,
    this.isBestseller = false,
    this.inStock = true,
  });

  /// Percentage saved compared to the MRP.
  int get offPercent => ((mrp - price) / mrp * 100).round();

  /// True when the book is sold below its MRP.
  bool get hasOffer => price < mrp;
}
