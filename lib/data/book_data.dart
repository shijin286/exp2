import 'package:flutter/material.dart';
import '../models/book.dart';

/// Sample book data for the BookNest catalog.
class BookData {
  static const List<Book> books = [
    Book(
      id: 'b1',
      title: 'Wings of Fire',
      author: 'A. P. J. Abdul Kalam',
      genre: 'Biography',
      summary:
          'The autobiography of Dr. Kalam, from his childhood in Rameswaram to leading India\'s missile programme.',
      price: 299,
      mrp: 399,
      rating: 4.8,
      reviews: 15420,
      pages: 196,
      coverColor: Color(0xFFE65100),
      isBestseller: true,
    ),
    Book(
      id: 'b2',
      title: 'Atomic Habits',
      author: 'James Clear',
      genre: 'Self-Help',
      summary:
          'A practical guide to building good habits and breaking bad ones through small, steady changes.',
      price: 499,
      mrp: 799,
      rating: 4.7,
      reviews: 21890,
      pages: 320,
      coverColor: Color(0xFF37474F),
      isBestseller: true,
    ),
    Book(
      id: 'b3',
      title: 'The Alchemist',
      author: 'Paulo Coelho',
      genre: 'Fiction',
      summary:
          'A young shepherd travels across the desert in search of treasure and discovers his true purpose.',
      price: 259,
      mrp: 350,
      rating: 4.6,
      reviews: 18760,
      pages: 208,
      coverColor: Color(0xFFF9A825),
    ),
    Book(
      id: 'b4',
      title: 'Clean Code',
      author: 'Robert C. Martin',
      genre: 'Technology',
      summary:
          'Principles and practices for writing readable, maintainable and well-structured code.',
      price: 649,
      mrp: 899,
      rating: 4.5,
      reviews: 6120,
      pages: 464,
      coverColor: Color(0xFF1565C0),
    ),
    Book(
      id: 'b5',
      title: 'Sapiens',
      author: 'Yuval Noah Harari',
      genre: 'Science',
      summary:
          'A brief history of humankind, from the first humans to the scientific and industrial revolutions.',
      price: 549,
      mrp: 699,
      rating: 4.6,
      reviews: 12340,
      pages: 512,
      coverColor: Color(0xFF6D4C41),
      isBestseller: true,
    ),
    Book(
      id: 'b6',
      title: 'Pride and Prejudice',
      author: 'Jane Austen',
      genre: 'Fiction',
      summary:
          'The classic story of Elizabeth Bennet and Mr. Darcy, and the first impressions that keep them apart.',
      price: 199,
      mrp: 199,
      rating: 4.4,
      reviews: 9350,
      pages: 432,
      coverColor: Color(0xFFAD1457),
    ),
    Book(
      id: 'b7',
      title: 'The Pragmatic Programmer',
      author: 'David Thomas, Andrew Hunt',
      genre: 'Technology',
      summary:
          'Timeless advice on becoming a better developer, from version control to writing flexible code.',
      price: 749,
      mrp: 999,
      rating: 4.7,
      reviews: 4210,
      pages: 352,
      coverColor: Color(0xFF2E7D32),
      inStock: false,
    ),
    Book(
      id: 'b8',
      title: 'Ikigai',
      author: 'Hector Garcia, Francesc Miralles',
      genre: 'Self-Help',
      summary:
          'The Japanese idea of finding purpose and joy in everyday life, explained through simple lessons.',
      price: 349,
      mrp: 450,
      rating: 4.3,
      reviews: 11080,
      pages: 208,
      coverColor: Color(0xFFC62828),
    ),
    Book(
      id: 'b9',
      title: 'A Brief History of Time',
      author: 'Stephen Hawking',
      genre: 'Science',
      summary:
          'An introduction to black holes, the Big Bang and the nature of time, written for every reader.',
      price: 399,
      mrp: 499,
      rating: 4.5,
      reviews: 8640,
      pages: 256,
      coverColor: Color(0xFF283593),
    ),
    Book(
      id: 'b10',
      title: 'Malgudi Days',
      author: 'R. K. Narayan',
      genre: 'Fiction',
      summary:
          'A collection of short stories about the people of Malgudi, a small town in South India.',
      price: 225,
      mrp: 299,
      rating: 4.5,
      reviews: 5230,
      pages: 256,
      coverColor: Color(0xFF00838F),
    ),
    Book(
      id: 'b11',
      title: 'Steve Jobs',
      author: 'Walter Isaacson',
      genre: 'Biography',
      summary:
          'The life of the Apple co-founder, based on interviews with Jobs, his family and colleagues.',
      price: 599,
      mrp: 899,
      rating: 4.6,
      reviews: 7410,
      pages: 656,
      coverColor: Color(0xFF424242),
    ),
    Book(
      id: 'b12',
      title: 'Flutter in Action',
      author: 'Eric Windmill',
      genre: 'Technology',
      summary:
          'A hands-on introduction to building cross-platform mobile apps with Flutter and Dart.',
      price: 899,
      mrp: 1199,
      rating: 4.2,
      reviews: 860,
      pages: 368,
      coverColor: Color(0xFF0277BD),
    ),
  ];

  /// All genres in the catalog, with 'All' as the first option.
  static List<String> get genres =>
      ['All', ...books.map((book) => book.genre).toSet()];

  /// Number of books in the given genre.
  static int countFor(String genre) => genre == 'All'
      ? books.length
      : books.where((book) => book.genre == genre).length;
}
