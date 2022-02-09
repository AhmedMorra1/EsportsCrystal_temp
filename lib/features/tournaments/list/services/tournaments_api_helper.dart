import 'package:dio/dio.dart';
import 'package:esports_crystal/features/tournaments/list/models/tournament_model.dart';

class TournamentsAPIHelper {
  ///construct the helper object with a dio instance to be able to test it

  TournamentsAPIHelper({required this.dio});
  // dio object
  final Dio dio;

  Future<List<Tournament>> getTournamentList({
    required String gameId,
  }) async {
    /// Initiate the api call variables
    const url = 'https://secret.p.rapidapi.com/tournaments/list';

    final querystring = {
      'categoryId': gameId,
    };

    final headers = {
      'x-rapidapi-host': 'secret.p.rapidapi.com',
      'x-rapidapi-key': 'secret',
    };

    //define the response object
    Response response;

    try {
      response = await dio.get<dynamic>(
        url,
        options: Options(headers: headers),
        queryParameters: querystring,
      );
      var returnedData = response.data as Map;
      var returnedTournamentList = returnedData['groups'][0]['uniqueTournaments'] as List;
      var tournamentsList = <Tournament>[];
      for (var t = 0; t < returnedTournamentList.length; t++) {
        tournamentsList.add(Tournament.fromMap({
          'name': returnedTournamentList[t]['name'],
          'id': returnedTournamentList[t]['id'],
          'userCount': returnedTournamentList[t]['userCount'],
        }));
      }
      return tournamentsList;
    } catch (e) {
      return <Tournament>[];
    }
  }
}
