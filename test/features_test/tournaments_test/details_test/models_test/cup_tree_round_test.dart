import 'package:esports_crystal/features/tournaments/details/models/cup_tree_round.dart';
import 'package:esports_crystal/features/tournaments/details/models/cup_tree_round_block.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  test('When model functions called check their return', (){
    CupTreeRound cupTreeRound = CupTreeRound.fromMap({
      'id':122,
      'order':1,
      'description':'Semifinals',
      'blocks':<CupTreeRoundBlock>[],
      'type':1,
    });
    expect(cupTreeRound.description, 'Semifinals');
    expect(cupTreeRound.toMap(), {
      'id':122,
      'order':1,
      'description':'Semifinals',
      'blocks':<CupTreeRoundBlock>[],
      'type':1,
    });
  });
}