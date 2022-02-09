import 'package:flutter_test/flutter_test.dart';
import 'package:esports_crystal/features/match_details/league/models/league_game_details.dart' ;

void main() {
  group('Schedule Controller', () {

    test('From/To Map Test"', () {
      GameDetails gameDetails = GameDetails.fromMap({
        'status':'inprogress',
        'id':'5678439',
        'startTimestamp':'1234565768',
        'homeTeamStartingSide':'2',
        'hasCompleteStatistics':'false',
      });
      expect(gameDetails.id, '5678439');
      expect(gameDetails.status, 'inprogress');
      Map gameDetailsMap = {
        'status':'inprogress',
        'id':'5678439',
        'startTimestamp':'1234565768',
        'homeTeamStartingSide':'2',
        'hasCompleteStatistics':'false',
      };
      expect(gameDetails.toMap(), gameDetailsMap);
    });
  });
}