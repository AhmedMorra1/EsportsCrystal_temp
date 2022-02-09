import 'package:esports_crystal/features/schedule/models/match_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:esports_crystal/features/schedule/views/tournament_card.dart';

void main(){
  testWidgets('Tournament Card', (WidgetTester tester) async {
    // Change the size of the phone or the test will fail or either change the text size to 3 not 4
    tester.binding.window.physicalSizeTestValue = Size(720, 1080);

    String gameCode = '1571';
    String tournament = 'Worlds';
    List matchList = [
      MatchDetails(
          tournament: tournament,
          status: 'finished',
          homeTeam: 'Damwon Gaming',
          awayTeam: 'G2 Esports',
          id: '234567',
          startTimestamp: '1636562491',
          homeScore: '1',
          awayScore: '0',
          eventType: 'best_of',
          bestOf: '3',
      tournamentId: '12313'),
      MatchDetails(
          tournament: tournament,
          status: 'inprogress',
          homeTeam: 'SKT T1',
          awayTeam: 'Fnatic',
          id: '234577',
          startTimestamp: '1636562491',
          homeScore: '0',
          awayScore: '0',
          eventType: 'best_of',
          bestOf: '3',
          tournamentId: '12313'),
    ];
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      GetMaterialApp(
        home: Scaffold(
          body: TournamentCard(
            gameCode: gameCode,
            tournament: tournament,
            matchList: matchList, tournamentId: '234554',
          ),
        ),
      ),
    );

    //find games names text
    expect(find.text('Live'), findsOneWidget);
    expect(find.text('FT'), findsOneWidget);
    expect(find.text('Damwon Gaming'), findsOneWidget);

    //this used to skip the timer opened for testing
    await tester.pumpAndSettle(const Duration(microseconds: 1));

    // resets the screen to its original size after the test end
    addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
  });
}