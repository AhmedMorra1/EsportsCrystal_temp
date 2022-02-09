import 'package:flutter_test/flutter_test.dart';
import 'package:esports_crystal/features/match_details/league/models/league_team_stats.dart' ;

void main() {
  group('Schedule Controller', () {

    test('From/To Map Test"', () {
      TeamStats teamStats = TeamStats.fromMap({
        'Kill': 32,
        'Gold': 54321,
        'Tower': 6,
        'Dragon': 4,
        'Baron': 1,
        'Elder': 1,
        'Inhibitor': 2,
      });
      expect(teamStats.kills, 32);
      expect(teamStats.gold, 54321);
      Map playerDetailsMap = {
        'Kill': 32,
        'Gold': 54321,
        'Tower': 6,
        'Dragon': 4,
        'Baron': 1,
        'Elder': 1,
        'Inhibitor': 2,
      };
      expect(teamStats.toMap(), playerDetailsMap);
    });
  });
}