import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:esports_crystal/features/match_details/dota/views/lineup.dart';

void main() {
  List lineUpRows = [
    {
      'homePlayerName': 'Player Name',
      'homeChampionName': 'Champion Name',
      'homeKDA': '5/3/2',
      'homeGM': '124',
      'homeLHDN': '13/31',
      'homeXPM': '312',
      'awayPlayerName': 'Player Name',
      'awayChampionName': 'Champion Name',
      'awayKDA': '5/3/2',
      'awayLHDN':  '13/31',
      'awayGM': '124',
      'awayXPM': '3124',
      'number': 1,
      'homeTeamSide': 'blue',
    },
    {
      'homePlayerName': 'Player Name',
      'homeChampionName': 'Champion Name',
      'homeKDA': '5/3/2',
      'homeGM': '124',
      'homeLHDN': '13/31',
      'homeXPM': '312',
      'awayPlayerName': 'Player Name',
      'awayChampionName': 'Champion Name',
      'awayKDA': '5/3/2',
      'awayLHDN':  '13/31',
      'awayGM': '124',
      'awayXPM': '3123',
      'number': 3,
      'homeTeamSide': 'blue',
    },
    {
      'homePlayerName': 'Player Name',
      'homeChampionName': 'Champion Name',
      'homeKDA': '5/3/2',
      'homeGM': '124',
      'homeLHDN': '13/31',
      'homeXPM': '312',
      'awayPlayerName': 'Player Name',
      'awayChampionName': 'Champion Name',
      'awayKDA': '5/3/2',
      'awayLHDN':  '13/31',
      'awayGM': '124',
      'awayXPM': '3122',
      'number': 2,
      'homeTeamSide': 'blue',
    },
    {
      'homePlayerName': 'Player Name',
      'homeChampionName': 'Champion Name',
      'homeKDA': '5/3/2',
      'homeGM': '124',
      'homeLHDN': '13/31',
      'homeXPM': '312',
      'awayPlayerName': 'Player Name',
      'awayChampionName': 'Champion Name',
      'awayKDA': '5/3/2',
      'awayLHDN':  '13/31',
      'awayGM': '124',
      'awayXPM': '3121',
      'number': 4,
      'homeTeamSide': 'blue',
    },
    {
      'homePlayerName': 'Player Name',
      'homeChampionName': 'Champion Name',
      'homeKDA': '5/3/2',
      'homeGM': '124',
      'homeLHDN': '13/31',
      'homeXPM': '312',
      'awayPlayerName': 'Player Name',
      'awayChampionName': 'Champion Name',
      'awayKDA': '5/3/2',
      'awayLHDN':  '13/31',
      'awayGM': '124',
      'awayXPM': '312',
      'number': 5,
      'homeTeamSide': 'blue',
    },
  ];

  testWidgets('Teams Lineups', (WidgetTester tester) async {
    tester.binding.window.physicalSizeTestValue = Size(720, 1180);
    // Build our app and trigger a frame.
    await tester.pumpWidget(GetMaterialApp(
      home: Scaffold(
        body: LineupDota(
          lineUpRows: lineUpRows, homeTeamSide: 'blue',
        ),
      ),
    ));
    expect(find.text('312'), findsWidgets);
    expect(find.text('Champion Name'), findsWidgets);
    expect(find.text('13/31'), findsWidgets);
    expect(find.text('124'), findsWidgets);
    expect(find.text('Player Name'), findsWidgets);
  });
}