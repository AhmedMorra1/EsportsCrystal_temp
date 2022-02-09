/// Game Details Class
class TeamStats {
  /// Construct the Game details Object
  TeamStats(
      {required this.kills,
        required this.barracksDestroyed,
        required this.towersDestroyed,
      });

  /// construct the object from a map
  TeamStats.fromMap(Map data) {
    kills = data['Kills'] != null ? data['Kills'] as int : 0;
    barracksDestroyed = data['Barracks'] != null ? data['Barracks'] as int : 0;
    towersDestroyed =
        data['Towers'] != null ? data['Towers'] as int : 0;
  }

  /// barracksDestroyed
  int? barracksDestroyed;

  /// kills
  int? kills;

  /// towersDestroyed
  int? towersDestroyed;




  /// convert the object to a map
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Kills': kills,
      'Towers': towersDestroyed,
      'Barracks': barracksDestroyed,
    };
  }
}
