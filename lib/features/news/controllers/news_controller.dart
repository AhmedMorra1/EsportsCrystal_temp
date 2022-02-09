import 'package:esports_crystal/features/news/services/news_api_helper.dart';
import 'package:esports_crystal/features/settings/controllers/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webfeed/webfeed.dart';
import 'package:esports_crystal/services/notifications_helper.dart';

class NewsController extends GetxController{
  static final Dio _dio = Dio();
  final NewsAPIHelper newsAPIHelper = NewsAPIHelper(dio: _dio);

  /// Game Row (Tested)
  var gameId = '1571'.obs;

  // dot esports links
  var dotLinks = {
    '1571':'https://dotesports.com/league-of-legends/feed',
    '1572':'https://dotesports.com/counter-strike/feed',
    '1570':'https://dotesports.com/dota-2/feed',
  };

  var feedLink = 'https://dotesports.com/league-of-legends/feed'.obs;

  updateGameId(String id) async{
    gameId.value = id;
    feedLink.value = dotLinks[gameId.value]!;
    await  refreshNews();
  }

  /// Feed
  // is the feed loading?
  var isLoading = false.obs;
  // rss feed
  var feed = RssFeed().obs;




  /// get the matches list for a specific date and game (Tested Separately)
  Future<Map<String,dynamic>> refreshNews() async {
    try {
      isLoading.value = true;
      feed.value = await newsAPIHelper.loadFeed(feedLink: feedLink.value);
      isLoading.value = false;
      return {'result': 'Success', 'data': feed.value};
    }catch (e){
      return {'result':'Failure'};
    }
  }


  /// update notification
  var notificationTime = const TimeOfDay(hour: 21, minute: 0).obs;
  updateNotificaiton(){
    NotificationsHelper.showScheduledNotifications(
      servingTime: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, notificationTime.value.hour, notificationTime.value.minute,),
      id: 0,
      title: 'News Time',
      body: 'Check the latest Esports news to stay updated.', payload: 'news',
    );
  }


  @override
  void onInit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.getString('MainGameId') != null){
      updateGameId(prefs.getString('MainGameId')!);
    }else{
      prefs.setString('MainGameId','1571');
      updateGameId( prefs.getString('MainGameId')!);
    }
    super.onInit();
  }

}