/// Player Details Class
class PlayerDetails {
  /// Construct the Player details object
  PlayerDetails({
    required this.character,
    required this.name,
    required this.kills,
    required this.assists,
    required this.deaths,
    required this.goldPerMin,
    required this.heroLevel,
    required this.lastHits,
    required this.netWorth,
    required this.xpPerMin,
    required this.denies,
  });

  /// construct the object from a map
  PlayerDetails.fromMap(Map<String,dynamic> data){
    character = data['character'];
    name = data['name'];
    kills = data['kills'];
    assists = data['assists'];
    deaths = data['deaths'];
    goldPerMin = data['goldPerMin'];
    heroLevel = data['heroLevel'];
    lastHits = data['lastHits'];
    netWorth = data['netWorth'];
    xpPerMin = data['xpPerMin'];
    denies = data['denies'];
  }

  String? character;

  String? name;

  int? kills;

  int? assists;

  int? deaths;

  int? goldPerMin;

  int? heroLevel;

  int? lastHits;

  int? netWorth;

  int? xpPerMin;

  int? denies;


  /// return a map of the object data
  Map<String,dynamic> toMap(){
    return {
      'character':character,
      'name':name,
      'kills':kills,
      'assists':assists,
      'deaths':deaths,
      'goldPerMin':goldPerMin,
      'heroLevel':heroLevel,
      'lastHits':lastHits,
      'netWorth':netWorth,
      'xpPerMin':xpPerMin,
      'denies':denies,
    };
  }


}
