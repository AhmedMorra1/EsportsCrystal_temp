import 'package:dio/dio.dart';
import 'package:esports_crystal/features/match_details/csgo/models/csgo_game_details.dart';
import 'package:esports_crystal/features/match_details/csgo/models/csgo_round.dart';
import 'package:esports_crystal/features/match_details/dota/models/dota_game_details.dart';

class CSGOMatchAPIHelper{
  CSGOMatchAPIHelper({required this.dio});
  final Dio dio;

  /// get Match Stream Link (Tested)
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

    if (returnedData['media'] != null) {
    return returnedData['media'][0]['url'];
    } else {
      return 'https://www.twitch.tv';
    }
  }

  /// get match games (Tested)
  Future<List<CSGOGameDetails>> getMatchGames(
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

      final matchGames = <CSGOGameDetails>[];
      for (var i = 0; i < returnedGames.length; i++) {
        var game = CSGOGameDetails.fromMap({
          'length': returnedGames[i]['length'] ?? '-',
          'status': returnedGames[i]['status']['type'] ?? '-',
          'winnerCode': returnedGames[i]['winnerCode'] ?? '-',
          'map': returnedGames[i]['map'] != null ? (returnedGames[i]['map']['name'] ?? '-') : '-',
          'homeScore': returnedGames[i]['homeScore'] ?? '-',
          'awayScore': returnedGames[i]['awayScore'] ?? '-',
          'homeTeamStartingSide': returnedGames[i]['homeTeamStartingSide'] ?? '-',
          'hasCompleteStatistics': returnedGames[i]['hasCompleteStatistics'] ?? '-',
          'id': returnedGames[i]['id'] ?? '-',
          'startTimestamp': returnedGames[i]['startTimestamp'] ?? '-',
        });
        matchGames.add(game);
        //print(game.toMap());
      }

      return matchGames;
    }
    catch (e){
      return <CSGOGameDetails>[];
    }
  }

  /// get match games (Tested)
  Future<Map> getRounds(
      {required String gameId}) async {
    const url = 'https://secret.p.rapidapi.com/esport-games/get-rounds';

    final querystring = {"gameId": gameId};

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
    final normalTimeRoundsData = returnedData['normaltimeRounds'] as List;
    final overTimeRoundsData = returnedData['overtimeRounds'] != null ? returnedData['overtimeRounds'] as List : [];

    final normalTimeRounds = <CSGORound>[];
    final overTimeRounds = <CSGORound>[];
    for (var i = 0; i < normalTimeRoundsData.length; i++) {
      var round = CSGORound.fromMap({
        'number':i+1,
        'outcome': normalTimeRoundsData[i]['outcome'].toString(),
        'winnerCode': normalTimeRoundsData[i]['winnerCode'].toString(),
        'homeTeamSide': normalTimeRoundsData[i]['homeTeamSide'].toString(),
      });
      normalTimeRounds.add(round);
    }
    if (overTimeRoundsData.isNotEmpty) {
      for (var i = 0; i < overTimeRoundsData.length; i++) {
        var round = CSGORound.fromMap({
          'number':i+1,
          'outcome': overTimeRoundsData[i]['outcome'].toString(),
          'winnerCode': overTimeRoundsData[i]['winnerCode'].toString(),
          'homeTeamSide': overTimeRoundsData[i]['homeTeamSide'].toString(),
        });
        overTimeRounds.add(round);
      }
    }

    return {
      'normalTimeRounds':normalTimeRounds,
      'overTimeRounds':overTimeRounds,
    };

  }

  /// get lineups (Tested)
  Future<Map> getLineups(
      {required String gameId}) async {
    const url = 'https://secret.p.rapidapi.com/esport-games/get-lineups';

    final querystring = {"gameId": gameId};

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
    final homeTeamPlayers = returnedData['homeTeamPlayers'] != null ? returnedData['homeTeamPlayers'] as List : [];
    final awayTeamPlayers = returnedData['awayTeamPlayers'] != null ? returnedData['awayTeamPlayers'] as List : [];

    return {
      'homeTeamPlayers':homeTeamPlayers,
      'awayTeamPlayers':awayTeamPlayers,
    };

  }
}