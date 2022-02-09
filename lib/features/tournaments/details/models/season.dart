class Season {
  // Constructor
  Season({required this.id,required this.name,required this.year});
  // Attributes
  String? name;
  int? year;
  int? id;
  // convert into a map
  toMap(){
    return {
      'id':this.id,
      'name':this.name,
      'year':this.year,
    };
  }
  // construct from a map
  Season.fromMap(Map data){
    id = data['id'];
    name = data['name'];
    year = data['year'];
  }
}