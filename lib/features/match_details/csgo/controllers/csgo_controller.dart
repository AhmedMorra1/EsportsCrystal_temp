import 'package:dio/dio.dart';
import 'package:esports_crystal/configs/consts.dart';
import 'package:esports_crystal/features/match_details/csgo/models/csgo_game_details.dart';
import 'package:esports_crystal/features/match_details/csgo/services/csgo_api_helper.dart';
import 'package:esports_crystal/features/schedule/models/match_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CSGOMatchGamesContoller extends GetxController {
  final Dio _dio = Dio();

  /// Match Details Data
  var matchData = {}.obs;

  /// Stream Link Row
  var streamLink = 'https://www.twitch.tv'.obs;
  var isLoadingStreamLink = false.obs;
  updateMatchStreamLink() async {
    if (matchData['status'] == 'inprogress') {
      isLoadingStreamLink.value = true;
      streamLink.value = await CSGOMatchAPIHelper(dio: _dio)
          .getMatchStreamLink(matchId: matchData['id']);
      isLoadingStreamLink.value = false;
    }
  }

  /// Match Games List Row + Teams Score Row
  var matchGamesList = <CSGOGameDetails>[].obs;
  var isLoadingMatchGamesList = false.obs;
  var selectedGameNumber = 0.obs;

  updateMatchGamesList() async {
    isLoadingMatchGamesList.value = true;
    matchGamesList.value = await CSGOMatchAPIHelper(dio: _dio)
        .getMatchGames(matchId: matchData['id']);
    selectedGameNumber.value = matchGamesList.length - 1;
    isLoadingMatchGamesList.value = false;
  }

  updateSelectedGameNumber(int number) {
    selectedGameNumber.value = number;
    setMapCardData();
    setUpRoundsData();
    setPlayersDate();
  }


  /// Reset Everything in the controller ot default values (Tested)
  resetEverything() {
    /// Match Details Data
    matchData = {}.obs;

    /// Stream Link Row
    streamLink = 'https://www.twitch.tv'.obs;
    isLoadingStreamLink = false.obs;

    /// Match Games List Row
    matchGamesList = <CSGOGameDetails>[].obs;
    isLoadingMatchGamesList = false.obs;
    selectedGameNumber = 0.obs;


    /// mapGameCardData
    gameScoreCardData = {}.obs;
    isLoadingMapCardData = false.obs;

    roundsData = {'normalTimeRounds':[],'overTimeRounds':[]}.obs;
    isLoadingRoundData = false.obs;

    isLoadingPlayerData.value = true;
    lineUpRows = [].obs;
  }

  /// Update Everything (Tested)
  updateEveryThing(MatchDetails matchDetails) async {
    resetEverything();
    matchData.value = matchDetails.toMap();
    updateMatchStreamLink();
    await updateMatchGamesList();
    if(matchGamesList.isNotEmpty) {
      setMapCardData();
      setUpRoundsData();
      setPlayersDate();
    }
  }


  /// Map Card data
  var isLoadingMapCardData = false.obs;
  var gameScoreCardData = {}.obs;
  void setMapCardData(){
    var mapCardData = [];
    gameScoreCardData.value = {};
    isLoadingMapCardData.value = true;
    var homeScore = matchGamesList
        [selectedGameNumber.value].homeScore;
    var awayScore = matchGamesList
        [selectedGameNumber.value].awayScore;
    var homeStartingSide = matchGamesList
        [selectedGameNumber.value]
        .homeTeamStartingSide == 5 ? 'blue' : 'red';
    var mapName = matchGamesList
        [selectedGameNumber.value].map;

    if(homeScore != '-'){
      homeScore.forEach((k, v) {
              if (k != 'display') {
                mapCardData.add({
                  'away': awayScore[k],
                  'home' : v,
                  'statName': k,
                });
              }
      });
    }else{
      mapCardData.add({
        'leftScore': '-',
        'statName' : '-',
        'rightScore': '-',
      });
    }

    var gameScoreDataMap = {
      'homeTeamScore': homeScore != '-' ? (homeScore.isNotEmpty ? homeScore['display'] : '-') : '-',
      'awayTeamName': matchData['awayTeam'],
      'mapName': mapName,
      'awayTeamScore': homeScore != '-' ? (homeScore.isNotEmpty ? awayScore['display'] : '-') : '-',
      'homeTeamName': matchData['homeTeam'],
      'periodsScoresList': mapCardData,
      'homeTeamSide': homeStartingSide ,
    };
    gameScoreCardData.value=gameScoreDataMap;
    isLoadingMapCardData.value = false;
  }


  var roundsData = {'normalTimeRounds':[],'overTimeRounds':[]}.obs;
  var isLoadingRoundData = false.obs;
  void setUpRoundsData()async{
    isLoadingRoundData.value = true;
    roundsData = {'normalTimeRounds':[],'overTimeRounds':[]}.obs;
    var roundDataMap = await CSGOMatchAPIHelper(dio: _dio).getRounds(gameId: matchGamesList[selectedGameNumber.value].id!.toString());
    var normalTimeRoundsData = roundDataMap['normalTimeRounds'] as List ;
    var overTimeRoundsData = roundDataMap['overTimeRounds'] != null ? roundDataMap['overTimeRounds'] as List : [];
    for (var i = 0; i <normalTimeRoundsData.length;i++){
      var winnerCode = normalTimeRoundsData[i].winnerCode;
      var homeTeamSide = normalTimeRoundsData[i].homeTeamSide;
      var outcome = normalTimeRoundsData[i].outcome;
      var homeColor = winnerCode == '1' ? (homeTeamSide == '5'? kCounterTerroristsColor : kTerroristsColor) : Colors.transparent;
      var awayColor = winnerCode != '1' ? (homeTeamSide != '5'? kCounterTerroristsColor : kTerroristsColor) : Colors.transparent;
      var homeOutcome = winnerCode == '1' ? kOutcomes[outcome] : '';
      var awayOutcome = winnerCode != '1' ? kOutcomes[outcome] : '';
      var homeOutcomeIcon = winnerCode == '1' ? kOutcomesIcons[outcome] : null;
      var awayOutcomeIcon = winnerCode != '1' ? kOutcomesIcons[outcome] : null;
      roundsData['normalTimeRounds']!.add({
       'homeColor' : homeColor,
       'awayColor' :awayColor,
       'homeOutcome' :homeOutcome,
       'awayOutcome' :awayOutcome,
       'homeOutcomeIcon' :homeOutcomeIcon,
       'awayOutcomeIcon' :awayOutcomeIcon,
       'roundNumber' :i+1,
      });

    }

    if (overTimeRoundsData.isNotEmpty){
      for (var i = 0; i <overTimeRoundsData.length;i++){
        var winnerCode = overTimeRoundsData[i].winnerCode;
        var homeTeamSide = overTimeRoundsData[i].homeTeamSide;
        var outcome = overTimeRoundsData[i].outcome;
        var homeColor = winnerCode == '1' ? (homeTeamSide == '5'? kCounterTerroristsColor : kTerroristsColor) : Colors.transparent;
        var awayColor = winnerCode != '1' ? (homeTeamSide != '5'? kCounterTerroristsColor : kTerroristsColor) : Colors.transparent;
        var homeOutcome = winnerCode == '1' ? kOutcomes[outcome] : '';
        var awayOutcome = winnerCode != '1' ? kOutcomes[outcome] : '';
        var homeOutcomeIcon = winnerCode == '1' ? kOutcomesIcons[outcome] : '';
        var awayOutcomeIcon = winnerCode != '1' ? kOutcomesIcons[outcome] : '';
        roundsData['overTimeRounds']!.add({
          'homeColor' : homeColor,
          'awayColor' :awayColor,
          'homeOutcome' :homeOutcome,
          'awayOutcome' :awayOutcome,
          'homeIcon' :homeOutcomeIcon,
          'awayIcon' :awayOutcomeIcon,
          'roundNumber' :i+1,
        });
      }
    }
    isLoadingRoundData.value = false;
  }

  var isLoadingPlayerData = false.obs;
  var lineUpRows = [].obs;
  void setPlayersDate() async {
    isLoadingPlayerData.value = true;
    lineUpRows = [].obs;
    var playerData = await CSGOMatchAPIHelper(dio: _dio).getLineups(gameId: matchGamesList[selectedGameNumber.value].id!.toString());
    var homeTeamPlayers = playerData['homeTeamPlayers'];
    var awayTeamPlayers = playerData['awayTeamPlayers'];
    for (var i=0;i<homeTeamPlayers.length;i++){
      lineUpRows.add({
        'homePlayerName': homeTeamPlayers[i]['player']['name'],
        'awayPlayerName': awayTeamPlayers[i]['player']['name'],
        'homeKDA': '${homeTeamPlayers[i]['kills']}/${homeTeamPlayers[i]['deaths']}/${homeTeamPlayers[i]['assists']}',
        'homeKD': homeTeamPlayers[i]['kdDiff'],
        'homeADR': homeTeamPlayers[i]['adr'],
        'awayKDA': '${awayTeamPlayers[i]['kills']}/${awayTeamPlayers[i]['deaths']}/${awayTeamPlayers[i]['assists']}',
        'awayKD': awayTeamPlayers[i]['kdDiff'],
        'awayADR': awayTeamPlayers[i]['adr'],
      });
    }
    isLoadingPlayerData.value = false;
  }
}
