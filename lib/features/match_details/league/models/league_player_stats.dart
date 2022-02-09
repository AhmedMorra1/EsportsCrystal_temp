/// Player Details Class
class PlayerDetails {
  /// Construct the Player details object
  PlayerDetails({
    required this.character,
    required this.role,
    required this.name,
    required this.assists,
    required this.deaths,
    required this.kills,
    required this.level,
    required this.minions,
    required this.gold,
  });

  /// construct the object from a map
  PlayerDetails.fromMap(Map<String,dynamic> data){
    character = data['character'];
    role = data['role'];
    name = data['name'];
    assists = data['assists'];
    deaths = data['deaths'];
    kills = data['kills'];
    level = data['level'];
    minions = data['minions'];
    gold = data['gold'];
  }

  String? character;

  String? role;

  String? name;

  int? assists;

  int? deaths;

  int? kills;

  int? level;

  int? minions;

  int? gold;

  /// return a map of the object data
  Map<String,dynamic> toMap(){
    return {
      'character':character,
      'role':role,
      'name':name,
      'assists':assists,
      'deaths':deaths,
      'kills':kills,
      'level':level,
      'minions':minions,
      'gold':gold,
    };
  }


}
