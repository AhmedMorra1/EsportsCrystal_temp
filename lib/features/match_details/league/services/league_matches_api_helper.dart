import 'package:dio/dio.dart';
import 'package:esports_crystal/features/match_details/league/models/league_game_details.dart';
import 'package:esports_crystal/features/match_details/league/models/league_player_stats.dart';
import 'package:esports_crystal/features/match_details/league/models/league_team_stats.dart';

class LeagueMatchAPIHelper {
  LeagueMatchAPIHelper({required this.dio});
  final Dio dio;

  /// get Match Stream Link (TESTED)
  Future<String> getMatchStreamLink({required String matchId}) async {
    const url = 'https://secret.p.rapidapi.com/matches/get-media';

    final querystring = {"matchId": matchId};

    final headers = {
      'x-rapidapi-host': 'secret.p.rapidapi.com',
      'x-rapidapi-key': 'secret',
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

  /// get match games (TESTED)
  Future<List<GameDetails>> getMatchGames({required String matchId}) async {
    try {
      const url = 'https://secret.p.rapidapi.com/matches/get-esport-games';

      final querystring = {"matchId": matchId};

      final headers = {
        'x-rapidapi-host': 'secret.p.rapidapi.com',
        'x-rapidapi-key': 'secret',
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
    } catch (e) {
      return <GameDetails>[];
    }
  }

  Future<Map> getPlayerStats({required GameDetails gameDetails}) async {
    const url = 'https://secret.p.rapidapi.com/esport-games/get-lineups';

    final querystring = {'gameId': gameDetails.id};

    const headers = {
      'x-rapidapi-host': "secret.p.rapidapi.com",
      'x-rapidapi-key': "secret",
    };

    Response response;
    response = await dio.get<dynamic>(url,
        options: Options(
          headers: headers,
        ),
        queryParameters: querystring);
    //print(response.data.toString());
    final returnedData = response.data as Map;
    PlayerDetails? homeTop;
    PlayerDetails? homeJungle;
    PlayerDetails? homeMid;
    PlayerDetails? homeADC;
    PlayerDetails? homeSupport;
    PlayerDetails? awayTop;
    PlayerDetails? awayJungle;
    PlayerDetails? awayMid;
    PlayerDetails? awayADC;
    PlayerDetails? awaySupport;

    var homePlayers = returnedData['homeTeamPlayers']
        as List; //gameDetails.homeTeamStartingSide == '1' ? returnedData['homeTeamPlayers'] as List : returnedData['awayTeamPlayers'] as List;
    var awayPlayers = returnedData['awayTeamPlayers']
        as List; //gameDetails.homeTeamStartingSide == '1' ? returnedData['awayTeamPlayers'] as List : returnedData['homeTeamPlayers'] as List;

    for (var i = 0; i < homePlayers.length; i++) {
      switch (homePlayers[i]['role']) {
        case 'top':
          homeTop = PlayerDetails.fromMap({
            'character': homePlayers[i]['character']['name'].toString(),
            'role': homePlayers[i]['role'].toString(),
            'name': homePlayers[i]['player']['name'].toString(),
            'assists': homePlayers[i]['assists'] ?? -1,
            'deaths': homePlayers[i]['deaths'] ?? -1,
            'kills': homePlayers[i]['kills'] ?? -1,
            'level': homePlayers[i]['level'] ?? -1,
            'minions': homePlayers[i]['minionsKilled'] ?? -1,
            'gold': homePlayers[i]['goldEarned'] ?? -1,
          });

          break;
        case 'jun':
          homeJungle = PlayerDetails.fromMap({
            'character': homePlayers[i]['character']['name'].toString(),
            'role': homePlayers[i]['role'].toString(),
            'name': homePlayers[i]['player']['name'].toString(),
            'assists': homePlayers[i]['assists'] ?? -1,
            'deaths': homePlayers[i]['deaths'] ?? -1,
            'kills': homePlayers[i]['kills'] ?? -1,
            'level': homePlayers[i]['level'] ?? -1,
            'minions': homePlayers[i]['minionsKilled'] ?? -1,
            'gold': homePlayers[i]['goldEarned'] ?? -1,
          });
          break;
        case 'mid':
          homeMid = PlayerDetails.fromMap({
            'character': homePlayers[i]['character']['name'].toString(),
            'role': homePlayers[i]['role'].toString(),
            'name': homePlayers[i]['player']['name'].toString(),
            'assists': homePlayers[i]['assists'] ?? -1,
            'deaths': homePlayers[i]['deaths'] ?? -1,
            'kills': homePlayers[i]['kills'] ?? -1,
            'level': homePlayers[i]['level'] ?? -1,
            'minions': homePlayers[i]['minionsKilled'] ?? -1,
            'gold': homePlayers[i]['goldEarned'] ?? -1,
          });
          break;
        case 'adc':
          homeADC = PlayerDetails.fromMap({
            'character': homePlayers[i]['character']['name'].toString(),
            'role': homePlayers[i]['role'].toString(),
            'name': homePlayers[i]['player']['name'].toString(),
            'assists': homePlayers[i]['assists'] ?? -1,
            'deaths': homePlayers[i]['deaths'] ?? -1,
            'kills': homePlayers[i]['kills'] ?? -1,
            'level': homePlayers[i]['level'] ?? -1,
            'minions': homePlayers[i]['minionsKilled'] ?? -1,
            'gold': homePlayers[i]['goldEarned'] ?? -1,
          });
          break;
        case 'sup':
          homeSupport = PlayerDetails.fromMap({
            'character': homePlayers[i]['character']['name'].toString(),
            'role': homePlayers[i]['role'].toString(),
            'name': homePlayers[i]['player']['name'].toString(),
            'assists': homePlayers[i]['assists'] ?? -1,
            'deaths': homePlayers[i]['deaths'] ?? -1,
            'kills': homePlayers[i]['kills'] ?? -1,
            'level': homePlayers[i]['level'] ?? -1,
            'minions': homePlayers[i]['minionsKilled'] ?? -1,
            'gold': homePlayers[i]['goldEarned'] ?? -1,
          });
          break;
      }
    }

    for (var i = 0; i < awayPlayers.length; i++) {
      switch (awayPlayers[i]['role']) {
        case 'top':
          awayTop = PlayerDetails.fromMap({
            'character': awayPlayers[i]['character']['name'].toString(),
            'role': awayPlayers[i]['role'].toString(),
            'name': awayPlayers[i]['player']['name'].toString(),
            'assists': awayPlayers[i]['assists'] ?? -1,
            'deaths': awayPlayers[i]['deaths'] ?? -1,
            'kills': awayPlayers[i]['kills'] ?? -1,
            'level': awayPlayers[i]['level'] ?? -1,
            'minions': awayPlayers[i]['minionsKilled'] ?? -1,
            'gold': awayPlayers[i]['goldEarned'] ?? -1,
          });
          break;
        case 'jun':
          awayJungle = PlayerDetails.fromMap({
            'character': awayPlayers[i]['character']['name'].toString(),
            'role': awayPlayers[i]['role'].toString(),
            'name': awayPlayers[i]['player']['name'].toString(),
            'assists': awayPlayers[i]['assists'] ?? -1,
            'deaths': awayPlayers[i]['deaths'] ?? -1,
            'kills': awayPlayers[i]['kills'] ?? -1,
            'level': awayPlayers[i]['level'] ?? -1,
            'minions': awayPlayers[i]['minionsKilled'] ?? -1,
            'gold': awayPlayers[i]['goldEarned'] ?? -1,
          });
          break;
        case 'mid':
          awayMid = PlayerDetails.fromMap({
            'character': awayPlayers[i]['character']['name'].toString(),
            'role': awayPlayers[i]['role'].toString(),
            'name': awayPlayers[i]['player']['name'].toString(),
            'assists': awayPlayers[i]['assists'] ?? -1,
            'deaths': awayPlayers[i]['deaths'] ?? -1,
            'kills': awayPlayers[i]['kills'] ?? -1,
            'level': awayPlayers[i]['level'] ?? -1,
            'minions': awayPlayers[i]['minionsKilled'] ?? -1,
            'gold': awayPlayers[i]['goldEarned'] ?? -1,
          });
          break;
        case 'adc':
          awayADC = PlayerDetails.fromMap({
            'character': awayPlayers[i]['character']['name'].toString(),
            'role': awayPlayers[i]['role'].toString(),
            'name': awayPlayers[i]['player']['name'].toString(),
            'assists': awayPlayers[i]['assists'] ?? -1,
            'deaths': awayPlayers[i]['deaths'] ?? -1,
            'kills': awayPlayers[i]['kills'] ?? -1,
            'level': awayPlayers[i]['level'] ?? -1,
            'minions': awayPlayers[i]['minionsKilled'] ?? -1,
            'gold': awayPlayers[i]['goldEarned'] ?? -1,
          });
          break;
        case 'sup':
          awaySupport = PlayerDetails.fromMap({
            'character': awayPlayers[i]['character']['name'].toString(),
            'role': awayPlayers[i]['role'].toString(),
            'name': awayPlayers[i]['player']['name'].toString(),
            'assists': awayPlayers[i]['assists'] ?? -1,
            'deaths': awayPlayers[i]['deaths'] ?? -1,
            'kills': awayPlayers[i]['kills'] ?? -1,
            'level': awayPlayers[i]['level'] ?? -1,
            'minions': awayPlayers[i]['minionsKilled'] ?? -1,
            'gold': awayPlayers[i]['goldEarned'] ?? -1,
          });
          break;
      }
    }

    return <String, Map<String, PlayerDetails?>>{
      'homePlayers': {
        'TOP': homeTop,
        'JNG': homeJungle,
        'MID': homeMid,
        'ADC': homeADC,
        'SUP': homeSupport,
      },
      'awayPlayers': {
        'TOP': awayTop,
        'JNG': awayJungle,
        'MID': awayMid,
        'ADC': awayADC,
        'SUP': awaySupport,
      },
    };
  }

  /// get game stats (Tested)
  Future<Map> getGameStats({required GameDetails gameDetails}) async {
    const url = 'https://secret.p.rapidapi.com/esport-games/get-statistics';

    final querystring = {'gameId': gameDetails.id};

    final headers = {
      'x-rapidapi-host': "secret.p.rapidapi.com",
      'x-rapidapi-key': "secret",
    };

    Response response;
    response = await dio.get<dynamic>(url,
        options: Options(
          headers: headers,
        ),
        queryParameters: querystring);

    final returnedData = response.data as Map;

    int cloudDrakeKillsHome = returnedData['homeStatistics'] != null ? (returnedData['homeStatistics']['cloudDrakeKills'] ?? 0) : 0;
    int infernalDrakeKillsHome = returnedData['homeStatistics'] != null ? (returnedData['homeStatistics']['infernalDrakeKills'] ?? 0) : 0;
    int mountainDrakeKillsHome = returnedData['homeStatistics'] != null ? (returnedData['homeStatistics']['mountainDrakeKills'] ?? 0) : 0;
    int oceanDrakeKillsHome = returnedData['homeStatistics'] != null ? (returnedData['homeStatistics']['oceanDrakeKills'] ?? 0) : 0;
    int homeDragons = cloudDrakeKillsHome + infernalDrakeKillsHome + mountainDrakeKillsHome + oceanDrakeKillsHome;

    int cloudDrakeKillsAway = returnedData['awayStatistics'] != null ? (returnedData['awayStatistics']['cloudDrakeKills'] ?? 0) : 0;
    int infernalDrakeKillsAway = returnedData['awayStatistics'] != null ? (returnedData['awayStatistics']['infernalDrakeKills'] ?? 0) : 0;
    int mountainDrakeKillsAway = returnedData['awayStatistics'] != null ? (returnedData['awayStatistics']['mountainDrakeKills'] ?? 0) : 0;
    int oceanDrakeKillsAway = returnedData['awayStatistics'] != null ? (returnedData['awayStatistics']['oceanDrakeKills'] ?? 0) : 0;
    int awayDragons = cloudDrakeKillsAway + infernalDrakeKillsAway + mountainDrakeKillsAway + oceanDrakeKillsAway;

    var homeStats = TeamStats.fromMap(<String, dynamic>{
      'Kill': returnedData['homeStatistics'] != null ? returnedData['homeStatistics']['kills'] : 0,
      'Dragon': homeDragons,
      'Gold': returnedData['homeStatistics'] != null ? returnedData['homeStatistics']['goldEarned'] : 0,
      'Inhibitor': returnedData['homeStatistics'] != null ? returnedData['homeStatistics']['inhibitorKills'] : 0,
      'Tower': returnedData['homeStatistics'] != null ? returnedData['homeStatistics']['towerKills'] : 0,
      'Elder': returnedData['homeStatistics'] != null ? returnedData['homeStatistics']['elderDrakeKills'] : 0,
      'Baron': returnedData['homeStatistics'] != null ? returnedData['homeStatistics']['nashorKills'] : 0,
    });

    var awayStats = TeamStats.fromMap(<String, dynamic>{
      'Kill': returnedData['awayStatistics'] != null ? returnedData['awayStatistics']['kills'] : 0,
      'Dragon': awayDragons,
      'Gold': returnedData['awayStatistics'] != null ? returnedData['awayStatistics']['goldEarned'] : 0,
      'Inhibitor': returnedData['awayStatistics'] != null ? returnedData['awayStatistics']['inhibitorKills'] : 0,
      'Tower': returnedData['awayStatistics'] != null ? returnedData['awayStatistics']['towerKills'] : 0,
      'Elder': returnedData['awayStatistics'] != null ? returnedData['awayStatistics']['elderDrakeKills'] : 0,
      'Baron': returnedData['awayStatistics'] != null ? returnedData['awayStatistics']['nashorKills'] : 0,
    });

    return <String, dynamic>{
      'homeStats': homeStats,
      'awayStats': awayStats,
    };
  }
}
