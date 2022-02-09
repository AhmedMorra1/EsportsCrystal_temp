import 'package:dio/dio.dart';
import 'package:esports_crystal/features/schedule/models/match_details.dart';

/// API Helper class
class ScheduleAPIHelper {
  ScheduleAPIHelper({required this.dio});
  // dio object
  final Dio dio;

  /// get today tournaments matches
  /// get Data Method
  Future<Map<String, List<MatchDetails>>> getDayTournamentsMatches(
      {String? gameCode, String? day}) async {

    /// Initiate the api call variables
    const url =
        'https://secret.p.rapidapi.com//tournaments/get-scheduled-events';

    final querystring = {'categoryId': gameCode, 'date': day};

    final headers = {
      'x-rapidapi-host': 'secret.p.rapidapi.com',
      'x-rapidapi-key': 'secret'
    };

    /// define the response object
    Response response;
    try {
      /// 1- CALL THE API END POINT
      response = await dio.get<dynamic>(url,
          options: Options(
            headers: headers,
          ),
          queryParameters: querystring);
      /// 2- GET LIST OF MATCHES
      final returedData = response.data as Map;
      //Todo: Split here into two methods
      final returnedMatches = returedData['events'] as List;
      /// 3- INITIATE AN EMPTY LIST FOR THE DAY MATCHES
      final daysMatches = <MatchDetails>[];
      /// 4- CHECK IF THE MATCH IS LIVE
      for (var i = 0; i < returnedMatches.length; i++) {
        // Initiate the match object
        var match = MatchDetails.fromMap({
          'tournament': returnedMatches[i]['tournament']['uniqueTournament']['name'].toString(),
          'status': returnedMatches[i]['status']['type'].toString(),
          'homeTeam': returnedMatches[i]['homeTeam']['name'].toString(),
          'awayTeam': returnedMatches[i]['awayTeam']['name'].toString(),
          'id': returnedMatches[i]['id'].toString(),
          'startTimestamp': returnedMatches[i]['startTimestamp'].toString(),
          'homeScore' : returnedMatches[i]['homeScore']['current'].toString(),
          'awayScore' : returnedMatches[i]['awayScore']['current'].toString(),
          'bestOf':returnedMatches[i]['bestOf'].toString(),
          'eventType':returnedMatches[i]['eventType'].toString(),
          'tournamentId':returnedMatches[i]['tournament']['uniqueTournament']['id'].toString(),
        });
        // Initiate the matchStartDate DateTime Variable
        DateTime matchStartDate = DateTime.fromMillisecondsSinceEpoch(
            int.parse(match.startTimestamp!) * 1000);
        /// 4.1- CHECK IF THE MATCH START LIVE OR START TIME ON THE SAME DAY AS DEVICE
        if (matchStartDate.toString().substring(0,10)==day){
          daysMatches.add(match);
        }
      }
      /// 5- Initiate empty map for tournaments
      Map<String, List<MatchDetails>> tournamentsMatches = Map();
      /// 6- Iterate over day match list
      for (var m = 0;m<daysMatches.length;m++){
        /// 7- Check if the tournament name in the tournament map
        if (tournamentsMatches.containsKey(daysMatches[m].tournament)){
          // if so add the match to the existing list to the tournament key
          tournamentsMatches[daysMatches[m].tournament]!.add(daysMatches[m]);
        }else{
          // if not add a list that contains the match to the tournament key
          tournamentsMatches[daysMatches[m].tournament!] = [daysMatches[m]];
        }
      }
      /// 8- return the tournaments map
      return tournamentsMatches;
    } catch (e) {
      return {'Connection Error!':[]};
    }
  }

  void closeConnection(){
    dio.close(force: true);
  }
}