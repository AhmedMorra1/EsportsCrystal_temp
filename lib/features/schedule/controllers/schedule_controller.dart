import 'package:esports_crystal/features/schedule/services/schedule_api_helper.dart';
import 'package:esports_crystal/features/settings/controllers/settings_controller.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScheduleController extends GetxController{
  static final Dio _dio = Dio();
  final ScheduleAPIHelper scheduleAPIHelper = ScheduleAPIHelper(dio: _dio);
  final settingsController = Get.put(SettingsController());
  /// Date Row (Tested)
  var selectedDateText = 'Today'.obs;
  var selectedDate = DateTime.now().obs ;

  updateSelectedDate(DateTime dateTime){
    selectedDate.value = dateTime;
  }

  updateSelectedDateText(String dateTimeText) async{
    selectedDateText.value = dateTimeText;
    await refreshDayMatches();
  }

  String getGameId() => settingsController.gameId.value;

  /// Game Row (Tested)
  var gameId = '1571'.obs;

  updateGameId(String id) async{
    gameId.value = id;
   await  refreshDayMatches();
  }

  /// Schedule List
  // is the list loading?
  var isLoading = false.obs;
  // tournaments map from api
  var todaysTournaments = {}.obs;
  // tournaments names list
  var tournaments = [].obs;



  /// get the matches list for a specific date and game (Tested Separately)
  Future<String> refreshDayMatches() async {
    try {
      isLoading.value = true;
      final Map todaysMatches = await scheduleAPIHelper.getDayTournamentsMatches(
          gameCode: gameId.value, day: selectedDate.value.toString().substring(0, 10));
      todaysTournaments.value = todaysMatches;
      tournaments.value = [];
      todaysTournaments.forEach((key, value) {
        tournaments.add(key);
      });
      isLoading.value = false;
      return 'Success';
    }finally{
      return 'Failure';
    }

  }


  @override
  void onInit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.getString('MainGameId') != null){
      updateGameId(prefs.getString('MainGameId')!);
    }else{
      prefs.setString('MainGameId','1571');
      updateGameId(prefs.getString('MainGameId')!);
    }
    super.onInit();
  }
}