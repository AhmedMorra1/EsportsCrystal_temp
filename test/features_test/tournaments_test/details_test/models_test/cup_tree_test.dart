import 'package:esports_crystal/features/tournaments/details/models/cup_tree.dart';
import 'package:esports_crystal/features/tournaments/details/models/cup_tree_round.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  test('When model functions called check their return', (){
    CupTree cupTree = CupTree.fromMap({
      'id': 234,
      'name': 'name',
      'currentRound': 1,
      'rounds': <CupTreeRound>[],
      'type': 1,
    });
    expect(cupTree.id, 234);
    expect(cupTree.toMap(), {
      'id': 234,
      'name': 'name',
      'currentRound': 1,
      'rounds': <CupTreeRound>[],
      'type': 1,
    });
  });
}