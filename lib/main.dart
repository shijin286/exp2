import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const BookNestApp());
}

/// Root widget of the BookNest responsive book store.
class BookNestApp extends StatelessWidget {
  const BookNestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BookNest',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.teal,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
