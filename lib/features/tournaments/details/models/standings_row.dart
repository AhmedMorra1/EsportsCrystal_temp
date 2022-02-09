class StandingsRow {
  // Construct the StandingRow Object
  StandingsRow({
    required this.id,
    required this.name,
    required this.position,
    required this.matches,
    required this.wins,
    required this.losses,
  });

  // Attributes
  String? name;
  int? position;
  int? matches;
  int? wins;
  int? losses;
  int? id;

  // convert to map
  toMap(){
    return {
      'id':id,
      'name':name,
      'position':position,
      'matches':matches,
      'wins':wins,
      'losses':losses,
    };
  }

  // Construct from a Map
  StandingsRow.fromMap(Map data){
    id = data['id'];
    name = data['name'];
    position = data['position'];
    matches = data['matches'];
    wins = data['wins'];
    losses = data['losses'];
  }
}
