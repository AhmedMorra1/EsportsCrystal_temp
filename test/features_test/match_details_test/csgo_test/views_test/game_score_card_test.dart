import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:esports_crystal/features/match_details/csgo/views/game_score_card.dart';
void main(){
  testWidgets('Game Score Card', (WidgetTester tester) async {
    await tester.pumpAndSettle(const Duration(seconds: 5));
    // Build our app and trigger a frame.
    await tester.pumpWidget(const GetMaterialApp(
      home: Scaffold(
        body: GameScoreCardCSGO(awayTeamName: 'G2 Esports', mapName: 'Inferno', awayTeamScore: '11', homeTeamScore: '16', periodsScoresList: [{'home': '10', 'statName': 'Half 1', 'away': '5'},
          {'home': '6', 'statName': 'Half 2', 'away': '9'}], homeTeamSide: '4', homeTeamName: 'Gambit',

        ),
      ),
    ));
    expect(find.text('G2 Esports'), findsOneWidget);
    expect(find.text('Gambit'), findsOneWidget);
    expect(find.text('Half 2'), findsOneWidget);
    expect(find.text('Inferno'), findsOneWidget);
  });
}