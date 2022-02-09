import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:esports_crystal/features/match_details/csgo/views/lineup.dart';
void main(){
  testWidgets('Game Score Card', (WidgetTester tester) async {
    tester.binding.window.physicalSizeTestValue = const Size(720, 1180);
    List lineUpRowsCSGO = [
      {
        'homePlayerName':'Cabochard',
        'awayPlayerName':'SLT',
        'homeKDA':'4/1/2',
        'homeKD':'3',
        'homeADR':'63',
        'awayKDA':'0/4/1',
        'awayKD':'-4',
        'awayADR':'45',
      },
      {
        'homePlayerName':'Cabochard',
        'awayPlayerName':'SLT',
        'homeKDA':'4/1/2',
        'homeKD':'3',
        'homeADR':'63',
        'awayKDA':'0/4/1',
        'awayKD':'-4',
        'awayADR':'45',
      },
      {
        'homePlayerName':'Cabochard',
        'awayPlayerName':'SLT',
        'homeKDA':'4/1/2',
        'homeKD':'3',
        'homeADR':'63',
        'awayKDA':'0/4/1',
        'awayKD':'-4',
        'awayADR':'45',
      },
      {
        'homePlayerName':'Cabochard',
        'awayPlayerName':'SLT',
        'homeKDA':'4/1/2',
        'homeKD':'3',
        'homeADR':'63',
        'awayKDA':'0/4/1',
        'awayKD':'-4',
        'awayADR':'45',
      },
      {
        'homePlayerName':'Cabochard',
        'awayPlayerName':'SLT',
        'homeKDA':'4/1/2',
        'homeKD':'3',
        'homeADR':'63',
        'awayKDA':'0/4/1',
        'awayKD':'-4',
        'awayADR':'45',
      },
    ];
    await tester.pumpWidget(GetMaterialApp(
      home: Scaffold(
        body: LineupCSGO(lineUpRows: lineUpRowsCSGO,),
      ),
    ));
    expect(find.text('Cabochard'), findsWidgets);
    expect(find.text('0/4/1'), findsWidgets);
    expect(find.text('SLT'), findsWidgets);
    expect(find.text('63'), findsWidgets);
  });
}