import 'package:dio/dio.dart';
import 'package:esports_crystal/features/match_details/dota/models/dota_game_details.dart';
import 'package:esports_crystal/features/match_details/dota/models/dota_player_stats.dart';
import 'package:esports_crystal/features/match_details/dota/models/dota_team_stats.dart';

class DotaMatchAPIHelper{
  DotaMatchAPIHelper({required this.dio});
  final Dio dio;

  /// get Match Stream Link
  Future<String> getMatchStreamLink(
      {required String matchId}) async {
    const url = 'https://secret.p.rapidapi.com/matches/get-media';

    final querystring = {"matchId": matchId};

    final headers = {
      'x-rapidapi-host': 'secret.p.rapidapi.com',
      'x-rapidapi-key': 'secret'
    };

    Response response;
    response = await dio.get<dynamic>(url,
        options: Options(
          headers: headers,
        ),
        queryParameters: querystring);

    final returnedData = response.data as Map;

    print(returnedData);
    if (returnedData['media'] != null) {
    return returnedData['media'][0]['url'];
    } else {
      return 'https://www.twitch.tv';
    }
  }

  /// get match games
  Future<List<GameDetails>> getMatchGames(
      {required String matchId}) async {
    try {
      const url = 'https://secret.p.rapidapi.com/matches/get-esport-games';

      final querystring = {"matchId": matchId};

      final headers = {
        'x-rapidapi-host': 'secret.p.rapidapi.com',
        'x-rapidapi-key': 'secret'
      };

      Response response;
      response = await dio.get<dynamic>(url,
          options: Options(
            headers: headers,
          ),
          queryParameters: querystring);
      final returnedData = response.data as Map;
      final returnedGames = returnedData['games'] as List;

      final matchGames = <GameDetails>[];
      for (var i = 0; i < returnedGames.length; i++) {
        var game = GameDetails.fromMap({
          'status': returnedGames[i]['status']['type'].toString(),
          'id': returnedGames[i]['id'].toString(),
          'startTimestamp': returnedGames[i]['startTimestamp'].toString(),
          'homeTeamStartingSide': returnedGames[i]['homeTeamStartingSide'].toString(),
          'hasCompleteStatistics': returnedGames[i]['hasCompleteStatistics'].toString(),
        });
        matchGames.add(game);
      }
      return matchGames;
    }catch (e){
      return <GameDetails>[];
    }
  }

  /// get line ups
  Future<Map> getPlayerStats({required GameDetails gameDetails}) async {
    const url = 'https://secret.p.rapidapi.com/esport-games/get-lineups';

    final querystring = {'gameId': gameDetails.id};

    const headers = {
      'x-rapidapi-host': "secret.p.rapidapi.com",
      'x-rapidapi-key': "secret"
    };

    Response response;
    response = await dio.get<dynamic>(url,
        options: Options(
          headers: headers,
        ),
        queryParameters: querystring);
    final returnedData = response.data as Map;

    var homePlayers = returnedData['homeTeamPlayers'] as List;
    var awayPlayers = returnedData['awayTeamPlayers'] as List;
    var homePlayersData = [];
    var awayPlayersData = [];

    for (var i=0;i<homePlayers.length;i++){
      homePlayersData.add(
        PlayerDetails.fromMap({
          'character':homePlayers[i]['character']['name'] ?? '-',
          'name':homePlayers[i]['player']['name'] ?? '-',
          'kills':homePlayers[i]['kills'] ?? 0,
          'assists':homePlayers[i]['assists'] ?? 0,
          'deaths':homePlayers[i]['deaths'] ?? 0,
          'goldPerMin':homePlayers[i]['goldPerMin'] ?? 0,
          'heroLevel':homePlayers[i]['heroLevel'] ?? 0,
          'lastHits':homePlayers[i]['lastHits'] ?? 0,
          'netWorth':homePlayers[i]['netWorth'] ?? 0,
          'xpPerMin':homePlayers[i]['xpPerMin'] ?? 0,
          'denies':homePlayers[i]['denies'] ?? 0,
        })
      );
      awayPlayersData.add(
          PlayerDetails.fromMap({
            'character':awayPlayers[i]['character']['name'] ?? '-',
            'name':awayPlayers[i]['player']['name'] ?? '-',
            'kills':awayPlayers[i]['kills'] ?? 0,
            'assists':awayPlayers[i]['assists'] ?? 0,
            'deaths':awayPlayers[i]['deaths'] ?? 0,
            'goldPerMin':awayPlayers[i]['goldPerMin'] ?? 0,
            'heroLevel':awayPlayers[i]['heroLevel'] ?? 0,
            'lastHits':awayPlayers[i]['lastHits'] ?? 0,
            'netWorth':awayPlayers[i]['netWorth'] ?? 0,
            'xpPerMin':awayPlayers[i]['xpPerMin'] ?? 0,
            'denies':awayPlayers[i]['denies'] ?? 0,
          })
      );
    }

    return <String, List?>{
      'homePlayers': homePlayersData,
      'awayPlayers': awayPlayersData,
    };
  }


  /// get game stats
  Future<Map> getGameStats({required GameDetails gameDetails}) async {
    const url = 'https://secret.p.rapidapi.com/esport-games/get-statistics';

    final querystring = {'gameId': gameDetails.id};

    final headers = {
      'x-rapidapi-host': "secret.p.rapidapi.com",
      'x-rapidapi-key': "secret"
    };

    Response response;
    response = await dio.get<dynamic>(url,
        options: Options(
          headers: headers,
        ),
        queryParameters: querystring);

    final returnedData = response.data as Map;


    var homeStats = TeamStats.fromMap(<String, dynamic>{
      'Kills': returnedData['homeStatistics']!=null?returnedData['homeStatistics']['kills']:0,
      'Towers': returnedData['awayStatistics']!=null?returnedData['awayStatistics']['towersDestroyed']:0,
      'Barracks': returnedData['awayStatistics']!=null?returnedData['awayStatistics']['barracksDestroyed']:0,
    });

    var awayStats = TeamStats.fromMap(<String, dynamic>{
      'Kills': returnedData['awayStatistics']!=null?returnedData['awayStatistics']['kills']:0,
      'Towers': returnedData['homeStatistics']!=null?returnedData['homeStatistics']['towersDestroyed']:0,
      'Barracks': returnedData['homeStatistics']!=null?returnedData['homeStatistics']['barracksDestroyed']:0,
    });

    return <String, dynamic>{
      'homeStats': homeStats,
      'awayStats': awayStats,
    };
  }
}