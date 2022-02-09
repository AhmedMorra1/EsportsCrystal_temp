import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:esports_crystal/services/helper_methods.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:esports_crystal/services/notifications_helper.dart';

class SettingsController extends GetxController {
  late SharedPreferences prefs;

  var isInitialized = false.obs;

  /// Game Id
  // game id
  var gameId = '1571'.obs; //get from shared preferences
  // update game id
  updateGameId(String id) async {
    gameId.value = id;
    prefs.setString('MainGameId', id);
  }

  // get game id
  String? getGameId() {
    if (prefs.getString('MainGameId') != null) {
      return prefs.getString('MainGameId');
    } else {
      updateGameId(gameId.value);
      return prefs.getString('MainGameId');
    }
  }

  /// Schedule Notification Time Of Day
  var scheduleTimeOfDay = const TimeOfDay(hour: 10, minute: 00).obs; //from shared preferences

  setScheduleTime(TimeOfDay newTime) {
    scheduleTimeOfDay.value = newTime;
    prefs.setString('ScheduleNotificationTime', formatTimeOfDay(newTime));
    setScheduleNotification();
  }

  getScheduleTime() {
    if (prefs.getString('ScheduleNotificationTime') != null) {
      return stringToTimeOfDay(prefs.getString('ScheduleNotificationTime')!);
    } else {
      setScheduleTime(const TimeOfDay(hour: 10, minute: 00));
      return stringToTimeOfDay(prefs.getString('ScheduleNotificationTime')!);
    }
  }

  /// News Notification Time Of Day
  var newsTimeOfDay = const TimeOfDay(hour: 20, minute: 00).obs; //from shared preferences
  setNewsTime(TimeOfDay newTime) {
    newsTimeOfDay.value = newTime;
    prefs.setString('NewsNotificationTime', formatTimeOfDay(newTime));
    setNewsNotification();
  }

  getNewsTime() {
    if (prefs.getString('NewsNotificationTime') != null) {
      return stringToTimeOfDay(prefs.getString('NewsNotificationTime')!);
    } else {
      setNewsTime(const TimeOfDay(hour: 20, minute: 00));
      return stringToTimeOfDay(prefs.getString('NewsNotificationTime')!);
    }
  }

  /// Match Notifications
  // Minutes
  var minutes = 0.obs;
  // get Minutes
  int? getMinutes() {
    if (prefs.getInt('MatchNotificationsTime') != null) {
      return prefs.getInt('MatchNotificationsTime');
    } else {
      setMinutes(0);
      return prefs.getInt('MatchNotificationsTime');
    }
  }

  // set minutes
  setMinutes(double value) {
    prefs.setInt('MatchNotificationsTime', value.toInt());
    minutes.value = value.toInt();
  }

  setScheduleNotification() {
    NotificationsHelper.cancel(0);
    if (!DateTime.now().hour.isGreaterThan(scheduleTimeOfDay.value.hour)) {
      NotificationsHelper.showDailyScheduledNotifications(
        servingTime: DateTime(
          DateTime.now().year,
          DateTime.now().month,
          DateTime.now().day,
          scheduleTimeOfDay.value.hour,
          scheduleTimeOfDay.value.minute,
        ),
        id: 0,
        title: "Match Schedule",
        body: "Check Today's Match Schedule",
        payload: 'schedule',
      );
    } else {
      NotificationsHelper.showDailyScheduledNotifications(
        servingTime: DateTime(
          DateTime.now().year,
          DateTime.now().month,
          DateTime.now().add(const Duration(days: 1)).day,
          scheduleTimeOfDay.value.hour,
          scheduleTimeOfDay.value.minute,
        ),
        id: 0,
        title: "Match Schedule",
        body: "Check Today's Match Schedule",
        payload: 'schedule',
      );
    }
  }

  setNewsNotification() {
    NotificationsHelper.cancel(1);
    if (!DateTime.now().hour.isGreaterThan(scheduleTimeOfDay.value.hour)) {
      NotificationsHelper.showDailyScheduledNotifications(
        servingTime: DateTime(
          DateTime.now().year,
          DateTime.now().month,
          DateTime.now().day,
          newsTimeOfDay.value.hour,
          newsTimeOfDay.value.minute,
        ),
        id: 1,
        title: "News",
        body: "Check the latest Esports News",
        payload: 'news',
      );
    } else {
      NotificationsHelper.showDailyScheduledNotifications(
        servingTime: DateTime(
          DateTime.now().year,
          DateTime.now().month,
          DateTime.now().add(const Duration(days: 1)).day,
          newsTimeOfDay.value.hour,
          newsTimeOfDay.value.minute,
        ),
        id: 1,
        title: "News",
        body: "Check the latest Esports News",
        payload: 'news',
      );
    }
  }

  initNotificationAtFirstOpen() {
    if (prefs.getBool('scheduleNotification') == null) {
      setScheduleNotification();
      prefs.setBool('scheduleNotification', true);
    }
    if (prefs.getBool('newsNotification') == null) {
      setNewsNotification();
      prefs.setBool('newsNotification', true);
    }
  }

  initBeforeBuild() async {
    await NotificationsHelper.init(initScheduled: true);
    // 4- get schedule notification time
    scheduleTimeOfDay.value = getScheduleTime();
    // 5- get news notification time
    newsTimeOfDay.value = getNewsTime();
    // 6 - init first open
    initNotificationAtFirstOpen();
  }

  /// initiate values
  @override
  void onInit() async {
    // 1- Initiate a sharePreferences Instance
    prefs = await SharedPreferences.getInstance();
    // 2- set actual minutes value
    minutes.value = getMinutes()!;
    // 3- set actual game id value
    gameId.value = getGameId()!;
    super.onInit();
  }
}
