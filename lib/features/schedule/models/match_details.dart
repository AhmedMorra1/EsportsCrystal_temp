/// Match Details Class
class MatchDetails {
  /// Construct the match details object
  MatchDetails({
    required this.tournament,
    required this.tournamentId,
    required this.status,
    required this.homeTeam,
    required this.awayTeam,
    required this.id,
    required this.startTimestamp,
    required this.homeScore,
    required this.awayScore,
    required this.eventType,
    required this.bestOf,
    this.gameCode,
  });

  /// construct the object from a map
  MatchDetails.fromMap(Map<String,String> data){
    tournament = data['tournament'];
    status = data['status'];
    homeTeam = data['homeTeam'];
    awayTeam = data['awayTeam'];
    id = data['id'];
    startTimestamp = data['startTimestamp'];
    homeScore = data['homeScore'];
    awayScore = data['awayScore'];
    eventType = data['eventType'];
    bestOf = data['bestOf'];
    tournamentId = data['tournamentId'];
    gameCode = data['gameCode'];
  }

  /// tournament name
  String? tournament;

  /// tournament id
  String? tournamentId;

  /// game code
  String? gameCode;

  /// tournament name
  String? status;

  /// tournament name
  String? homeTeam;

  /// tournament name
  String? awayTeam;

  /// tournament name
  String? id;

  /// tournament name
  String? startTimestamp;

  /// home team score
  String? homeScore;

  /// away team score
  String? awayScore;

  /// match Type
  String? eventType;

  /// best of
  String? bestOf;

  /// return a map of the object data
  Map<String,String?> toMap(){
    return {
      'tournament':tournament,
      'status':status,
      'homeTeam':homeTeam,
      'awayTeam':awayTeam,
      'id':id,
      'startTimestamp':startTimestamp,
      'homeScore':homeScore,
      'awayScore':awayScore,
      'eventType':eventType,
      'bestOf':bestOf,
      'tournamentId':tournamentId,
      'gameCode':gameCode,
    };
  }


}
