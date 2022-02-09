import 'package:esports_crystal/features/tournaments/list/controllers/tournaments_list_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main(){

  final controller = Get.put(TournamentListController());

  test('Check for if the api is loading', (){
    expect(controller.isLoadingTournamentList.value, false);
  });

  test('When change the game id the game id changes :D haha', (){
    expect(controller.gameId.value, '1571');
    controller.changeGameId(theGameId: '1572');
    expect(controller.gameId.value, '1572');
  });

  test('When the controller_test is initialized the tournament list should be empty', (){
    expect(controller.tournamentList.isEmpty, true);
  });

}

/// shared preferences loading make the test fail