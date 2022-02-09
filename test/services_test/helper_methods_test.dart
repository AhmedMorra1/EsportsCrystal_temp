import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:esports_crystal/services/helper_methods.dart';

void main(){
  test('When formatTimeOfDay() method is called it converts TimeOfDay Object to a string',(){
    expect(formatTimeOfDay(const TimeOfDay(hour: 06, minute: 00)), '6:00 AM');
  });

  test('When stringToTimeOfDay() method is called it converts string to a TimeOfDay Object',(){
    expect(stringToTimeOfDay('6:00 AM'), const TimeOfDay(hour: 06, minute: 00));
  });
}