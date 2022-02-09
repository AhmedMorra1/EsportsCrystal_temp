import 'package:esports_crystal/features/tournaments/details/controllers/tournament_detail_controller.dart';
import 'package:esports_crystal/features/tournaments/details/models/season.dart';
import 'package:esports_crystal/features/tournaments/details/views/title_card/seasons_menu.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

void main() {

  setUp((){
    final controller = Get.put(TournamentDetailController());
    controller.seasons.value = [Season(name: '2021',id: 12,year:2021)];
  });

  testWidgets('When the season row  build it shows season name', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(Sizer(builder: (
        context,
        orientation,
        deviceType,
        ) {
      return GetMaterialApp(
        home: Scaffold(
          body: SeasonsMenu(),
        ),
      );
    }));
    expect(find.text('2021'), findsOneWidget);
  });
}
