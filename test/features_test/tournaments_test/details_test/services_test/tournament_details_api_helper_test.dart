import 'package:dio/dio.dart';
import 'package:esports_crystal/features/schedule/models/match_details.dart';
import 'package:esports_crystal/features/tournaments/details/models/cup_tree.dart';
import 'package:esports_crystal/features/tournaments/details/models/season.dart';
import 'package:esports_crystal/features/tournaments/details/models/standings.dart';
import 'package:esports_crystal/features/tournaments/details/services/tournament_details_api_helper.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late Dio dio;
  late DioAdapter dioAdapter;

  Response<dynamic> response;

  const headers = {
    'x-rapidapi-host': 'secret.p.rapidapi.com',
    'x-rapidapi-key': 'secret',
  };

  setUp(() {
    dio = Dio(BaseOptions());
    dioAdapter = DioAdapter(dio: dio);
  });

  group('Seasons', () {
    test('When the API is called return the list of seasons', () async {
      TournamentDetailApiHelper tournamentsDetailsAPIHelper = TournamentDetailApiHelper(dio: dio);

      const url = 'https://secret.p.rapidapi.com/tournaments/get-seasons';

      var id = 1571;

      final querystring = {
        'categoryId': id,
      };

      final headers = {
        'x-rapidapi-host': 'secret.p.rapidapi.com',
        'x-rapidapi-key': 'secret',
      };

      Map returnedData = {'seasons': []};

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

      expect(await tournamentsDetailsAPIHelper.getSeasons(id: id), <Season>[]);
    });

    test('When the API is called return the list of seasons but there is an error', () async {
      TournamentDetailApiHelper tournamentsDetailsAPIHelper = TournamentDetailApiHelper(dio: dio);

      const url = 'https://secret.p.rapidapi.com/tournaments/get-seasons';

      var id = 1571;

      final querystring = {
        'categoryId': id,
      };

      final headers = {
        'x-rapidapi-host': 'secret.p.rapidapi.com',
        'x-rapidapi-key': 'secret',
      };

      Map returnedData = {'errorMaker': []};

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

      expect(await tournamentsDetailsAPIHelper.getSeasons(id: id), <Season>[]);
    });
  });

  group('Standings', () {
    test('When the API is called return the list of standings', () async {
      TournamentDetailApiHelper tournamentsDetailsAPIHelper = TournamentDetailApiHelper(dio: dio);

      const url = 'https://secret.p.rapidapi.com/tournaments/get-standings';

      var tournamentId = 1571;
      var seasonId = 1224;

      final querystring = {
        'tournamentId': tournamentId,
        'seasonId': seasonId,
      };

      final headers = {
        'x-rapidapi-host': 'secret.p.rapidapi.com',
        'x-rapidapi-key': 'secret',
      };

      Map returnedData = {'standings': []};

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

      expect(await tournamentsDetailsAPIHelper.getStandings(seasonId: seasonId, tournamentId: tournamentId), <Standings>[]);
    });

    test('When the API is called return the list of standings but there is an error', () async {
      TournamentDetailApiHelper tournamentsDetailsAPIHelper = TournamentDetailApiHelper(dio: dio);

      const url = 'https://secret.p.rapidapi.com/tournaments/get-standings';

      var tournamentId = 1571;
      var seasonId = 1224;

      final querystring = {
        'tournamentId': tournamentId,
        'seasonId': seasonId,
      };

      final headers = {
        'x-rapidapi-host': 'secret.p.rapidapi.com',
        'x-rapidapi-key': 'secret',
      };

      Map returnedData = {'errorMaker': []};

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

      expect(await tournamentsDetailsAPIHelper.getStandings(seasonId: seasonId, tournamentId: tournamentId), <Standings>[]);
    });
  });

  group('cupTrees', () {
    test('When the API is called return the list of cuptrees', () async {
      TournamentDetailApiHelper tournamentsDetailsAPIHelper = TournamentDetailApiHelper(dio: dio);

      const url = 'https://secret.p.rapidapi.com/tournaments/get-cuptrees';

      var tournamentId = 1571;
      var seasonId = 1224;

      final querystring = {
        'tournamentId': tournamentId,
        'seasonId': seasonId,
      };

      final headers = {
        'x-rapidapi-host': 'secret.p.rapidapi.com',
        'x-rapidapi-key': 'secret',
      };

      Map returnedData = {'cupTrees': []};

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

      expect(await tournamentsDetailsAPIHelper.getCupTree(seasonId: seasonId, tournamentId: tournamentId), <CupTree>[]);
    });

    test('When the API is called return the list of cuptrees but there is an error', () async {
      TournamentDetailApiHelper tournamentsDetailsAPIHelper = TournamentDetailApiHelper(dio: dio);

      const url = 'https://secret.p.rapidapi.com/tournaments/get-cuptrees';

      var tournamentId = 1571;
      var seasonId = 1224;

      final querystring = {
        'tournamentId': tournamentId,
        'seasonId': seasonId,
      };

      final headers = {
        'x-rapidapi-host': 'secret.p.rapidapi.com',
        'x-rapidapi-key': 'secret',
      };

      Map returnedData = {'errorMaker': []};

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

      expect(await tournamentsDetailsAPIHelper.getCupTree(seasonId: seasonId, tournamentId: tournamentId), <CupTree>[]);
    });
  });

  group('Matches', () {
    group('Last Matches', () {
      test('Success API Call', () async {
        TournamentDetailApiHelper tournamentsDetailsAPIHelper = TournamentDetailApiHelper(dio: dio);

        const url = 'https://secret.p.rapidapi.com//tournaments/get-last-matches';

        var tournamentId = 1232;
        var seasonId = 1231;
        var pageIndex = 1;

        final querystring = {
          "tournamentId": tournamentId,
          "seasonId": seasonId,
          "pageIndex": pageIndex,
        };

        final headers = {
          'x-rapidapi-host': 'secret.p.rapidapi.com',
          'x-rapidapi-key': 'secret',
        };

        Map returnedData = {'events': []};

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

        expect(await tournamentsDetailsAPIHelper.getTournamentsLastMatches(seasonId: seasonId, tournamentId: tournamentId, pageIndex: pageIndex),
            <MatchDetails>[]);
      });

      test('Failure API Call', () async {
        TournamentDetailApiHelper tournamentsDetailsAPIHelper = TournamentDetailApiHelper(dio: dio);

        const url = 'https://secret.p.rapidapi.com//tournaments/get-last-matches';

        var tournamentId = 1232;
        var seasonId = 1231;
        var pageIndex = 1;

        final querystring = {
          "tournamentId": tournamentId,
          "seasonId": seasonId,
          "pageIndex": pageIndex,
        };

        final headers = {
          'x-rapidapi-host': 'secret.p.rapidapi.com',
          'x-rapidapi-key': 'secret',
        };

        Map returnedData = {'failure maker': []};

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

        expect(await tournamentsDetailsAPIHelper.getTournamentsLastMatches(seasonId: seasonId, tournamentId: tournamentId, pageIndex: pageIndex),
            <MatchDetails>[]);
      });
    });

    group('Next Matches', () {
      test('Success API Call', () async {
        TournamentDetailApiHelper tournamentsDetailsAPIHelper = TournamentDetailApiHelper(dio: dio);

        const url = 'https://secret.p.rapidapi.com//tournaments/get-next-matches';

        var tournamentId = 1232;
        var seasonId = 1231;
        var pageIndex = 1;

        final querystring = {
          "tournamentId": tournamentId,
          "seasonId": seasonId,
          "pageIndex": pageIndex,
        };

        final headers = {
          'x-rapidapi-host': 'secret.p.rapidapi.com',
          'x-rapidapi-key': 'secret',
        };

        Map returnedData = {'events': []};

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

        expect(await tournamentsDetailsAPIHelper.getTournamentsNextMatches(seasonId: seasonId, tournamentId: tournamentId, pageIndex: pageIndex),
            <MatchDetails>[]);
      });

      test('Failure API Call', () async {
        TournamentDetailApiHelper tournamentsDetailsAPIHelper = TournamentDetailApiHelper(dio: dio);

        const url = 'https://secret.p.rapidapi.com//tournaments/get-next-matches';

        var tournamentId = 1232;
        var seasonId = 1231;
        var pageIndex = 1;

        final querystring = {
          "tournamentId": tournamentId,
          "seasonId": seasonId,
          "pageIndex": pageIndex,
        };

        final headers = {
          'x-rapidapi-host': 'secret.p.rapidapi.com',
          'x-rapidapi-key': 'secret',
        };

        Map returnedData = {'failure maker': []};

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

        expect(await tournamentsDetailsAPIHelper.getTournamentsNextMatches(seasonId: seasonId, tournamentId: tournamentId, pageIndex: pageIndex),
            <MatchDetails>[]);
      });
    });
  });
}
