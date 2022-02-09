import 'package:esports_crystal/features/tournaments/details/models/season.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  test('When model functions called check their return', (){
    Season season = Season.fromMap({
      'name':'Spring 2021',
      'id':43513,
      'year':2021,
    });
    expect(season.id, 43513);
    expect(season.toMap(), {
      'name':'Spring 2021',
      'id':43513,
      'year':2021,
    });
  });
}