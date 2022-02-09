
import 'package:esports_crystal/features/tournaments/details/models/standings_row.dart';

class Standings {
  // Construct the standing object
  Standings({
    required this.id,
    required this.name,
    required this.type,
    required this.rows,
  });
  // Attributes
  String? name;
  String? type;
  int? id;
  List<StandingsRow>? rows;
  // convert to a map
  toMap(){
    return {
      'id':id,
      'name':name,
      'type':type,
      'rows':rows,
    };
  }
  // construct from a map
  Standings.fromMap(Map data){
    id = data['id'];
    name = data['name'];
    type = data['type'];
    rows = data['rows'];
  }
}
