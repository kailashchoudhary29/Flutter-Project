import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:namer_app/main.dart';

void main() {
  group('MyAppState', () {
    test('getNext should update current with a new WordPair', () {
      final appState = MyAppState();
      final initialPair = appState.current;

      appState.getNext();

      expect(appState.current, isNot(equals(initialPair)));
    });

    group('FavoritesPage Widget', () {
      testWidgets('Displays "No favorites yet." when favorites is empty',
          (WidgetTester tester) async {
        final appState = MyAppState();

        await tester.pumpWidget(
          ChangeNotifierProvider(
            create: (context) => appState,
            child: MaterialApp(
              home: FavoritesPage(),
            ),
          ),
        );

        expect(find.text('No favorites yet.'), findsOneWidget);
      });
    });
  });
}
