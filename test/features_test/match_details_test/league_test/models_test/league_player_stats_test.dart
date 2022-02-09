import 'package:flutter_test/flutter_test.dart';
import 'package:esports_crystal/features/match_details/league/models/league_player_stats.dart' ;

void main() {
  group('Schedule Controller', () {

    test('From/To Map Test"', () {
      PlayerDetails playerDetails = PlayerDetails.fromMap({
        'character':'Annie',
        'role':'Mid',
        'name':'Caps',
        'assists':3,
        'deaths':1,
        'kills':8,
        'level':13,
        'minions':354,
        'gold':18345,
      });
      expect(playerDetails.character, 'Annie');
      expect(playerDetails.kills, 8);
      Map playerDetailsMap = {
        'character':'Annie',
        'role':'Mid',
        'name':'Caps',
        'assists':3,
        'deaths':1,
        'kills':8,
        'level':13,
        'minions':354,
        'gold':18345,
      };
      expect(playerDetails.toMap(), playerDetailsMap);
    });
  });
}