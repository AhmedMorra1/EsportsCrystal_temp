import 'package:esports_crystal/features/tournaments/details/controllers/tournament_detail_controller.dart';
import 'package:esports_crystal/features/tournaments/details/models/standings.dart';
import 'package:esports_crystal/features/tournaments/details/views/standings/standings_menu.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

void main() {

  setUp((){
    final controller = Get.put(TournamentDetailController());
    controller.standingsList.value = [Standings(name: 'name', rows: [], type: 'type', id: 3121)];
  });

  testWidgets('When the tournaments row title build it shows tournaments name', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(Sizer(builder: (
        context,
        orientation,
        deviceType,
        ) {
      return const GetMaterialApp(
        home: Scaffold(
          body: StandingsMenu(),
        ),
      );
    }));
    expect(find.text('name'), findsOneWidget);
  });
}
