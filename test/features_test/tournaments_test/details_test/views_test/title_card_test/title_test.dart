import 'package:esports_crystal/features/tournaments/details/views/title_card/title.dart';
import 'package:esports_crystal/features/tournaments/list/models/tournament_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

void main() {
  testWidgets('When the tournaments row title build it shows tournaments name', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(Sizer(builder: (
        context,
        orientation,
        deviceType,
        ) {
      return GetMaterialApp(
        home: Scaffold(
          body: TournamentTitle(tournament: Tournament(id: 12, name: 'Worlds',),),
        ),
      );
    }));
    expect(find.text('Worlds'), findsOneWidget);
  });
}
