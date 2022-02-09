import 'package:esports_crystal/features/tournaments/details/models/standings.dart';
import 'package:esports_crystal/features/tournaments/details/models/standings_row.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  test('When model functions called check their return', (){
    Standings standings = Standings.fromMap({
      'id':12,
      'name':'Group A',
      'type':'total',
      'rows':<StandingsRow>[],
    });
    expect(standings.id, 12);
    expect(standings.rows?.isEmpty, true);
    expect(standings.toMap(), {
      'id':12,
      'name':'Group A',
      'type':'total',
      'rows':<StandingsRow>[],
    });
  });
}