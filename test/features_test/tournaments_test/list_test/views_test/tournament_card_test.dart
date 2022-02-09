import 'package:esports_crystal/features/tournaments/list/models/tournament_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:esports_crystal/features/tournaments/list/views/tournament_card.dart';

void main() {
  testWidgets('When the tournaments card build it shows tournaments name', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        home: Scaffold(
          body: TournamentCard(tournament: Tournament(name: 'Worlds',id: 1,), gameCode: '1571',),
        ),
      );
    }));
    expect(find.text('Worlds'), findsOneWidget);
  });
}
