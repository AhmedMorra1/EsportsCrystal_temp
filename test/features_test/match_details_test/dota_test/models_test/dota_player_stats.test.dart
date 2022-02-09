import 'package:flutter_test/flutter_test.dart';
import 'package:esports_crystal/features/match_details/dota/models/dota_player_stats.dart' ;

void main() {
  group('Dota 2 models', () {

    test('From/To Map Test"', () {
      PlayerDetails playerDetails = PlayerDetails.fromMap({
        'character':'Void',
        'name':'Player',
        'kills':12,
        'assists':5,
        'deaths':3,
        'goldPerMin':453,
        'heroLevel':11,
        'lastHits':70,
        'netWorth':5432,
        'xpPerMin':422,
        'denies':3,
      });
      expect(playerDetails.character, 'Void');
      expect(playerDetails.kills, 12);
      Map playerDetailsMap = {
        'character':'Void',
        'name':'Player',
        'kills':12,
        'assists':5,
        'deaths':3,
        'goldPerMin':453,
        'heroLevel':11,
        'lastHits':70,
        'netWorth':5432,
        'xpPerMin':422,
        'denies':3,
      };
      expect(playerDetails.toMap(), playerDetailsMap);
    });
  });
}