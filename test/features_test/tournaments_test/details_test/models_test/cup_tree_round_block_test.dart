import 'package:esports_crystal/features/tournaments/details/models/cup_participant.dart';
import 'package:esports_crystal/features/tournaments/details/models/cup_tree_round_block.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  test('When model functions called check their return', (){
    CupTreeRoundBlock cupTreeRoundBlock = CupTreeRoundBlock.fromMap({
      "blockId":1,
      "finished":true,
      "matchesInRound":1,
      "order":1,
      "result":"2:3",
      "homeTeamScore":"2",
      "awayTeamScore":"3",
      'participants':<CupParticipant>[],
      "hasNextRoundLink":true,
      "eventInProgress":false,
      "id":1441385,
      "events":[
        9896739,
      ],
      "seriesStartDateTimestamp":1634990400,
      "automaticProgression":false
    });
    expect(cupTreeRoundBlock.finished, true);
    expect(cupTreeRoundBlock.toMap(), {
      "blockId":1,
      "finished":true,
      "matchesInRound":1,
      "order":1,
      "result":"2:3",
      "homeTeamScore":"2",
      "awayTeamScore":"3",
      'participants':<CupParticipant>[],
      "hasNextRoundLink":true,
      "eventInProgress":false,
      "id":1441385,
      "events":[
        9896739,
      ],
      "seriesStartDateTimestamp":1634990400,
      "automaticProgression":false
    });
  });
}