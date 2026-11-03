import 'package:flutter/material.dart';
import '../data/book_data.dart';
import '../models/book.dart';
import '../utils/screen_size.dart';
import '../widgets/book_details_sheet.dart';
import '../widgets/book_grid_card.dart';
import '../widgets/book_list_card.dart';
import '../widgets/genre_selector.dart';
import '../widgets/genre_sidebar.dart';
import '../widgets/search_header.dart';

/// Sorting options offered in the app bar menu.
enum SortOption { popularity, priceLowToHigh, priceHighToLow, rating }

/// Main screen of BookNest.
///
/// Responsive behaviour:
/// - Mobile (<600): genre chips on top, 2-column grid or list
/// - Tablet (600-1023): genre chips on top, 3-4 column grid
/// - Desktop (>=1024): genre sidebar on the left, 3-5 column grid
///
/// Uses [LayoutBuilder] to read the available width and pick the layout.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedGenre = 'All';
  String _searchText = '';
  SortOption _sortOption = SortOption.popularity;
  bool _showGrid = true;

  /// Books after applying the genre filter, search text and sort order.
  List<Book> get _visibleBooks {
    final query = _searchText.toLowerCase();
    final books = BookData.books.where((book) {
      final genreMatch =
          _selectedGenre == 'All' || book.genre == _selectedGenre;
      final searchMatch = book.title.toLowerCase().contains(query) ||
          book.author.toLowerCase().contains(query);
      return genreMatch && searchMatch;
    }).toList();

    switch (_sortOption) {
      case SortOption.popularity:
        books.sort((a, b) => b.reviews.compareTo(a.reviews));
        break;
      case SortOption.priceLowToHigh:
        books.sort((a, b) => a.price.compareTo(b.price));
        break;
      case SortOption.priceHighToLow:
        books.sort((a, b) => b.price.compareTo(a.price));
        break;
      case SortOption.rating:
        books.sort((a, b) => b.rating.compareTo(a.rating));
        break;
    }
    return books;
  }

  /// Opens the bottom sheet with full details of a book.
  void _openDetails(Book book) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (_) => BookDetailsSheet(book: book),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F7F7),
      appBar: AppBar(
        backgroundColor: Colors.teal[700],
        foregroundColor: Colors.white,
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.auto_stories),
            SizedBox(width: 8),
            Text('BookNest', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        actions: [
          // Sort menu
          PopupMenuButton<SortOption>(
            icon: const Icon(Icons.sort),
            tooltip: 'Sort books',
            initialValue: _sortOption,
            onSelected: (option) => setState(() => _sortOption = option),
            itemBuilder: (context) => const [
              PopupMenuItem(
                value: SortOption.popularity,
                child: Text('Most popular'),
              ),
              PopupMenuItem(
                value: SortOption.priceLowToHigh,
                child: Text('Price: low to high'),
              ),
              PopupMenuItem(
                value: SortOption.priceHighToLow,
                child: Text('Price: high to low'),
              ),
              PopupMenuItem(
                value: SortOption.rating,
                child: Text('Top rated'),
              ),
            ],
          ),
          // Grid / list toggle
          IconButton(
            icon: Icon(_showGrid ? Icons.view_list : Icons.grid_view),
            tooltip: _showGrid ? 'Show as list' : 'Show as grid',
            onPressed: () => setState(() => _showGrid = !_showGrid),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final screenType = ScreenSize.fromWidth(constraints.maxWidth);
          final padding = ScreenSize.sidePadding(screenType);
          return Column(
            children: [
              SearchHeader(
                padding: padding,
                onChanged: (value) => setState(() => _searchText = value),
              ),
              Expanded(
                child: screenType == ScreenType.desktop
                    ? _buildDesktopBody(padding)
                    : _buildCompactBody(padding),
              ),
            ],
          );
        },
      ),
    );
  }

  /// Mobile and tablet: genre chips on top, books below.
  Widget _buildCompactBody(double padding) {
    return Column(
      children: [
        const SizedBox(height: 12),
        GenreSelector(
          genres: BookData.genres,
          selected: _selectedGenre,
          padding: padding,
          onSelected: (genre) => setState(() => _selectedGenre = genre),
        ),
        _buildResultBar(padding),
        Expanded(child: _buildBooks(padding)),
      ],
    );
  }

  /// Desktop: genre sidebar on the left, books on the right.
  Widget _buildDesktopBody(double padding) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GenreSidebar(
          genres: BookData.genres,
          selected: _selectedGenre,
          countFor: BookData.countFor,
          onSelected: (genre) => setState(() => _selectedGenre = genre),
        ),
        Expanded(
          child: Column(
            children: [
              _buildResultBar(padding),
              Expanded(child: _buildBooks(padding)),
            ],
          ),
        ),
      ],
    );
  }

  /// Row showing the current genre and the number of books found.
  Widget _buildResultBar(double padding) {
    return Padding(
      padding: EdgeInsets.fromLTRB(padding, 12, padding, 8),
      child: Row(
        children: [
          Text(
            _selectedGenre == 'All' ? 'All Books' : _selectedGenre,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          Text(
            '${_visibleBooks.length} found',
            style: TextStyle(color: Colors.grey[700]),
          ),
        ],
      ),
    );
  }

  /// Shows the books as a grid or a list. The grid column count is
  /// calculated from the width that is left for the books.
  Widget _buildBooks(double padding) {
    final books = _visibleBooks;

    if (books.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.search_off, size: 64, color: Colors.grey[400]),
            const SizedBox(height: 8),
            Text(
              'No books match your search',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ],
        ),
      );
    }

    if (!_showGrid) {
      return ListView.builder(
        padding: EdgeInsets.fromLTRB(padding, 0, padding, 16),
        itemCount: books.length,
        itemBuilder: (context, index) => BookListCard(
          book: books[index],
          onTap: () => _openDetails(books[index]),
        ),
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final columns = ScreenSize.gridColumns(constraints.maxWidth);
        return GridView.builder(
          padding: EdgeInsets.fromLTRB(padding, 0, padding, 16),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: columns,
            mainAxisExtent: 340,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemCount: books.length,
          itemBuilder: (context, index) => BookGridCard(
            book: books[index],
            onTap: () => _openDetails(books[index]),
          ),
        );
      },
    );
  }
}
