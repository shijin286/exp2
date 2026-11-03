import 'package:flutter/material.dart';

/// Horizontal row of [ChoiceChip]s used to pick a genre
/// on mobile and tablet screens.
class GenreSelector extends StatelessWidget {
  final List<String> genres;
  final String selected;
  final double padding;
  final ValueChanged<String> onSelected;

  const GenreSelector({
    super.key,
    required this.genres,
    required this.selected,
    required this.padding,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: padding),
        itemCount: genres.length,
        itemBuilder: (context, index) {
          final genre = genres[index];
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: ChoiceChip(
              label: Text(genre),
              selected: genre == selected,
              showCheckmark: false,
              selectedColor: Colors.teal[100],
              onSelected: (_) => onSelected(genre),
            ),
          );
        },
      ),
    );
  }
}
