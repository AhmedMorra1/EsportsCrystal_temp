import 'package:flutter_test/flutter_test.dart';
import 'package:esports_crystal/features/schedule/controllers/schedule_controller.dart';
import 'package:get/get.dart';

void main() {
  group('Schedule Controller', () {

    final sc = Get.put(ScheduleController());

    /// Date selector row
    test('Selected Date Text is "Today"', () {
      expect(sc.selectedDateText.value, 'Today');
    });

    test('change Selected Date Text to "Tomorrow"', () {
      sc.updateSelectedDateText('Tomorrow');
      expect(sc.selectedDateText.value, 'Tomorrow');
    });

    test('Selected Date DateTime', (){
      expect(sc.selectedDate.value.toString().substring(0,10), DateTime.now().toString().substring(0,10));
    });

    test('change select date to tomorrow', () {
      sc.updateSelectedDate(DateTime.now().add(Duration(days: 1)));
      expect(sc.selectedDate.value.toString().substring(0,10),DateTime.now().add(Duration(days: 1)).toString().substring(0,10));
    });

    /// game selector row

    test('check game id',(){
      expect(sc.gameId.value,'1571');
    });

    test('check if game id updated',(){
      sc.updateGameId('1570');
      expect(sc.gameId.value,'1570');
    });


    /// Schedule List
    test('check if its not loading',(){
      sc.isLoading.value = false;
      expect(sc.isLoading.value,false);
    });

    test('check if its loading',(){
      sc.isLoading.value = true;
      expect(sc.isLoading.value,true);
    });

    test('check map of tournaments',(){
      expect(sc.todaysTournaments.isEmpty, true);
      sc.todaysTournaments['Tournament Name Example'] = 'Worlds 2021';
      expect(sc.todaysTournaments.isNotEmpty,true);
    });

    test('check list_test of tournaments',(){
      expect(sc.tournaments.isEmpty, true);
      sc.tournaments.add('Worlds 2021');
      expect(sc.tournaments.isNotEmpty,true);
    });

  });
}

/// shared preferences fail