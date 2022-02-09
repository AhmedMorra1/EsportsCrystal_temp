import 'package:esports_crystal/features/schedule/models/match_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:esports_crystal/features/match_details/csgo/views/teams_card.dart';

void main() {
  testWidgets('Match Teams and Scores Card', (WidgetTester tester) async {
    await tester.pumpAndSettle(const Duration(seconds: 5));
    // Build our app and trigger a frame.
    await tester.pumpWidget(GetMaterialApp(
      home: Scaffold(
        body: GameTeamsCard(
          matchDetails: MatchDetails(
              status: 'inprogress',
              tournament: 'Worlds',
              awayTeam: 'G2 Esports',
              homeTeam: 'Damwon Gaming',
              startTimestamp: '1639861723',
              homeScore: '2',
              id: '12345',
              awayScore: '3',
              eventType: 'best_of',
              bestOf: '3',
              tournamentId: '12313'),
        ),
      ),
    ));
    expect(find.text('G2 Esports'), findsOneWidget);
    expect(find.text('Damwon Gaming'), findsOneWidget);
    expect(find.text('2'), findsOneWidget);
    expect(find.text('3'), findsOneWidget);
    expect(find.text('-'), findsOneWidget);
  });
}