import 'package:esports_crystal/features/schedule/controllers/schedule_controller.dart';
import 'package:esports_crystal/features/schedule/views/tournament_card.dart';
import 'package:esports_crystal/features/settings/controllers/settings_controller.dart';
import 'package:esports_crystal/services/ad_helper.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:esports_crystal/configs/consts.dart';
import 'package:esports_crystal/configs/size_config.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:esports_crystal/features/schedule/views/date_select_row.dart';
import 'package:esports_crystal/features/schedule/views/game_select_row.dart';
import 'package:sizer/sizer.dart';

class ScheduleView extends StatelessWidget {
  const ScheduleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Instantiate your class using Get.put() to make it available for all "child" routes there.
    final sc = Get.put(ScheduleController());
    // final settingsController = Get.put(SettingsController());
    // settingsController.initNotificationAtFirstOpen();
    //final adController = Get.put(AdHelper());
    sc.refreshDayMatches();
    SizeConfig().init(context);
    return SafeArea(
        child: Scaffold(
      backgroundColor: kBackColor, //kBackGroundColor,
      body: Padding(
        padding: EdgeInsets.all(2.w),
        child: Center(
          child: Obx(() => Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // ElevatedButton(
                  //   child: Text('Test Page'),
                  //   onPressed: () {
                  //     Get.to(() => TournamentsListPage());
                  //   },
                  // ),

                  /// Date Select Row
                  const DateSelectRow(),

                  /// Game Select Row
                  const GameSelectRow(),
                  SizedBox(
                    height: SizeConfig.safeBlockHorizontal! * 4,
                  ),
                  if (sc.isLoading.value)
                    const Expanded(
                        child: Center(
                            child: CircularProgressIndicator(
                      color: kFrontColor,
                    )))
                  else
                    sc.tournaments.isEmpty
                        ? Expanded(
                            child: Center(
                              child: Text(
                                'No Matches Today',
                                style: TextStyle(
                                  color: kPastColor,
                                  fontSize: 4.w,
                                ),
                              ),
                            ),
                          )
                        : Expanded(
                            child: RefreshIndicator(
                              backgroundColor: kFrontColor,
                              color: kPastColor,
                              onRefresh: () {
                                return sc.refreshDayMatches();
                              },
                              child: Obx(
                                () => ListView.builder(
                                  itemCount: sc.tournaments.length,
                                  itemBuilder: (context, index) => sc.todaysTournaments[sc.tournaments[index]] != null
                                      ? TournamentCard(
                                          tournament: sc.tournaments[index],
                                          gameCode: sc.gameId.value,
                                          matchList: sc.todaysTournaments[sc.tournaments[index]],
                                          tournamentId: sc.todaysTournaments[sc.tournaments[index]][0].tournamentId,
                                        )
                                      : const SizedBox(),
                                ),
                              ),
                            ),
                          ),
                  // adController.isBottomBannerAdLoaded.value
                  //     ? Container(
                  //         height: adController.bottomBannerAd.size.height.toDouble(),
                  //         width: adController.bottomBannerAd.size.width.toDouble(),
                  //         child: AdWidget(
                  //           ad: adController.bottomBannerAd,
                  //         ),
                  //       )
                  //     : SizedBox(),
                ],
              )),
        ),
      ),
    ));
  }
}
