import 'package:esports_crystal/features/tournaments/details/models/standings_row.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  test('When model functions called check their return', (){
    StandingsRow standingsRow = StandingsRow.fromMap({
      'name':'G2 Esports',
      'id':43513,
      'position':1,
      'matches':4,
      'wins':4,
      'losses':0,
    });
    expect(standingsRow.id, 43513);
    expect(standingsRow.toMap(), {
      'name':'G2 Esports',
      'id':43513,
      'position':1,
      'matches':4,
      'wins':4,
      'losses':0,
    });
  });
}