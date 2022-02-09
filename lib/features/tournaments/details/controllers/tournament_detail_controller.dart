import 'package:dio/dio.dart';
import 'package:esports_crystal/features/schedule/models/match_details.dart';
import 'package:esports_crystal/features/tournaments/details/models/cup_tree.dart';
import 'package:esports_crystal/features/tournaments/details/models/cup_tree_round.dart';
import 'package:esports_crystal/features/tournaments/details/models/season.dart';
import 'package:esports_crystal/features/tournaments/details/models/standings.dart';
import 'package:esports_crystal/features/tournaments/details/models/standings_row.dart';
import 'package:esports_crystal/features/tournaments/details/services/tournament_details_api_helper.dart';
import 'package:esports_crystal/features/tournaments/list/models/tournament_model.dart';
import 'package:get/get.dart';

class TournamentDetailController extends GetxController {
  // Dio Instance
  final Dio _dio = Dio();

  /// (Tested)
  // Tournament Data
  var tournamentData = {}.obs;
  // Logo URL
  var logoUrl = 'https://divanscore.p.rapidapi.com/tournaments/get-logo'.obs;
  // Logo Url Headers
  final headers = <String, String>{}.obs;
  // set Logo Data
  setLogoData() {
    logoUrl.value = 'https://divanscore.p.rapidapi.com/tournaments/get-logo?tournamentId=${tournamentData['id'].toString()}';
    headers.value = {'x-rapidapi-host': 'divanscore.p.rapidapi.com', 'x-rapidapi-key': '14fbb01d9cmsh8e7ac100fdc6b77p138390jsnda5f9d62181d'};
  }

  // game code
  var gameCode = ''.obs;
  setGameCode(String gameId){
    gameCode.value = gameId;
  }

  /// (Tested)
  // tournament seasons list
  var seasons = <Season>[].obs;
  // is their a request open for seasons?
  var isLoadingSeasons = false.obs;
  // get seasons list from the api helper
  getSeasons() async {
    isLoadingSeasons.value = true;
    seasons.value = await TournamentDetailApiHelper(dio: _dio).getSeasons(id: tournamentData['id']);
    isLoadingSeasons.value = false;
    resetDetail();
    // await getStandings();
    // standingsList.isEmpty ? changeDetailType(detailType.matches):null;
    // getCupTree();
  }

  // selected season
  var selectedSeason = 0.obs;
  // change selected season
  changeSeason({required var season}) async {
    selectedSeason.value = seasons.indexOf(season);
    resetDetail();
    // await getStandings();
    // standingsList.isEmpty ? changeDetailType(detailType.matches):null;
    // getCupTree();
  }

  var selectedDetail = detailType.upcoming.obs;
  changeDetailType(detailType) {
    selectedDetail.value = detailType;
  }

  resetDetail(){
    selectedDetail.value = detailType.upcoming;
    upcomingPageIndex.value = 0;
    resultsPageIndex.value = 0;
    getUpcoming();
  }
  /// (Tested)
  // standings list
  var standingsList = <Standings>[].obs;
  // is their a request open for standings?
  var isLoadingStandings = false.obs;
  // get standings list from the api helper
  getStandings() async {
    isLoadingStandings.value = true;
    standingsList.value = await TournamentDetailApiHelper(dio: _dio).getStandings(
      tournamentId: tournamentData['id'],
      seasonId: seasons[selectedSeason.value].id!,
    );
    standingsRows.value = standingsList.isNotEmpty ? standingsList[0].rows! : [];
    isLoadingStandings.value = false;
  }

  // selected Standings
  var selectedStandings = 0.obs;
  // change selected Standings
  changeStandings({required var standings}) {
    selectedStandings.value = standingsList.indexOf(standings);
    // change standings rows
    standingsRows.value = standings.rows;
  }

  // Standings Rows List
  var standingsRows = <StandingsRow>[].obs;

  /// ( Tested )
  // cupTrees list
  var cupTreesList = <CupTree>[].obs;
  // is their a request open for cup trees
  var isLoadingCupTree = false.obs;
  // get cupTrees List from the api helper
  getCupTree() async {
    isLoadingCupTree.value = true;
    cupTreesList.value = await TournamentDetailApiHelper(dio: _dio).getCupTree(
      tournamentId: tournamentData['id'],
      seasonId: seasons[selectedSeason.value].id!,
    );
    cupTreeRounds.value = cupTreesList.isNotEmpty ? cupTreesList[0].rounds! : [];
    isLoadingCupTree.value = false;
  }

  // selected Cup tree
  var selectedCupTree = 0.obs;
  // change selected Standings
  changeCupTree({required int cupTreeNumber}) {
    selectedCupTree.value = cupTreeNumber;
  }

  // cup tree rounds list
  var cupTreeRounds = <CupTreeRound>[].obs;
// selected Cup tree
  var selectedCupTreeRound = 0.obs;
  // change selected Standings
  changeCupTreeRound({required int cupTreeNumberRound}) {
    selectedCupTreeRound.value = cupTreeNumberRound;
  }

  /// Matches
  // check if it's next matches
  // var isUpcoming = true.obs;
  // // change type of matches
  // changeMatchesType(){
  //   isUpcoming.value = !isUpcoming.value;
  // }
  /// Last Matches
  // last matches list
  var results = <MatchDetails>[].obs;
  // is their a request open for last matches list?
  var isResultsLoading = false.obs;
  // page index for last matches
  var resultsPageIndex = 0.obs;
  // get last matches
  getResults() async {
    isResultsLoading.value = true;
    results.value = await TournamentDetailApiHelper(dio: _dio).getTournamentsLastMatches(tournamentId: tournamentData['id'],
        seasonId: seasons[selectedSeason.value].id!, pageIndex: resultsPageIndex.value);
    isResultsLoading.value = false;
  }
  // change page index
  nextPageResults(){
    resultsPageIndex.value = resultsPageIndex.value + 1;
    getResults();
  }
  // or
  previousPageResults(){
    resultsPageIndex.value = resultsPageIndex.value - 1;
    if(resultsPageIndex.value < 0){
      resultsPageIndex.value = 0;
    }
    getResults();
  }
  /// Next Matches
  // next matches list
  var upcoming = <MatchDetails>[].obs;
  // is their a request open for last matches list?
  var isUpcomingLoading = false.obs;
  // page index for last matches
  var upcomingPageIndex = 0.obs;
  // get last matches
  getUpcoming() async {
    print('Upcoming Page Index${upcomingPageIndex.value}');
    isUpcomingLoading.value = true;
    upcoming.value = await TournamentDetailApiHelper(dio: _dio).getTournamentsNextMatches(tournamentId: tournamentData['id'],
        seasonId: seasons[selectedSeason.value].id!, pageIndex: upcomingPageIndex.value);
    isUpcomingLoading.value = false;
  }
  // change page index
  nextPageUpcoming(){
    upcomingPageIndex.value = upcomingPageIndex.value + 1;
    getUpcoming();
  }
  // or
  previousPageUpcoming(){
    upcomingPageIndex.value = upcomingPageIndex.value - 1;
    if(upcomingPageIndex.value < 0){
      upcomingPageIndex.value = 0;
    }
    getUpcoming();
  }

  // set Basic Info
  setTournamentData({required Tournament tournament}) async {
    // set tournament data
    tournamentData.value = tournament.toMap();
    // set logo data
    setLogoData();
    // get tournament seasons
    await getSeasons();
  }
}

/// (Tested)
enum detailType {
  standings,
  upcoming,
  results,
}
