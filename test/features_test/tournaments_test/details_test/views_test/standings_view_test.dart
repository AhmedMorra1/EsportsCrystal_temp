import 'package:esports_crystal/features/tournaments/details/models/standings_row.dart';
import 'package:esports_crystal/features/tournaments/details/views/standings/standings_row_view.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

void main() {
  testWidgets('When the Standings row build it shows team name', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(Sizer(builder: (
        context,
        orientation,
        deviceType,
        ) {
      return GetMaterialApp(
        home: Scaffold(
          body: StandingsRowView(standingsRow: StandingsRow(wins: 2, position: 1, losses: 2, name: 'G2', id: 1234, matches: 4
          ),),
        ),
      );
    }));
    expect(find.text('G2'), findsOneWidget);
  });
}
