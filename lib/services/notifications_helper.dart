import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_native_timezone/flutter_native_timezone.dart';

class NotificationsHelper {
  NotificationsHelper._privateConstructor();
  static final NotificationsHelper instance = NotificationsHelper._privateConstructor();

  // get shared preferences
  static late SharedPreferences prefs;
  static int getMinutes() => prefs.getInt('MatchNotificationsTime') ?? 0;

  static final _notifications = FlutterLocalNotificationsPlugin();
  static final onNotifications = BehaviorSubject<String?>();

  static Future _notificationDetails() async {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'EC_CH0',
        'Esports Crystal CH0',
        channelDescription: 'Esports Crystal Notification Channel 0',
        importance: Importance.max,
        priority: Priority.high,
        playSound: true,
        enableVibration: true,
      ),
    );
  }

  static Future init({bool initScheduled = false}) async {
    const android = AndroidInitializationSettings('android_notification_icon');
    const iOS = IOSInitializationSettings();
    const settings = InitializationSettings(
      android: android,
      iOS: iOS,
    );
    await _notifications.initialize(settings, onSelectNotification: (payload) async {
      onNotifications.add(payload);
    });

    // initialize shared preferences
    prefs = await SharedPreferences.getInstance();

    if (initScheduled) {
      tz.initializeTimeZones();
      final locationName = await FlutterNativeTimezone.getLocalTimezone();
      tz.setLocalLocation(tz.getLocation(locationName));
    }
  }

  static Future showScheduledNotifications({
    required int id,
    required String title,
    required String body,
    required String payload,
    required DateTime servingTime,
  }) async {
    _notifications.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.from(servingTime, tz.local),
      await _notificationDetails(),
      payload: payload,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  static Future showDailyScheduledNotifications({
    int? id,
    String? title,
    String? body,
    String? payload,
    required DateTime servingTime,
  }) async =>
      _notifications.zonedSchedule(
        id!,
        title,
        body,
        _scheduleDaily(Time(servingTime.hour,servingTime.minute,servingTime.second)),
        await _notificationDetails(),
        payload: payload,
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time,
      );

  static tz.TZDateTime _scheduleDaily(Time time){
    final now = tz.TZDateTime.now(tz.local);
    final scheduledDate = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      time.hour,
      time.minute,
      time.second,
    );

    return scheduledDate.isBefore(now)
        ? scheduledDate.add(Duration(days: 1))
        : scheduledDate;
  }

  static void cancel(int id) => _notifications.cancel(id);

  static void cancelAll() => _notifications.cancelAll();
}
