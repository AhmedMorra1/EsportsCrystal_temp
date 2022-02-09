import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:esports_crystal/features/match_details/league/views/team_objectives.dart';

void main() {
  List objectivesRowsData = [
    {'objective': 'Kill', 'homeObjectiveData': 10, 'redObjectiveData': 17},
    {
      'objective': 'Gold',
      'homeObjectiveData': 60600,
      'redObjectiveData': 67600
    },
    {'objective': 'Tower', 'homeObjectiveData': 3, 'redObjectiveData': 9},
    {'objective': 'Dragon', 'homeObjectiveData': 1, 'redObjectiveData': 0},
    {'objective': 'Baron', 'homeObjectiveData': 0, 'redObjectiveData': 1},
    {'objective': 'Elder', 'homeObjectiveData': 0, 'redObjectiveData': 0},
    {
      'objective': 'Inhibitor',
      'homeObjectiveData': 0,
      'redObjectiveData': 1
    }
  ];
  testWidgets('Team Objectives Card', (WidgetTester tester) async {
    tester.binding.window.physicalSizeTestValue = const Size(720, 1080);
    await tester.pumpAndSettle(const Duration(seconds: 5));
    // Build our app and trigger a frame.
    await tester.pumpWidget(GetMaterialApp(
      home: Scaffold(
        body: GameTeamObjectives(
          homeTeamSide: 'blue',
          objectivesRowsData: objectivesRowsData,
        ),
      ),
    ));
  });
}