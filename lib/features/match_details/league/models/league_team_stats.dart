/// Game Details Class
class TeamStats {
  /// Construct the Game details Object
  TeamStats(
      {required this.kills,
      required this.dragons,
      required this.elders,
      required this.gold,
      required this.inhibitors,
      required this.barons,
      required this.towers,
      });

  /// construct the object from a map
  TeamStats.fromMap(Map data) {
    kills = data['Kill'] != null ? data['Kill'] as int : 0;
    dragons = data['Dragon'] != null ? data['Dragon'] as int : 0;
    gold = data['Gold'] != null ? data['Gold'] as int : 0;
    inhibitors =
        data['Inhibitor'] != null ? data['Inhibitor'] as int : 0;
    towers = data['Tower'] != null ? data['Tower'] as int : 0;
    elders =
        data['Elder'] != null ? data['Elder'] as int : 0;
    barons = data['Baron'] != null ? data['Baron'] as int : 0;
  }

  /// kills
  int? kills;

  /// game id
  int? dragons;

  /// game id
  int? gold;

  /// game id
  int? inhibitors;

  /// game id
  int? towers;

  /// game id
  int? elders;

  /// game id
  int? barons;



  /// convert the object to a map
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Kill': kills,
      'Gold': gold,
      'Tower': towers,
      'Dragon': dragons,
      'Baron': barons,
      'Elder': elders,
      'Inhibitor': inhibitors,
    };
  }
}
