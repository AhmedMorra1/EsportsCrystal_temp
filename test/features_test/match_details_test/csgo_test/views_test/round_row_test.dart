import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:esports_crystal/features/match_details/csgo/views/round_row.dart';

void main() {
  testWidgets('Match Games List Row', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const GetMaterialApp(
      home: Scaffold(
        body: RoundRow(
          homeColor:Colors.yellow,
          awayColor:Colors.blue,
          homeOutcome:'5 Eliminated',
          awayOutcome:'',
         roundNumber:1,
         homeOutcomeIcon:FontAwesomeIcons.skull,
          awayOutcomeIcon:null,
        ),
      ),
    ));
    expect(find.text('5 Eliminated'), findsOneWidget);
    expect(
        find.byWidgetPredicate((Widget widget) =>
        widget is FaIcon && widget.icon == FontAwesomeIcons.skull),
        findsOneWidget);
  });
}