import 'package:esports_crystal/features/schedule/models/match_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:esports_crystal/features/match_details/csgo/views/no_start_card.dart';
import 'package:sizer/sizer.dart';

void main() {
  testWidgets('When title build it shows title', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    tester.binding.window.physicalSizeTestValue = const Size(720, 1180);
    await tester.pumpWidget(Sizer(builder: (
      context,
      orientation,
      deviceType,
    ) {
      return GetMaterialApp(
        home: Scaffold(
          body: NoStartCard(
            matchDetails: MatchDetails(
              eventType: 'best_of',
              status: 'canceled',
              tournament: 'tournament',
              id: '131',
              awayTeam: 'G2 Esports',
              homeTeam: 'Fnatic',
              startTimestamp: '2543674586',
              homeScore: '1',
              bestOf: '3',
              awayScore: '2',
                tournamentId: '12313'
            ),
          ),
        ),
      );
    }));
    expect(find.text('Fnatic'), findsOneWidget);
  });
}
