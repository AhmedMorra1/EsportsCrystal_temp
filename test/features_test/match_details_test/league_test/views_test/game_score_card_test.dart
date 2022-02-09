import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:esports_crystal/features/match_details/league/views/game_score_card.dart';

void main() {
  testWidgets('Game Score Card', (WidgetTester tester) async {
    await tester.pumpAndSettle(const Duration(seconds: 5));
    // Build our app and trigger a frame.
    await tester.pumpWidget(const GetMaterialApp(
      home: Scaffold(
        body: GameScoreCard(
          cardData: {
            'homeTeamName': 'G2 Esports',
            'awayTeamName': 'Fnatic',
            'homeTeamSide': 'blue',
            'gameStatus': 'ended',
            'homeTeamScore': 31,
            'awayTeamScore': 20,
          },
        ),
      ),
    ));
    expect(find.text('G2 Esports'), findsOneWidget);
    expect(find.text('Fnatic'), findsOneWidget);
    expect(find.text('31'), findsOneWidget);
    expect(find.text('20'), findsOneWidget);
    expect(find.text('-'), findsOneWidget);
  });
}