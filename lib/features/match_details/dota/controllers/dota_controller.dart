import 'package:dio/dio.dart';
import 'package:esports_crystal/features/match_details/dota/models/dota_game_details.dart';
import 'package:esports_crystal/features/match_details/dota/services/dota_api_helper.dart';
import 'package:esports_crystal/features/schedule/models/match_details.dart';
import 'package:get/get.dart';

class DotaMatchGamesContoller extends GetxController {
  final Dio _dio = Dio();

  /// Match Details Data
  var matchData = {}.obs;

  /// Stream Link Row
  var streamLink = 'https://www.twitch.tv'.obs;
  var isLoadingStreamLink = false.obs;
  updateMatchStreamLink() async {
    if (matchData['status'] == 'inprogress') {
      isLoadingStreamLink.value = true;
      streamLink.value = await DotaMatchAPIHelper(dio: _dio)
          .getMatchStreamLink(matchId: matchData['id']);
      isLoadingStreamLink.value = false;
    }
  }

  /// Match Games List Row + Teams Score Row
  var matchGamesList = <GameDetails>[].obs;
  var isLoadingMatchGamesList = false.obs;
  var selectedGameNumber = 0.obs;

  updateMatchGamesList() async {
    isLoadingMatchGamesList.value = true;
    matchGamesList.value = await DotaMatchAPIHelper(dio: _dio)
        .getMatchGames(matchId: matchData['id']);
    selectedGameNumber.value = matchGamesList.length - 1;
    isLoadingMatchGamesList.value = false;
  }

  updateSelectedGameNumber(int number) {
    selectedGameNumber.value = number;
    updatePlayerData();
    updateObjectivesData();
  }

  var gameScoreCardData = {}.obs;
  updateGameScoreCardData() {
    gameScoreCardData['homeTeamName'] = matchData['homeTeam'];
    gameScoreCardData['awayTeamName'] = matchData['awayTeam'];
    gameScoreCardData['homeTeamSide'] =
        matchGamesList[selectedGameNumber.value].homeTeamStartingSide == '3'
            ? 'blue'
            : 'red';
    gameScoreCardData['gameStatus'] =
        matchGamesList[selectedGameNumber.value].status;
    gameScoreCardData['homeTeamScore'] = objectivesDataMap['homeStats'].kills;
    gameScoreCardData['awayTeamScore'] = objectivesDataMap['awayStats'].kills;
  }

  /// Player Stats Block
  var playersData = {}.obs;
  var isLoadingPlayerData = false.obs;
  var lineUpRows = [].obs;
  updatePlayerData() async {
    isLoadingPlayerData.value = true;
    playersData = {}.obs;
    lineUpRows = [].obs;
    playersData.value = await DotaMatchAPIHelper(dio: _dio)
        .getPlayerStats(gameDetails: matchGamesList[selectedGameNumber.value]);
    var homePlayersData = playersData['homePlayers'];
    var awayPlayersData = playersData['awayPlayers'];
    num homeGold = 0;
    num awayGold = 0;
    for (var i = 0; i < homePlayersData.length; i++) {
      var homeK = homePlayersData[i].kills;
      var homeD = homePlayersData[i].deaths;
      var homeA = homePlayersData[i].assists;
      var homeLH = homePlayersData[i].lastHits;
      var homeDN = homePlayersData[i].denies;
      var awayK = awayPlayersData[i].kills;
      var awayD = awayPlayersData[i].deaths;
      var awayA = awayPlayersData[i].assists;
      var awayLH = awayPlayersData[i].lastHits;
      var awayDN = awayPlayersData[i].denies;
      lineUpRows.add({
        'homePlayerName': homePlayersData[i].name,
        'awayPlayerName': awayPlayersData[i].name,
        'homeChampionName': homePlayersData[i].character,
        'awayChampionName': awayPlayersData[i].character,
        'homeGM': homePlayersData[i].goldPerMin,
        'awayGM': awayPlayersData[i].goldPerMin,
        'homeXPM': homePlayersData[i].xpPerMin,
        'awayXPM': awayPlayersData[i].xpPerMin,
        'homeKDA': '$homeK/$homeD/$homeA',
        'awayKDA': '$awayK/$awayD/$awayA',
        'homeLHDN': '$homeLH/$homeDN',
        'awayLHDN': '$awayLH/$awayDN',
      });
      homeGold = homeGold + homePlayersData[i].netWorth;
      awayGold = awayGold + awayPlayersData[i].netWorth;
    }
    objectivesRowsData.add({
      'objective': 'Gold',
      'homeObjectiveData': homeGold,
      'redObjectiveData': awayGold,
    });
    isLoadingPlayerData.value = false;
  }

  /// Objectives Stats Block
  var objectivesDataMap = {}.obs;
  var isLoadingObjectivesData = false.obs;
  var objectivesRowsData = [].obs;
  updateObjectivesData() async {
    isLoadingObjectivesData.value = true;
    objectivesDataMap = {}.obs;
    objectivesRowsData = [].obs;
    objectivesDataMap.value = await DotaMatchAPIHelper(dio: _dio)
        .getGameStats(gameDetails: matchGamesList[selectedGameNumber.value]);
    objectivesDataMap['homeStats'].toMap().forEach((key, value) {
      objectivesRowsData.add({
        'objective': key,
        'homeObjectiveData': value,
        'redObjectiveData': objectivesDataMap['awayStats'].toMap()[key],
      });
    });
    updateGameScoreCardData();
    isLoadingObjectivesData.value = false;
  }

  resetEverything() {
    /// Match Details Data
    matchData = {}.obs;

    /// Stream Link Row
    streamLink = 'https://www.twitch.tv'.obs;
    isLoadingStreamLink = false.obs;

    /// Match Games List Row
    matchGamesList = <GameDetails>[].obs;
    isLoadingMatchGamesList = false.obs;
    selectedGameNumber = 0.obs;

    /// Player Stats Block
    playersData = {}.obs;
    isLoadingPlayerData = false.obs;
    lineUpRows = [].obs;

    /// Objectives Stats Block
    objectivesDataMap = {}.obs;
    isLoadingObjectivesData = false.obs;
    objectivesRowsData = [].obs;

    /// Game Score Card Data
    gameScoreCardData.value = {};
  }

  /// Update Everything
  updateEveryThing(MatchDetails matchDetails) async {
    resetEverything();
    matchData.value = matchDetails.toMap();
    updateMatchStreamLink();
    await updateMatchGamesList();
    if(matchGamesList.isNotEmpty) {
      updatePlayerData();
      updateObjectivesData();
    }
  }
}
