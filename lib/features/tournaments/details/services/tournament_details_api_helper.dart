import 'package:dio/dio.dart';
import 'package:esports_crystal/features/schedule/models/match_details.dart';
import 'package:esports_crystal/features/tournaments/details/models/cup_participant.dart';
import 'package:esports_crystal/features/tournaments/details/models/cup_tree.dart';
import 'package:esports_crystal/features/tournaments/details/models/cup_tree_round.dart';
import 'package:esports_crystal/features/tournaments/details/models/cup_tree_round_block.dart';
import 'package:esports_crystal/features/tournaments/details/models/season.dart';
import 'package:esports_crystal/features/tournaments/details/models/standings.dart';
import 'package:esports_crystal/features/tournaments/details/models/standings_row.dart';

class TournamentDetailApiHelper {
  TournamentDetailApiHelper({required this.dio});

  final Dio dio;

  /// ( Tested )
  Future<List<Season>> getSeasons({required int id}) async {
    /// Initiate the api call variables
    const url = 'https://secret.p.rapidapi.com/tournaments/get-seasons';

    final querystring = {
      'tournamentId': id,
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
      var returnedTournamentList = returnedData['seasons'] as List;
      var tournamentsList = <Season>[];
      for (var t = 0; t < returnedTournamentList.length; t++) {
        tournamentsList.add(Season.fromMap({
          'name': returnedTournamentList[t]['name'],
          'id': returnedTournamentList[t]['id'],
          'userCount': returnedTournamentList[t]['userCount'],
        }));
      }
      return tournamentsList;
    } catch (e) {
      return <Season>[];
    }
  }

  /// ( Tested )
  Future<List<Standings>> getStandings({required int tournamentId, required int seasonId}) async {
    /// Initiate the api call variables
    const url = 'https://secret.p.rapidapi.com/tournaments/get-standings';

    final querystring = {
      'tournamentId': tournamentId,
      'seasonId': seasonId,
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
      var returnedStandingsList = returnedData['standings'] as List;
      var standingsList = <Standings>[];
      for (var s = 0; s < returnedStandingsList.length; s++) {
        var returnedRows = returnedStandingsList[s]['rows'] ?? [];
        var standingsRowList = <StandingsRow>[];
        for (var r = 0; r < returnedRows.length; r++) {
          standingsRowList.add(StandingsRow.fromMap({
            'id': returnedRows[r]['id'],
            'name': returnedRows[r]['team']['name'],
            'position': r + 1,
            'matches': returnedRows[r]['matches'],
            'wins': returnedRows[r]['wins'],
            'losses': returnedRows[r]['losses'],
          }));
        }
        standingsList.add(Standings.fromMap({
          'id': returnedStandingsList[s]['id'],
          'name': returnedStandingsList[s]['name'],
          'type': returnedStandingsList[s]['type'],
          'rows': standingsRowList,
        }));
      }
      return standingsList;
    } catch (e) {
      return <Standings>[];
    }
  }

  /// ( Tested )
  Future<List<CupTree>> getCupTree({required int tournamentId, required int seasonId}) async {
    /// Initiate the api call variables
    const url = 'https://secret.p.rapidapi.com/tournaments/get-cuptrees';

    final querystring = {
      'tournamentId': tournamentId,
      'seasonId': seasonId,
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
      var returnedCupTreesList = returnedData['cupTrees'] as List;
      var cupTreesList = <CupTree>[];
      for (var c = 0; c < returnedCupTreesList.length; c++) {
        var returnedRounds = returnedCupTreesList[c]['rounds'] ?? [];
        var cupTreeRoundList = <CupTreeRound>[];
        for (var r = 0; r < returnedRounds.length; r++) {
          ///
          var returnedBlocks = returnedRounds[r]['blocks'] ?? [];
          var cupTreeRoundBlocksList = <CupTreeRoundBlock>[];
          for (var b = 0; b < returnedBlocks.length; b++) {
            ///
            var returnedParticipants = returnedBlocks[b]['participants'] ?? [];
            var cupTreeParticipantsList = <CupParticipant>[];
            for (var p = 0; p < returnedParticipants.length; p++) {
              cupTreeParticipantsList.add(CupParticipant.fromMap({
                'id':returnedParticipants[p]['id'],
                'name':returnedParticipants[p]['team']['name'],
                'winner':returnedParticipants[p]['winner'],
                'order':returnedParticipants[p]['order'],
              }));
            }
            ///
            cupTreeRoundBlocksList.add(CupTreeRoundBlock.fromMap({
              'blockId':returnedBlocks[b]['blockId'],
              'finished':returnedBlocks[b]['finished'],
              'matchesInRound':returnedBlocks[b]['matchesInRound'],
              'order':returnedBlocks[b]['order'],
              'result':returnedBlocks[b]['result'],
              'homeTeamScore':returnedBlocks[b]['homeTeamScore'],
              'awayTeamScore':returnedBlocks[b]['awayTeamScore'],
              'participants':cupTreeParticipantsList,
              'hasNextRoundLink':returnedBlocks[b]['hasNextRoundLink'],
              'eventInProgress':returnedBlocks[b]['eventInProgress'],
              'id':returnedBlocks[b]['id'],
              'events':returnedBlocks[b]['events'],
              'seriesStartDateTimestamp':returnedBlocks[b]['seriesStartDateTimestamp'],
              'automaticProgression':returnedBlocks[b]['automaticProgression'],
            }
            ));
          }
          ///
          cupTreeRoundList.add(CupTreeRound(
            blocks: cupTreeRoundBlocksList,
            order: returnedRounds[r]['order'],
            description: returnedRounds[r]['description'],
            type: returnedRounds[r]['type'],
            id: returnedRounds[r]['id'],
          ));
        }
        cupTreesList.add(CupTree(
          id: returnedCupTreesList[c]['id'],
          name: returnedCupTreesList[c]['name'],
          currentRound: returnedCupTreesList[c]['currentRound'],
          rounds: cupTreeRoundList,
          type: returnedCupTreesList[c]['type'],
        ));
      }
      return cupTreesList;
    } catch (e) {
      return <CupTree>[];
    }
  }


  /// (Not Tested)
  Future< List<MatchDetails>> getTournamentsLastMatches(
      {required int tournamentId, required int seasonId, required int pageIndex, }) async {

    /// Initiate the api call variables
    const url =
        'https://secret.p.rapidapi.com//tournaments/get-last-matches';

    final querystring = {"tournamentId":tournamentId,"seasonId":seasonId,"pageIndex":pageIndex,};

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
      final returnedData = response.data as Map;
      final returnedMatches = returnedData['events'] as List;
      /// 3- INITIATE AN EMPTY LIST FOR THE last MATCHES
      final lastMatches = <MatchDetails>[];
      /// 4- CHECK IF THE MATCH IS LIVE
      for (var i = 0; i < returnedMatches.length; i++) {
        // Initiate the match object
        var match = MatchDetails.fromMap({
          'tournament': returnedMatches[i]['tournament']['name'].toString(),
          'status': returnedMatches[i]['status']['type'].toString(),
          'homeTeam': returnedMatches[i]['homeTeam']['name'].toString(),
          'awayTeam': returnedMatches[i]['awayTeam']['name'].toString(),
          'id': returnedMatches[i]['id'].toString(),
          'startTimestamp': returnedMatches[i]['startTimestamp'].toString(),
          'homeScore' : returnedMatches[i]['homeScore']['current'].toString(),
          'awayScore' : returnedMatches[i]['awayScore']['current'].toString(),
          'bestOf':returnedMatches[i]['bestOf'].toString(),
          'eventType':returnedMatches[i]['eventType'].toString(),
        });
        lastMatches.add(match);
      }

      return lastMatches;
    } catch (e) {
      return [];
    }
  }

  /// (Not Tested)
  Future< List<MatchDetails>> getTournamentsNextMatches(
      {required int tournamentId, required int seasonId, required int pageIndex, }) async {

    /// Initiate the api call variables
    const url =
        'https://secret.p.rapidapi.com//tournaments/get-next-matches';

    final querystring = {"tournamentId":tournamentId,"seasonId":seasonId,"pageIndex":pageIndex,};

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
      final returnedData = response.data as Map;
      final returnedMatches = returnedData['events'] as List;
      /// 3- INITIATE AN EMPTY LIST FOR THE next MATCHES
      final nextMatches = <MatchDetails>[];
      /// 4- CHECK IF THE MATCH IS LIVE
      for (var i = 0; i < returnedMatches.length; i++) {
        // Initiate the match object
        var match = MatchDetails.fromMap({
          'tournament': returnedMatches[i]['tournament']['name'].toString(),
          'status': returnedMatches[i]['status']['type'].toString(),
          'homeTeam': returnedMatches[i]['homeTeam']['name'].toString(),
          'awayTeam': returnedMatches[i]['awayTeam']['name'].toString(),
          'id': returnedMatches[i]['id'].toString(),
          'startTimestamp': returnedMatches[i]['startTimestamp'].toString(),
          'homeScore' : returnedMatches[i]['homeScore']['current'].toString(),
          'awayScore' : returnedMatches[i]['awayScore']['current'].toString(),
          'bestOf':returnedMatches[i]['bestOf'].toString(),
          'eventType':returnedMatches[i]['eventType'].toString(),
        });
        nextMatches.add(match);
      }

      return nextMatches;
    } catch (e) {
      return [];
    }
  }


}
