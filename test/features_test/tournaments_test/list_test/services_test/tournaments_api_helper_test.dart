import 'package:dio/dio.dart';
import 'package:esports_crystal/features/tournaments/list/models/tournament_model.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:esports_crystal/features/tournaments/list/services/tournaments_api_helper.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late Dio dio;
  late DioAdapter dioAdapter;
  Response<dynamic> response;
  const headers = {'x-rapidapi-host': 'secret.p.rapidapi.com', 'x-rapidapi-key': 'secret'};

  setUp(() {
    dio = Dio(BaseOptions());
    dioAdapter = DioAdapter(dio: dio);
  });

  test('When the API is called return the list of tournaments', () async {
    TournamentsAPIHelper tournamentsAPIHelper = TournamentsAPIHelper(dio: dio);

    const url = 'https://secret.p.rapidapi.com/tournaments/list';

    var gameId = '1571';

    final querystring = {
      'categoryId': gameId,
    };

    final headers = {
      'x-rapidapi-host': 'secret.p.rapidapi.com',
      'x-rapidapi-key': 'secret',
    };

    Map returnedData = {
      'groups': [
        {
          'uniqueTournaments': [],
        },
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

    expect(await tournamentsAPIHelper.getTournamentList(gameId: gameId), <Tournament>[]);
  });
  test('When the API is called and there an error it returns empty list', () async {
    TournamentsAPIHelper tournamentsAPIHelper = TournamentsAPIHelper(dio: dio);

    const url = 'https://secret.p.rapidapi.com/tournaments/list';

    var gameId = '1571';

    final querystring = {
      'categoryId': gameId,
    };

    final headers = {
      'x-rapidapi-host': 'secret.p.rapidapi.com',
      'x-rapidapi-key': 'secret',
    };

    Map returnedData = {
      'groups': [
        {
          'causeAnError': 'AAAAAAAAAA',
        },
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

    expect(await tournamentsAPIHelper.getTournamentList(gameId: gameId), <Tournament>[]);
  });
}
