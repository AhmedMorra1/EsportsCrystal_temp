import 'package:dio/dio.dart';
import 'package:esports_crystal/features/match_details/league/models/league_game_details.dart';
import 'package:esports_crystal/features/match_details/league/services/league_matches_api_helper.dart';
import 'package:esports_crystal/features/schedule/models/match_details.dart';
import 'package:get/get.dart';

class LeagueMatchGamesContoller extends GetxController {
  final Dio _dio = Dio();

  /// Match Details Data
  var matchData = {}.obs;

  /// Stream Link Row
  var streamLink = 'https://www.twitch.tv'.obs;
  var isLoadingStreamLink = false.obs;
  updateMatchStreamLink() async {
    if (matchData['status'] == 'inprogress') {
      isLoadingStreamLink.value = true;
      streamLink.value = await LeagueMatchAPIHelper(dio: _dio).getMatchStreamLink(matchId: matchData['id']);
      isLoadingStreamLink.value = false;
    }
  }

  /// Match Games List Row + Teams Score Row
  var matchGamesList = <GameDetails>[].obs;
  var isLoadingMatchGamesList = false.obs;
  var selectedGameNumber = 0.obs;

  updateMatchGamesList() async {
    isLoadingMatchGamesList.value = true;
    matchGamesList.value = await LeagueMatchAPIHelper(dio: _dio).getMatchGames(matchId: matchData['id']);
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
    gameScoreCardData['homeTeamSide'] = matchGamesList[selectedGameNumber.value].homeTeamStartingSide == '1' ? 'blue' : 'red';
    gameScoreCardData['gameStatus'] = matchGamesList[selectedGameNumber.value].status;
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
    playersData.value = await LeagueMatchAPIHelper(dio: _dio).getPlayerStats(gameDetails: matchGamesList[selectedGameNumber.value]);
    playersData['homePlayers'].forEach((key, value) {
      // print('KEY is $key : ${playersData['awayPlayers'][key].toMap()}');
      var hK = playersData['homePlayers'][key] != null
          ? (playersData['homePlayers'][key].kills == -1 ? ' ' : playersData['homePlayers'][key].kills.toString())
          : ' ';
      var hD = playersData['homePlayers'][key] != null
          ? (playersData['homePlayers'][key].deaths == -1 ? ' ' : playersData['homePlayers'][key].deaths.toString())
          : ' ';
      var hA = playersData['homePlayers'][key] != null
          ? (playersData['homePlayers'][key].assists == -1 ? ' ' : playersData['homePlayers'][key].assists.toString())
          : ' ';
      var hCS = playersData['homePlayers'][key] != null
          ? (playersData['homePlayers'][key].minions == -1 ? '' : playersData['homePlayers'][key].minions.toString() + 'cs')
          : '';
      var hG = playersData['homePlayers'][key] != null
          ? (playersData['homePlayers'][key].gold == -1 ? '' : (playersData['homePlayers'][key].gold / 1000).toStringAsFixed(1) + 'k')
          : '';
      var aK = playersData['awayPlayers'][key] != null
          ? (playersData['awayPlayers'][key].kills == -1 ? ' ' : playersData['awayPlayers'][key].kills.toString())
          : ' ';
      var aD = playersData['awayPlayers'][key] != null
          ? (playersData['awayPlayers'][key].deaths == -1 ? ' ' : playersData['awayPlayers'][key].deaths.toString())
          : ' ';
      var aA = playersData['awayPlayers'][key] != null
          ? (playersData['awayPlayers'][key].assists == -1 ? ' ' : playersData['awayPlayers'][key].assists.toString())
          : ' ';
      var aCS = playersData['awayPlayers'][key] != null
          ? (playersData['awayPlayers'][key].minions == -1 ? '' : playersData['awayPlayers'][key].minions.toString() + 'cs')
          : '';
      var aG = playersData['awayPlayers'][key] != null
          ? (playersData['awayPlayers'][key].gold == -1 ? '' : (playersData['awayPlayers'][key].gold / 1000).toStringAsFixed(1) + 'k')
          : '';

      lineUpRows.add({
        'homePlayerName': playersData['homePlayers'][key] != null ? playersData['homePlayers'][key].name : '-',
        'homeChampionName': playersData['homePlayers'][key] != null ? playersData['homePlayers'][key].character : '-',
        'homeStats': '$hK/$hD/$hA $hCS $hG',
        'lane': key,
        'awayPlayerName': playersData['awayPlayers'][key] != null ? playersData['awayPlayers'][key].name : '-',
        'awayChampionName': playersData['awayPlayers'][key] != null ? playersData['awayPlayers'][key].character : '-',
        'awayStats': '$aK/$aD/$aA $aCS $aG',
      });
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
    objectivesDataMap.value = await LeagueMatchAPIHelper(dio: _dio).getGameStats(gameDetails: matchGamesList[selectedGameNumber.value]);
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
