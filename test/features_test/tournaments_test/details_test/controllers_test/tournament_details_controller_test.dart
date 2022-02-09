import 'package:esports_crystal/features/tournaments/details/controllers/tournament_detail_controller.dart';
import 'package:esports_crystal/features/tournaments/details/models/cup_tree.dart';
import 'package:esports_crystal/features/tournaments/details/models/cup_tree_round.dart';
import 'package:esports_crystal/features/tournaments/details/models/season.dart';
import 'package:esports_crystal/features/tournaments/details/models/standings.dart';
import 'package:esports_crystal/features/tournaments/list/models/tournament_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {

  final controller = Get.put(TournamentDetailController());

  test('When the controller_test is initiated test the default values', (){
    expect(controller.tournamentData.isEmpty, true);
    // standings
    expect(controller.standingsList.isEmpty,true);
    expect(controller.isLoadingStandings.value,false);
    expect(controller.selectedStandings.value,0);
    expect(controller.standingsRows.isEmpty,true);
    // cuptrees
    expect(controller.isLoadingCupTree.value,false);
    expect(controller.selectedCupTree.value,0);
    expect(controller.cupTreesList.isEmpty,true);
    expect(controller.selectedCupTreeRound.value,0);
    expect(controller.cupTreeRounds.isEmpty,true);
    // Last Matches
    expect(controller.results.isEmpty,true);
    expect(controller.isResultsLoading.value,false);
    expect(controller.resultsPageIndex.value,0);
    // Next Matches
    expect(controller.upcoming.isEmpty,true);
    expect(controller.isUpcomingLoading.value,false);
    expect(controller.upcomingPageIndex.value,0);
  });

  group('Basic Tournament Data', () {
    

    test('When change tournament data all data related is changes', () {
      expect(controller.logoUrl.value, 'https://divanscore.p.rapidapi.com/tournaments/get-logo');
      expect(controller.headers.isEmpty, true);
      var tournament = Tournament(id: 12,  name: 'Worlds');
      controller.setTournamentData(tournament: tournament);
      expect(controller.tournamentData, tournament.toMap());
      var updatedUrl = 'https://divanscore.p.rapidapi.com/tournaments/get-logo?tournamentId=${tournament.id.toString()}';
      expect(controller.logoUrl.value, updatedUrl);
      expect(controller.headers.isEmpty, false);
    });

  });

  group('Seasons Data', () {

    test('When controller_test is initialized check the default data related to seasons', () {
      expect(controller.seasons.isEmpty, true);
      expect(controller.selectedSeason.value, 0);
    });

    test('When seasons are updated check the changed data related to seasons', () {
      controller.seasons.value = [
        Season(name: '2021', id: 21, year: 2021),
        Season(name: '2020', id: 20, year: 2020),
        Season(name: '2019', id: 19, year: 2019),
      ];
      expect(controller.seasons.isNotEmpty, true);
      controller.changeSeason(season: controller.seasons[2]);
      expect(controller.selectedSeason.value, 2);
    });

  });

  group('Details Data', () {

    test('When changeDetail is called the detail type is changed ', () {
      expect(controller.selectedDetail.value, detailType.upcoming);
      controller.changeDetailType(detailType.standings);
      expect(controller.selectedDetail.value, detailType.standings);
    });

  });

  group('Standings Data', () {

    test('When standings are updated check the changed data related to standings', () {
      controller.standingsList.value = [
        Standings(id: 12, name: 'name', type: 'type', rows: []),
        Standings(id: 22, name: 'name', type: 'type', rows: []),
        Standings(id: 23, name: 'name', type: 'type', rows: []),
      ];
      expect(controller.standingsList.isNotEmpty, true);
      controller.changeStandings(standings: controller.standingsList[2]);
      expect(controller.selectedSeason.value, 2);
    });

  });

  group('CupTrees Data', () {

    test('When standings are updated check the changed data related to CupTrees', () {
      controller.cupTreesList.value = [
        CupTree(id: 12, name: 'Playoffs', currentRound: 2, rounds: [], type: 1),
        CupTree(id: 13, name: 'Playoffs', currentRound: 2, rounds: [], type: 1),
        CupTree(id: 14, name: 'Playoffs', currentRound: 2, rounds: [], type: 1),
      ];
      expect(controller.cupTreesList.isNotEmpty, true);
      controller.changeCupTree(cupTreeNumber: 2);
      expect(controller.selectedCupTree.value, 2);
    });

    test('When standings are updated check the changed data related to CupTrees Rounds', () {
      controller.cupTreeRounds.value = [
        CupTreeRound(id: 12, type: 1, blocks: [], description: 'description', order: 1),
        CupTreeRound(id: 13, type: 1, blocks: [], description: 'description', order: 1),
        CupTreeRound(id: 14, type: 1, blocks: [], description: 'description', order: 1),
      ];
      expect(controller.cupTreeRounds.isNotEmpty, true);
      controller.changeCupTreeRound(cupTreeNumberRound: 2);
      expect(controller.selectedCupTreeRound.value, 2);
    });

  });


}
