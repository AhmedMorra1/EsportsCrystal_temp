import 'package:esports_crystal/features/tournaments/details/models/cup_participant.dart';
import 'package:esports_crystal/features/tournaments/details/models/cup_tree_round_block.dart';
import 'package:esports_crystal/features/tournaments/details/views/cuptree/block_card.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

void main() {
  testWidgets('When block build it shows teams name and scores', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      Sizer(builder: (
        context,
        orientation,
        deviceType,
      ) {
        return GetMaterialApp(
          home: Scaffold(
            body: BlockCard(
              cupTreeRoundBlock: CupTreeRoundBlock(
                homeTeamScore: '3',
                awayTeamScore: '2',
                participants: [
                  CupParticipant(name: 'G2 Esports', winner: true),
                  CupParticipant(name: 'Damwon Gaming', winner: false),
                ],
              ),
            ),
          ),
        );
      }),
    );
    expect(find.text('G2 Esports'), findsOneWidget);
    expect(find.text('2'), findsOneWidget);
  });
}
