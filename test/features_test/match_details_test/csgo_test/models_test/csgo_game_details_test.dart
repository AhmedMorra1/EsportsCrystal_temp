import 'package:flutter_test/flutter_test.dart';
import 'package:esports_crystal/features/match_details/csgo/models/csgo_game_details.dart' ;

void main() {
  group('CSGO Controller', () {

    test('From/To Map Test"', () {
      CSGOGameDetails gameDetails = CSGOGameDetails.fromMap({
        'status':'inprogress',
        'id':'5678439',
        'startTimestamp':'1234565768',
        'homeTeamStartingSide':'2',
        'hasCompleteStatistics':'false',
        'length': '1234',
        'winnerCode': '2',
        'map': 'Inferno',
        'homeScore': '11',
        'awayScore': '16',
      });
      expect(gameDetails.id, '5678439');
      expect(gameDetails.status, 'inprogress');
      expect(gameDetails.map, 'Inferno');
      Map gameDetailsMap = {
        'status':'inprogress',
        'id':'5678439',
        'startTimestamp':'1234565768',
        'homeTeamStartingSide':'2',
        'hasCompleteStatistics':'false',
        'length': '1234',
        'winnerCode': '2',
        'map': 'Inferno',
        'homeScore': '11',
        'awayScore': '16',
      };
      expect(gameDetails.toMap(), gameDetailsMap);
    });
  });
}

