import 'package:flutter_test/flutter_test.dart';
import 'package:booknest/main.dart';

void main() {
  testWidgets('Catalog shows the app title and books', (tester) async {
    await tester.pumpWidget(const BookNestApp());
    expect(find.text('BookNest'), findsOneWidget);
    expect(find.text('All Books'), findsOneWidget);
  });
}
