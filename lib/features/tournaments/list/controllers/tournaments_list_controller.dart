import 'package:dio/dio.dart';
import 'package:esports_crystal/features/settings/controllers/settings_controller.dart';
import 'package:esports_crystal/features/tournaments/list/models/tournament_model.dart';
import 'package:esports_crystal/features/tournaments/list/services/tournaments_api_helper.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TournamentListController extends GetxController {
  final Dio _dio = Dio();
  final settingsController = Get.put(SettingsController());
  /// Games Row
  // game id
  var gameId = '1571'.obs;
  String getGameId() => settingsController.gameId.value;
  // change game id
  changeGameId({required String theGameId}) {
    gameId.value = theGameId;
    getTournamentList();
  }

  // tournament list
  var tournamentList = <Tournament>[].obs;
  // is there aan api request open for the list
  var isLoadingTournamentList = false.obs;
  // get the tournament list
  getTournamentList() async {
    isLoadingTournamentList.value = true;
    tournamentList.value = await TournamentsAPIHelper(dio: _dio).getTournamentList(gameId: gameId.value);
    isLoadingTournamentList.value = false;
  }

  @override
  void onInit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.getString('MainGameId') != null){
      changeGameId( theGameId: prefs.getString('MainGameId')!);
    }else{
      prefs.setString('MainGameId','1571');
      changeGameId( theGameId: prefs.getString('MainGameId')!);
    }
    super.onInit();
  }


}
