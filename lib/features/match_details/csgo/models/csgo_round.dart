class CSGORound{

  String? number;
  String? outcome;
  String? winnerCode;
  String? homeTeamSide;


  CSGORound({this.homeTeamSide,this.outcome,this.winnerCode,this.number,});

  CSGORound.fromMap(Map data){
    outcome = data['outcome'];
    winnerCode = data['winnerCode'];
    homeTeamSide = data['homeTeamSide'];
    number = data['number'].toString();
  }


  Map toMap(){
    return {
      'outcome': outcome,
      'winnerCode': winnerCode,
      'homeTeamSide': homeTeamSide,
      'number': number,
    };
  }


}