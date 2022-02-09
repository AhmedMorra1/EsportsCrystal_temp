import 'package:dio/dio.dart';
import 'package:esports_crystal/features/bottom_navigator/controller/navigator_controller.dart';
import 'package:esports_crystal/features/bottom_navigator/views/bottom_navigator.dart';
import 'package:esports_crystal/features/news/controllers/news_controller.dart';
import 'package:esports_crystal/features/schedule/controllers/schedule_controller.dart';
import 'package:esports_crystal/features/schedule/models/match_details.dart';
import 'package:esports_crystal/features/schedule/views/schedule_view.dart';
import 'package:esports_crystal/features/settings/controllers/settings_controller.dart';
import 'package:esports_crystal/features/tournaments/details/controllers/tournament_detail_controller.dart';
import 'package:esports_crystal/services/analytics_helper.dart';
import 'package:esports_crystal/services/notifications_helper.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'features/match_details/csgo/controllers/csgo_controller.dart';
import 'features/match_details/csgo/views/details_view.dart';
import 'features/match_details/dota/controllers/dota_controller.dart';
import 'features/match_details/dota/views/details_view.dart';
import 'features/match_details/league/controllers/league_controller.dart';
import 'features/match_details/league/views/details_view.dart';
import 'services/api_helper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(App());
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  // Set default `_initialized` and `_error` state to false
  bool _initialized = false;
  bool _error = false;
  final Dio _dio = Dio();
  // Define an async function to initialize FlutterFire
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }
  final settingsController = Get.put(SettingsController());
  final sc = Get.put(ScheduleController());
  final bc = Get.put(NavigatorController());
  final nc = Get.put(NewsController());
  final lmgc = Get.put(LeagueMatchGamesContoller());
  final dmgc = Get.put(DotaMatchGamesContoller());
  final cmgc = Get.put(CSGOMatchGamesContoller());
  void listenNotifications() => NotificationsHelper.onNotifications.stream.listen(onClickedNotifications);
  /// what to do if notification clicked
  void onClickedNotifications(String? payload) async {
    if (payload != 'schedule'||payload != 'news'){
    MatchDetails details = await APIHelper(dio: _dio).getMatchDetails(matchId: payload);
    switch(details.gameCode){
      case '1571':
        Get.to(() => const BottomNavigator());
        bc.tabIndex(0);
        sc.gameId.value = '1571';
        sc.refreshDayMatches();
        lmgc.updateEveryThing(details);
        Get.to(() => LeagueMatchGamesDetailsView(matchDetails: details,));
        logEvent(event: 'notification_opened_game_details_1571');
        break;
      case '1570':
        Get.to(() => const BottomNavigator());
        bc.tabIndex(0);
        sc.gameId.value = '1570';
        sc.refreshDayMatches();
        dmgc.updateEveryThing(details);
        Get.to(() => DotaMatchGamesDetailsView(matchDetails: details,));
        logEvent(event: 'notification_opened_game_details_1571');
        break;
      case '1572':
        Get.to(() => const BottomNavigator());
        bc.tabIndex(0);
        sc.gameId.value = '1572';
        sc.refreshDayMatches();
        cmgc.updateEveryThing(details);
        Get.to(() => CSGOMatchGamesDetailsView(matchDetails: details,));
        logEvent(event: 'notification_opened_game_details_1571');
        break;
      case 'fail':
        Get.to(() => const BottomNavigator());
        sc.refreshDayMatches();
        logEvent(event: 'notification_opened_schedule');
        break;
    }}else if (payload == 'schedule'){
      Get.to(() => const BottomNavigator());
      sc.refreshDayMatches();
      logEvent(event: 'notification_opened_schedule');
    }
    else if (payload == 'news'){
      Get.to(() => const BottomNavigator());
      bc.tabIndex(3);
      nc.refreshNews();
      logEvent(event: 'notification_opened_news');
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    listenNotifications();
    NotificationsHelper.init(initScheduled: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Show error message if initialization failed
    if (_error) {
      return const SomethingWentWrong();
    }

    // Show a loader until FlutterFire is initialized
    if (!_initialized) {
      return const Loading();
    }

    return MyApp();
  }
}

class MyApp extends StatelessWidget {
  final FirebaseAnalytics analytics = FirebaseAnalytics();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Esports Crystal',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          brightness: Brightness.dark,
        ),
        home: const BottomNavigator(),
        navigatorObservers: [
          FirebaseAnalyticsObserver(analytics: analytics),
        ],
      );
    });
  }
}

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Esports Crystal',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
      ),
      home: const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

class SomethingWentWrong extends StatelessWidget {
  const SomethingWentWrong({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Esports Crystal',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
      ),
      home: const Scaffold(
        body: Center(
          child: Text(
            'Something Went Wrong\nPlease Restart The app.',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
