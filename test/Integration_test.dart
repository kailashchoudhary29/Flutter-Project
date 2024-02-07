import 'package:flutter_test/flutter_test.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/main.dart';

void main() {
  testWidgets('Integration Test check all text field',
      (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.text('Random Text App'), findsOneWidget);
    //tap fav icon
    await tester.tap(find.byIcon(Icons.favorite));
    await tester.pumpAndSettle();

    expect(find.text('No favorites yet.'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.home));
    await tester.pumpAndSettle();

    expect(find.text('Like'), findsOneWidget);
    expect(find.text('Next'), findsOneWidget);

    await tester.tap(find.text('Next'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Like'));
    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.favorite).last);
    await tester.pumpAndSettle();

    //verify text-icons present on Favorites widget
    expect(find.text('You have 1 favorites!!'), findsOneWidget);
  });

  testWidgets('Integration Test check color of screen',
      (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    final materialApp = find.byType(MaterialApp);

    final ThemeData? theme = tester.widget<MaterialApp>(materialApp)?.theme;

    // Verify the primary color in the color
    expect(
      theme?.colorScheme.primary,
      equals(Color(0xff006497)),
    );
  });
}
