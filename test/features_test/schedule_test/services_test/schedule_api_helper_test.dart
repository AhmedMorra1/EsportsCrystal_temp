import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:esports_crystal/features/schedule/services/schedule_api_helper.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main(){
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

    test('Check Tournament List Error', () async {
      ScheduleAPIHelper leagueMatchAPIHelper =
      ScheduleAPIHelper(dio: dio);
      const url = 'https://secret.p.rapidapi.com//tournaments/get-scheduled-events';

      String gameCode = '1571';
      String day = '10-7-2021';

      final querystring = {'categoryId': gameCode, 'date': day};

      Map returnedData = {
        "events":['cause an error']
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
      expect(await leagueMatchAPIHelper.getDayTournamentsMatches(gameCode: gameCode,day: day),
          {'Connection Error!':[]});
    });
  });
}