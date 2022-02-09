import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:esports_crystal/features/match_details/dota/views/match_games_row.dart';

void main() {
  testWidgets('Match Games List Row', (WidgetTester tester) async {
    await tester.pumpAndSettle(const Duration(seconds: 5));
    // Build our app and trigger a frame.
    await tester.pumpWidget(const GetMaterialApp(
      home: Scaffold(
        body: GamesListRow(
          gamesList: [1, 2, 3],
          selectedGameIndex: 1,
        ),
      ),
    ));
    expect(find.text('1'), findsOneWidget);
    expect(find.text('2'), findsOneWidget);
    expect(find.text('3'), findsOneWidget);
  });
}