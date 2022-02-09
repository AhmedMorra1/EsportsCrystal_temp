import 'package:esports_crystal/features/tournaments/details/controllers/tournament_detail_controller.dart';
import 'package:esports_crystal/features/tournaments/details/models/cup_tree_round.dart';
import 'package:esports_crystal/features/tournaments/details/views/cuptree/round_choice_row.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

void main() {
  setUp(() {
    final controller = Get.put(TournamentDetailController());
    // make sure the standings list is filled with dummy variables
    controller.cupTreeRounds.value = [
      CupTreeRound(id: 12, type: 1, blocks: [], description: 'description', order: 1),
      CupTreeRound(id: 13, type: 1, blocks: [], description: 'description', order: 1),
      CupTreeRound(id: 14, type: 1, blocks: [], description: 'description', order: 1),
    ];
  });

  testWidgets('Rounds Choice', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(Sizer(builder: (
      context,
      orientation,
      deviceType,
    ) {
      return const GetMaterialApp(
        home: Scaffold(
          body: RoundChoiceRow(),
        ),
      );
    }));
    expect(find.text('description'), findsWidgets);
  });
}
