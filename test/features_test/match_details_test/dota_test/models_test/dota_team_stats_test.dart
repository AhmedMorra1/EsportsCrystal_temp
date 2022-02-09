import 'package:flutter_test/flutter_test.dart';
import 'package:esports_crystal/features/match_details/dota/models/dota_team_stats.dart' ;

void main() {
  group('Dota 2 models', () {

    test('From/To Map Test"', () {
      TeamStats teamStats = TeamStats.fromMap({
        'Kills': 43,
        'Towers': 6,
        'Barracks': 2,
      });
      expect(teamStats.kills, 43);
      expect(teamStats.towersDestroyed, 6);
      Map playerDetailsMap = {
        'Kills': 43,
        'Towers': 6,
        'Barracks': 2,
      };
      expect(teamStats.toMap(), playerDetailsMap);
    });
  });
}