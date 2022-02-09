import 'package:flutter_test/flutter_test.dart';
import 'package:esports_crystal/features/tournaments/list/models/tournament_model.dart';

void main(){
  test('When model functions called check their return', (){
    Tournament tournament = Tournament.fromMap({
      'name':'Worlds',
      'id':43513,
    });
    expect(tournament.id, 43513);
    expect(tournament.toMap(), {
      'name':'Worlds',
      'id':43513,
    });
  });
}