import 'package:esports_crystal/features/tournaments/details/models/cup_participant.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  test('When model functions called check their return', (){
    CupParticipant cupParticipant = CupParticipant.fromMap({
      'id':122,
      'name':'name',
      'winner':true,
      'order':1,
    });
    expect(cupParticipant.order, 1);
    expect(cupParticipant.toMap(), {
      'id':122,
      'name':'name',
      'winner':true,
      'order':1,
    });
  });
}