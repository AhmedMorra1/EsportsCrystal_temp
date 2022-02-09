import 'package:esports_crystal/features/tournaments/details/models/cup_tree_round_block.dart';

class CupTreeRound {
  // Construct
  CupTreeRound({
    required this.id,
    required this.type,
    required this.blocks,
    required this.description,
    required this.order,
  });

  // Attributes
  int? order;
  String? description;
  List<CupTreeRoundBlock>? blocks;
  int? type;
  int? id;

  // convert to map
  toMap(){
    return {
      'id':this.id,
      'order':this.order,
      'description':this.description,
      'blocks':this.blocks,
      'type':this.type,
    };
  }

  // Construct from a map
  CupTreeRound.fromMap(Map data){
    this.id = data['id'];
    this.order = data['order'];
    this.description = data['description'];
    this.blocks = data['blocks'];
    this.type = data['type'];
  }
}
