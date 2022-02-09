import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:esports_crystal/features/match_details/league/views/lineup.dart';

void main() {
  List lineUpRows = [
    {
      'homePlayerName': 'Cabochard',
      'homeChampionName': 'Kennen',
      'homeStats': '4/1/2 123 CS 6.1K',
      'lane': 'TOP',
      'awayPlayerName': 'SLT',
      'awayChampionName': 'Graves',
      'awayStats': '0/4/1 153 CS 5.5K',
    },
    {
      'homePlayerName': '113',
      'homeChampionName': 'Lee Sin',
      'homeStats': '4/1/2 123 CS 6.1K',
      'lane': 'JNG',
      'awayPlayerName': 'Koldo',
      'awayChampionName': 'Xin Zhao',
      'awayStats': '0/4/1 153 CS 5.5K',
    },
    {
      'homePlayerName': 'Saken',
      'homeChampionName': 'Yassou',
      'homeStats': '4/1/2 123 CS 6.1K',
      'lane': 'MID',
      'awayPlayerName': 'Hatrixx',
      'awayChampionName': 'Orianna',
      'awayStats': '0/4/1 153 CS 5.5K',
    },
    {
      'homePlayerName': 'Rekkless',
      'homeChampionName': 'Caitlyn',
      'homeStats': '4/1/2 123 CS 6.1K',
      'lane': 'ADC',
      'awayPlayerName': 'Rafitta',
      'awayChampionName': 'Miss Fortune',
      'awayStats': '0/4/1 153 CS 5.5K',
    },
    {
      'homePlayerName': 'Hantera',
      'homeChampionName': 'Lux',
      'homeStats': '4/1/2 123 CS 6.1K',
      'lane': 'SUP',
      'awayPlayerName': 'seaz',
      'awayChampionName': 'Yami',
      'awayStats': '0/4/1 153 CS 5.5K',
    },
  ];

  testWidgets('Teams Lineups', (WidgetTester tester) async {
    tester.binding.window.physicalSizeTestValue = Size(720, 1080);
    // Build our app and trigger a frame.
    await tester.pumpWidget(GetMaterialApp(
      home: Scaffold(
        body: LineupLeague(
          lineUpRows: lineUpRows,
        ),
      ),
    ));
    expect(find.text('Hantera'), findsOneWidget);
    expect(find.text('Lux'), findsOneWidget);
    expect(find.text('SUP'), findsOneWidget);
    expect(find.text('seaz'), findsOneWidget);
    expect(find.text('Yami'), findsOneWidget);
  });
}