import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:esports_crystal/features/match_details/league/services/league_matches_api_helper.dart';
import 'package:esports_crystal/features/match_details/league/models/league_player_stats.dart';
import 'package:esports_crystal/features/match_details/league/models/league_game_details.dart';


void main() {
  late Dio dio;
  late DioAdapter dioAdapter;

  Response<dynamic> response;

  group('League Match API Helper Tests', () {
    const headers = {
      'x-rapidapi-host': 'secret.p.rapidapi.com',
      'x-rapidapi-key': 'secret'
    };

    setUp(() {
      dio = Dio(BaseOptions());
      dioAdapter = DioAdapter(dio: dio);
    });

    test('Get Stream Link', () async {
      LeagueMatchAPIHelper leagueMatchAPIHelper =
      LeagueMatchAPIHelper(dio: dio);
      const url = 'https://secret.p.rapidapi.com/matches/get-media';

      String matchId = '2343456';
      final querystring = {"matchId": matchId};

      Map returnedData = {
        'media': [
          {'url': 'google.com'}
        ]
      };
      dioAdapter.onGet(
        url,
            (server) => server.reply(200, returnedData),
        headers: headers,
        queryParameters: querystring,
      );
      response = await dio.get(url,
          options: Options(
            headers: headers,
          ),
          queryParameters: querystring);
      expect(await leagueMatchAPIHelper.getMatchStreamLink(matchId: matchId),
          'google.com');
    });

    test('Get Stream Link (Not Available)', () async {
      LeagueMatchAPIHelper leagueMatchAPIHelper =
      LeagueMatchAPIHelper(dio: dio);
      const url = 'https://secret.p.rapidapi.com/matches/get-media';

      String matchId = '2343456';
      final querystring = {"matchId": matchId};

      Map returnedData = {'media': null};
      dioAdapter.onGet(
        url,
            (server) => server.reply(200, returnedData),
        headers: headers,
        queryParameters: querystring,
      );
      response = await dio.get(url,
          options: Options(
            headers: headers,
          ),
          queryParameters: querystring);
      expect(await leagueMatchAPIHelper.getMatchStreamLink(matchId: matchId),
          'https://www.twitch.tv');
    });

    test('Get Games List', () async {
      LeagueMatchAPIHelper leagueMatchAPIHelper =
      LeagueMatchAPIHelper(dio: dio);
      const url = 'https://secret.p.rapidapi.com/matches/get-esport-games';

      String matchId = '2343456';
      final querystring = {"matchId": matchId};

      Map returnedData = {'games': []};
      dioAdapter.onGet(
        url,
            (server) => server.reply(200, returnedData),
        headers: headers,
        queryParameters: querystring,
      );
      response = await dio.get(url,
          options: Options(
            headers: headers,
          ),
          queryParameters: querystring);
      expect(await leagueMatchAPIHelper.getMatchGames(matchId: matchId),
          <GameDetails>[]);
    });

    test('Get Player Stats', () async {
      LeagueMatchAPIHelper leagueMatchAPIHelper =
      LeagueMatchAPIHelper(dio: dio);

      String matchId = '2343456';
      final querystring = {"gameId": matchId};
      const url = 'https://secret.p.rapidapi.com/esport-games/get-lineups';

      Map returnedData = {'homeTeamPlayers': [], 'awayTeamPlayers': []};
      dioAdapter.onGet(
        url,
            (server) => server.reply(200, returnedData),
        headers: headers,
        queryParameters: querystring,
      );
      response = await dio.get(url,
          options: Options(
            headers: headers,
          ),
          queryParameters: querystring);
      expect(
          await leagueMatchAPIHelper.getPlayerStats(
              gameDetails: GameDetails(
                  status: 'inprogress',
                  id: '2343456',
                  homeTeamStartingSide: '1',
                  startTimestamp: '12345676',
                  hasCompleteStatistics: 'true')),
          <String, Map<String, PlayerDetails?>>{
            'homePlayers': {
              'TOP': null,
              'JNG': null,
              'MID': null,
              'ADC': null,
              'SUP': null
            },
            'awayPlayers': {
              'TOP': null,
              'JNG': null,
              'MID': null,
              'ADC': null,
              'SUP': null
            }
          });
    });


  });
}
