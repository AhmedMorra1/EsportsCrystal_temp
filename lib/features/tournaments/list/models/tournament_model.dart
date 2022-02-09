class Tournament {

  Tournament({
    required this.name,
    required this.id,
  });

  String? name;
  int? id;

  Tournament.fromMap(Map tournamentData){
    name = tournamentData['name'];
    id = tournamentData['id'];
  }

  Map toMap(){
    return {
      'name':name,
      'id':id,
    };
  }
}
