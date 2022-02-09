import 'package:flutter_test/flutter_test.dart';
import 'package:esports_crystal/features/match_details/csgo/models/csgo_round.dart' ;

void main() {
  group('CSGO Controller', () {

    test('From/To Map Test"', () {
      CSGORound gameDetails = CSGORound.fromMap({
        'winnerCode': '2',
        'outcome': '0',
        'homeTeamSide': '5',
        'number': '1',
      });
      expect(gameDetails.winnerCode, '2');
      expect(gameDetails.outcome, '0');
      expect(gameDetails.homeTeamSide, '5');
      Map gameDetailsMap = {
        'winnerCode': '2',
        'outcome': '0',
        'homeTeamSide': '5',
        'number': '1',
      };
      expect(gameDetails.toMap(), gameDetailsMap);
    });
  });
}

