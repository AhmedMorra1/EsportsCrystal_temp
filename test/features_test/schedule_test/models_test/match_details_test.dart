import 'package:flutter_test/flutter_test.dart';
import 'package:esports_crystal/features/schedule/models/match_details.dart';

void main() {
  group('Schedule Controller', () {

    test('From/To Map Test"', () {
      MatchDetails matchDetails = MatchDetails.fromMap({
        'tournament':'Worlds 2021',
        'status':'inprogress',
        'homeTeam':'G2 Esports',
        'awayTeam':'Damwon Gaming',
        'id':'8913823',
        'startTimestamp':'12345678',
        'homeScore':'3',
        'awayScore':'1',
        'eventType':'best_of',
        'bestOf':'5',
        'tournamentId': '1213',
        'gameCode': '1212',
      });
      expect(matchDetails.id, '8913823');
      expect(matchDetails.status, 'inprogress');
      Map matchDetailsMap = {
        'tournament':'Worlds 2021',
        'status':'inprogress',
        'homeTeam':'G2 Esports',
        'awayTeam':'Damwon Gaming',
        'id':'8913823',
        'startTimestamp':'12345678',
        'homeScore':'3',
        'awayScore':'1',
        'eventType':'best_of',
        'bestOf':'5',
        'tournamentId': '1213',
        'gameCode': '1212',

      };
      expect(matchDetails.toMap(), matchDetailsMap);
    });
  });
}