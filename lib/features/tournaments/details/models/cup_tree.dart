
import 'package:esports_crystal/features/tournaments/details/models/cup_tree_round.dart';

class CupTree {

  // Constructor
  CupTree({
    required this.id,
    required this.name,
    required this.currentRound,
    required this.rounds,
    required this.type,
  });

  // Attributes
  int? id;
  String? name;
  int? currentRound;
  List<CupTreeRound>? rounds;
  int? type;

  // Convert to map
  toMap() {
    return {
      'id': id,
      'name': name,
      'currentRound': currentRound,
      'rounds': rounds,
      'type': type,
    };
  }

  // construct from a map
  CupTree.fromMap(Map data) {
    this.id = data['id'];
    this.name = data['name'];
    this.currentRound = data['currentRound'];
    this.rounds = data['rounds'];
    this.type = data['type'];
  }
}
