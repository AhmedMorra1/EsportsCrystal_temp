/// Game Details Class
class GameDetails {
  /// Construct the game details object
  GameDetails({
    required this.status,
    required this.id,
    required this.homeTeamStartingSide,
    required this.startTimestamp,
    required this.hasCompleteStatistics,
  });

  /// construct the object from a map
  GameDetails.fromMap(Map<String,String> data){
    status = data['status'];
    id = data['id'];
    startTimestamp = data['startTimestamp'];
    homeTeamStartingSide = data['homeTeamStartingSide'];
    hasCompleteStatistics = data['hasCompleteStatistics'];
  }

  /// tournament name
  String? status;

  /// tournament name
  String? id;

  /// tournament name
  String? startTimestamp;

  /// starting side
  String? homeTeamStartingSide;

  /// does the game has complete statistics
  String? hasCompleteStatistics;

  /// return a map of the object data
  Map<String,String?> toMap(){
    return {
      'status':status,
      'id':id,
      'startTimestamp':startTimestamp,
      'homeTeamStartingSide':homeTeamStartingSide.toString(),
      'hasCompleteStatistics':hasCompleteStatistics,
    };
  }


}
