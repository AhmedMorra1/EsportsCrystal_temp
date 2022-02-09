import 'package:esports_crystal/features/tournaments/details/models/cup_participant.dart';

class CupTreeRoundBlock{

  // Construct
  CupTreeRoundBlock({
    this.blockId,
    this.finished,
    this.matchesInRound,
    this.order,
    this.result,
    this.homeTeamScore,
    this.awayTeamScore,
    this.participants,
    this.hasNextRoundLink,
    this.eventInProgress,
    this.id,
    this.events,
    this.seriesStartDateTimestamp,
    this.automaticProgression,
});

  // Attributes
  int? blockId;
  bool? finished;
  int? matchesInRound;
  int? order;
  String? result;
  String? homeTeamScore;
  String? awayTeamScore;
  List<CupParticipant>? participants;
  bool? hasNextRoundLink;
  bool? eventInProgress;
  int? id;
  List? events;
  int? seriesStartDateTimestamp;
  bool? automaticProgression;

  // convert to map
  toMap(){
    return {
      'blockId':blockId,
      'finished':finished,
      'matchesInRound':matchesInRound,
      'order':order,
      'result':result,
      'homeTeamScore':homeTeamScore,
      'awayTeamScore':awayTeamScore,
      'participants':participants,
      'hasNextRoundLink':hasNextRoundLink,
      'eventInProgress':eventInProgress,
      'id':id,
      'events':events,
      'seriesStartDateTimestamp':seriesStartDateTimestamp,
      'automaticProgression':automaticProgression,
    };
  }

  // construct from a Map
  CupTreeRoundBlock.fromMap(Map data){
    blockId = data['blockId'];
    finished = data['finished'];
    matchesInRound = data['matchesInRound'];
    order = data['order'];
    result = data['result'];
    homeTeamScore = data['homeTeamScore'];
    awayTeamScore = data['awayTeamScore'];
    participants = data['participants'];
    hasNextRoundLink = data['hasNextRoundLink'];
    eventInProgress = data['eventInProgress'];
    id = data['id'];
    events = data['events'];
    seriesStartDateTimestamp = data['seriesStartDateTimestamp'];
    automaticProgression = data['automaticProgression'];
  }

}