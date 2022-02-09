import 'package:esports_crystal/features/match_details/dota/models/dota_game_details.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:esports_crystal/features/match_details/csgo/controllers/csgo_controller.dart';

void main() {
  group('CSGO Controller', () {

    final controller = Get.put(CSGOMatchGamesContoller());


    test('Check if the match data map is empty then populate it', () {
      expect(controller.matchData.isEmpty, true);
      controller.matchData['test']='test';
      expect(controller.matchData.isEmpty, false);
    });

    test('Check default values for stream link row',(){
      expect(controller.streamLink.value,'https://www.twitch.tv');
      expect(controller.isLoadingStreamLink.value,false);
    });

    test('Check default values for match games list_test row',(){
      expect(controller.matchGamesList, <GameDetails>[]);
      expect(controller.isLoadingMatchGamesList.value, false);
      expect(controller.selectedGameNumber.value, 0);
    });
    test('Check default values for Objective and Lineups list_test row',(){
      expect(controller.roundsData, {'normalTimeRounds':[],'overTimeRounds':[]});
      expect(controller.isLoadingPlayerData.value, false);
      expect(controller.lineUpRows, []);
      expect(controller.isLoadingRoundData.value, false);
    });
    /// test resitting everything
    test('Check Round Outcomes and Colors',(){
      controller.selectedGameNumber.value = 1;
      controller.isLoadingStreamLink.value = true;
      controller.matchData.value = {'fakeData':'Data that is fake'};
      controller.streamLink.value = 'fakestreamlink.com';
      // reset everything
      controller.resetEverything();
      // check
      expect(controller.selectedGameNumber.value,0);
      expect(controller.isLoadingStreamLink.value,false);
      expect(controller.matchData, {});
      expect(controller.streamLink.value,'https://www.twitch.tv');
    });

  });
}