import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:esports_crystal/features/match_details/csgo/services/csgo_api_helper.dart';
import 'package:esports_crystal/features/match_details/csgo/models/csgo_game_details.dart';
import 'package:esports_crystal/features/match_details/csgo/models/csgo_round.dart';


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
      CSGOMatchAPIHelper csgoMatchAPIHelper =
      CSGOMatchAPIHelper(dio: dio);
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
      expect(await csgoMatchAPIHelper.getMatchStreamLink(matchId: matchId),
          'google.com');
    });

    test('Get Stream Link (Not Available)', () async {
      CSGOMatchAPIHelper csgoMatchAPIHelper =
      CSGOMatchAPIHelper(dio: dio);
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
      expect(await csgoMatchAPIHelper.getMatchStreamLink(matchId: matchId),
          'https://www.twitch.tv');
    });

    test('Get Games List', () async {
      CSGOMatchAPIHelper csgoMatchAPIHelper =
      CSGOMatchAPIHelper(dio: dio);
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
      expect(await csgoMatchAPIHelper.getMatchGames(matchId: matchId),
          <CSGOGameDetails>[]);
    });

    test('getRounds', () async {
      CSGOMatchAPIHelper csgoMatchAPIHelper =
      CSGOMatchAPIHelper(dio: dio);

      String gameId = '2343456';
      final querystring = {"gameId": gameId};
      const url = 'https://secret.p.rapidapi.com/esport-games/get-rounds';

      Map returnedData = {'normaltimeRounds': [], 'overtimeRounds': []};
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
          await csgoMatchAPIHelper.getRounds(
              gameId: '2343456'),
          {'normalTimeRounds': [], 'overTimeRounds': []});
    });


    test('getLineups', () async {
      CSGOMatchAPIHelper csgoMatchAPIHelper =
      CSGOMatchAPIHelper(dio: dio);

      String gameId = '2343456';
      final querystring = {"gameId": gameId};
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
          await csgoMatchAPIHelper.getLineups(
              gameId: '2343456'),
          {'homeTeamPlayers': [], 'awayTeamPlayers': []});
    });


  });
}
