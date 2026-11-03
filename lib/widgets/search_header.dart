import 'package:flutter/material.dart';

/// Banner at the top of the screen with a heading and a search field.
/// The search text is passed back to the screen through [onChanged].
class SearchHeader extends StatelessWidget {
  final double padding;
  final ValueChanged<String> onChanged;

  const SearchHeader({
    super.key,
    required this.padding,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(padding, 12, padding, 20),
      decoration: BoxDecoration(
        color: Colors.teal[700],
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(24),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Find your next read',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Search by title or author',
            style: TextStyle(fontSize: 14, color: Colors.teal[50]),
          ),
          const SizedBox(height: 14),
          TextField(
            onChanged: onChanged,
            decoration: InputDecoration(
              hintText: 'Search books...',
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.zero,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
