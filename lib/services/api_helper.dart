import 'package:dio/dio.dart';
import 'package:esports_crystal/features/schedule/models/match_details.dart';

/// API Helper class
class APIHelper {
  APIHelper({required this.dio});
  // dio object
  final Dio dio;

  /// get today tournaments matches
  /// get Data Method
  Future<MatchDetails> getMatchDetails({String? matchId}) async {
      /// Initiate the api call variables
      const url = 'https://secret.p.rapidapi.com/matches/detail';

      final querystring = {'matchId': matchId};

      final headers = {'x-rapidapi-host': 'divanscore.p.rapidapi.com', 'x-rapidapi-key': '14fbb01d9cmsh8e7ac100fdc6b77p138390jsnda5f9d62181d'};

      /// define the response object
      Response response;
      /// 1- CALL THE API END POINT
      response = await dio.get<dynamic>(url,
          options: Options(
            headers: headers,
          ),
          queryParameters: querystring);


      final returnedData = response.data as Map;
      //try {
      return MatchDetails(
        tournament: returnedData['event']['tournament']['uniqueTournament']['name'],
        tournamentId: returnedData['event']['tournament']['uniqueTournament']['id'].toString(),
        status: returnedData['event']['status']['type'],
        homeTeam: returnedData['event']['homeTeam']['name'],
        awayTeam: returnedData['event']['awayTeam']['name'],
        id: returnedData['event']['id'].toString(),
        startTimestamp: returnedData['event']['startTimestamp'].toString(),
        homeScore: returnedData['event']['homeScore']['display'].toString(),
        awayScore: returnedData['event']['awayScore']['display'].toString(),
        eventType: returnedData['event']['eventType'],
        bestOf: returnedData['event']['bestOf'].toString(),
        gameCode: returnedData['event']['tournament']['category']['id'].toString(),
      );
    // }
    // catch(e){
    //     print('error is $e');
    //     print(e);
    //   return MatchDetails(
    //     tournament: returnedData['event']['tournament']['uniqueTournament']['name'],
    //     tournamentId: returnedData['event']['tournament']['uniqueTournament']['id'].toString(),
    //     status: returnedData['event']['status']['type'],
    //     homeTeam: returnedData['event']['homeTeam']['name'],
    //     awayTeam: returnedData['event']['awayTeam']['name'],
    //     id: returnedData['event']['id'].toString(),
    //     startTimestamp: returnedData['event']['startTimestamp'].toString(),
    //     homeScore: returnedData['event']['homeScore']['display'].toString(),
    //     awayScore: returnedData['event']['awayScore']['display'].toString(),
    //     eventType: returnedData['event']['eventType'],
    //     bestOf: returnedData['event']['bestOf'].toString(),
    //     gameCode: 'fail',
    //   );
    // }
  }

  void closeConnection() {
    dio.close(force: true);
  }
}
