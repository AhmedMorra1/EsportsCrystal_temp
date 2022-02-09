/// Game Details Class
class CSGOGameDetails {
  /// Construct the game details object
  CSGOGameDetails({
    required this.length,
    required this.status,
    required this.winnerCode,
    required this.map,
    required this.homeScore,
    required this.awayScore,
    required this.homeTeamStartingSide,
    required this.hasCompleteStatistics,
    required this.id,
    required this.startTimestamp,
  });

  /// construct the object from a map
  CSGOGameDetails.fromMap(Map data) {
    length = data['length'];
    status = data['status'];
    winnerCode = data['winnerCode'];
    map = data['map'];
    homeScore = data['homeScore'];
    awayScore = data['awayScore'];
    homeTeamStartingSide = data['homeTeamStartingSide'];
    hasCompleteStatistics = data['hasCompleteStatistics'];
    id = data['id'];
    startTimestamp = data['startTimestamp'];
  }

  /// Game Length in seconds
  var length;

  /// tournament name
  var status;

  /// Winner Code
  var winnerCode;

  /// map name
  var map;

  /// Home Teams Score
  var homeScore;

  /// Away Team Score
  var awayScore;

  /// starting side
  var homeTeamStartingSide;

  /// does the game has complete statistics?
  var hasCompleteStatistics;

  /// tournament name
  var id;

  /// tournament name
  var startTimestamp;


  /// return a map of the object data
  Map toMap() {
    return {
      'length': length,
      'status': status,
      'winnerCode': winnerCode,
      'map': map,
      'homeScore': homeScore,
      'awayScore': awayScore,
      'homeTeamStartingSide': homeTeamStartingSide,
      'hasCompleteStatistics': hasCompleteStatistics,
      'id': id,
      'startTimestamp': startTimestamp,
    };
  }
}
