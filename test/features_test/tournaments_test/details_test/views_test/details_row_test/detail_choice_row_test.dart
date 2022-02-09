import 'package:esports_crystal/features/tournaments/details/controllers/tournament_detail_controller.dart';
import 'package:esports_crystal/features/tournaments/details/models/standings.dart';
import 'package:esports_crystal/features/tournaments/details/views/details_row/detail_choice_row.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

void main() {
  // setUp((){
  //   final controller_test = Get.put(TournamentDetailController());
  //   // make sure the standings list is filled with dummy variables
  //   controller_test.standingsList.add(Standings(rows: [], name: 'Name', id: 12, type: '31'));
  // });
  testWidgets('When the Detail choice is built it shows 3 types of details', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(Sizer(builder: (
        context,
        orientation,
        deviceType,
        ) {
      return GetMaterialApp(
        home: Scaffold(
          body: DetailChoiceRow(),
        ),
      );
    }));
    expect(find.text('Upcoming'), findsWidgets);
    expect(find.text('Results'), findsWidgets);
    expect(find.text('Standings'), findsWidgets);
  });
}
