import 'package:esports_crystal/helper_widgets/widgets/lineup.dart';
import 'package:esports_crystal/helper_widgets/widgets/match_game_team_objectives.dart';
import 'package:flutter/material.dart';
import 'package:esports_crystal/helper_widgets/widgets/stream_link_row.dart';
import 'package:esports_crystal/helper_widgets/widgets/match_game_teams_card.dart';
import 'package:esports_crystal/helper_widgets/widgets/match_games_row.dart';
import 'package:esports_crystal/helper_widgets/widgets/game_score_card.dart';
import 'package:esports_crystal/helper_widgets/breather.dart';

class TestPage extends StatelessWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              StreamLinkRow(),
              Breather(h: 1,),
              StreamLinkRowShimmer(),
              Breather(h: 1,),
              LeagueGameTeamsCard(
                homeTeamName: 'G2 Esports',
                awayTeamName: 'Damwon Gaming Good Team',
                homeTeamScore: '3',
                awayTeamScore: '2',
                winnerTeam: 'homeTeam',
              ),
              Breather(h: 1,),
              LeagueGameTeamsCardShimmer(),
              Breather(h: 1,),
              GamesListRow(
                gamesList: ['1', '2', '3'],
                selectedGameIndex: 0,
              ),
              Breather(h: 1,),
              GamesListShimmerRow(),
              Breather(h: 1,),
              GameScoreCard(
                  homeTeamName: 'G2 Esports',
                  awayTeamName: 'Damwon Gaming Good Team',
                  homeTeamScore: '18',
                  awayTeamScore: '10',
                  homeTeamSide: 'blue'),
              Breather(h: 1,),
              GameScoreCardShimmer(),
              Breather(h: 1,),
              GameScoreCardCSGO(
                homeTeamName: 'G2 Esports',
                awayTeamName: 'Damwon Gaming Good Team',
                homeTeamScore: '16',
                awayTeamScore: '14',
                homeTeamSide: 'blue',
                mapName: 'Inferno',
                periodsScoresList: [
                  {'home': '10', 'statName': 'Half 1', 'away': '5'},
                  {'home': '6', 'statName': 'Half 2', 'away': '9'},
                ],
              ),
              Breather(h: 1,),
              LineupLeague(lineUpRows: lineUpRows,),
              Breather(h: 1),
              LineupLeagueShimmer(),
              Breather(h: 1,),
              LineupCSGO(lineUpRows: lineUpRowsCSGO),
              Breather(h: 1,),
              GameTeamObjectives(objectivesRowsData: objectivesRowsData,),
              Breather(h: 1,),
              GameTeamObjectivesShimmer(),
              Breather(h: 1,),

            ],
          ),
        ),
      ),
    );
  }
}



List lineUpRows = [
  {
    'homePlayerName':'Cabochard',
    'homeChampionName':'Kennen',
    'homeStats':'4/1/2 123 CS 6.1K',
    'lane':'TOP',
    'awayPlayerName':'SLT',
    'awayChampionName':'Graves',
    'awayStats':'0/4/1 153 CS 5.5K',
  },
  {
    'homePlayerName':'113',
    'homeChampionName':'Lee Sin',
    'homeStats':'4/1/2 123 CS 6.1K',
    'lane':'JNG',
    'awayPlayerName':'Koldo',
    'awayChampionName':'Xin Zhao',
    'awayStats':'0/4/1 153 CS 5.5K',
  },
  {
    'homePlayerName':'Saken',
    'homeChampionName':'Yassou',
    'homeStats':'4/1/2 123 CS 6.1K',
    'lane':'MID',
    'awayPlayerName':'Hatrixx',
    'awayChampionName':'Orianna',
    'awayStats':'0/4/1 153 CS 5.5K',
  },
  {
    'homePlayerName':'Rekkless',
    'homeChampionName':'Caitlyn',
    'homeStats':'4/1/2 123 CS 6.1K',
    'lane':'ADC',
    'awayPlayerName':'Rafitta',
    'awayChampionName':'Miss Fortune',
    'awayStats':'0/4/1 153 CS 5.5K',
  },
  {
    'homePlayerName':'Hantera',
    'homeChampionName':'Lux',
    'homeStats':'4/1/2 123 CS 6.1K',
    'lane':'SUP',
    'awayPlayerName':'seaz',
    'awayChampionName':'Yami',
    'awayStats':'0/4/1 153 CS 5.5K',
  },
];


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

List objectivesRowsData = [
  {
    'objective':'Gold',
    'blueObjectiveData':'32000',
    'redObjectiveData':'28000',
  },
  {
    'objective':'Kill',
    'blueObjectiveData':'9',
    'redObjectiveData':'4',
  },
  {
    'objective':'Tower',
    'blueObjectiveData':'3',
    'redObjectiveData':'1',
  },
  {
    'objective':'Dragons',
    'blueObjectiveData':'1',
    'redObjectiveData':'1',
  },
  {
    'objective':'Elder',
    'blueObjectiveData':'0',
    'redObjectiveData':'0',
  },
  {
    'objective':'Baron',
    'blueObjectiveData':'1',
    'redObjectiveData':'0',
  },
  {
    'objective':'Inhibitor',
    'blueObjectiveData':'0',
    'redObjectiveData':'0',
  },
];