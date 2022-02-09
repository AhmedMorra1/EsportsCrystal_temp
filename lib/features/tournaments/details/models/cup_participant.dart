class CupParticipant {
  // Construct
  CupParticipant({
    this.id,
    this.name,
    this.order,
    this.winner,
  });

  // Attributes
  String? name;
  bool? winner;
  int? order;
  int? id;

  // convert to map
  toMap(){
    return {
      'id':id,
      'name':name,
      'winner':winner,
      'order':order,
    };
  }

  // construct from a map
  CupParticipant.fromMap(Map data){
    id = data['id'];
    name = data['name'];
    winner = data['winner'];
    order = data['order'];
  }
  
}
