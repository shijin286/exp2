import 'package:flutter/material.dart';

/// Vertical genre menu shown on desktop screens.
/// Each entry shows an icon and how many books belong to that genre.
class GenreSidebar extends StatelessWidget {
  final List<String> genres;
  final String selected;
  final int Function(String genre) countFor;
  final ValueChanged<String> onSelected;

  const GenreSidebar({
    super.key,
    required this.genres,
    required this.selected,
    required this.countFor,
    required this.onSelected,
  });

  /// Picks an icon for each genre.
  IconData _iconFor(String genre) {
    switch (genre) {
      case 'Fiction':
        return Icons.theater_comedy;
      case 'Technology':
        return Icons.computer;
      case 'Self-Help':
        return Icons.self_improvement;
      case 'Science':
        return Icons.science;
      case 'Biography':
        return Icons.person;
      default:
        return Icons.library_books;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      margin: const EdgeInsets.fromLTRB(16, 16, 0, 16),
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.teal.withValues(alpha: 0.15)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Text(
              'Genres',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          for (final genre in genres)
            ListTile(
              dense: true,
              leading: Icon(_iconFor(genre), size: 20),
              title: Text(genre),
              trailing: Text('${countFor(genre)}'),
              selected: genre == selected,
              selectedColor: Colors.teal[800],
              selectedTileColor: Colors.teal.withValues(alpha: 0.08),
              onTap: () => onSelected(genre),
            ),
        ],
      ),
    );
  }
}
