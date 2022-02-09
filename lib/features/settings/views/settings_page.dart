import 'package:esports_crystal/configs/consts.dart';
import 'package:esports_crystal/features/settings/controllers/settings_controller.dart';
import 'package:esports_crystal/features/settings/views/main_game/main_game.dart';
import 'package:esports_crystal/features/settings/views/match_notifications.dart';
import 'package:esports_crystal/features/settings/views/schedule_notification.dart';
import 'package:esports_crystal/features/settings/views/title_row.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'news_notification.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SettingsController());
    controller.initBeforeBuild();
    return SafeArea(
        child: Scaffold(
          backgroundColor: kBackColor,
      body: Padding(
        padding: EdgeInsets.all(5.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TitleRow(),
            SizedBox(height:10.h),
            const MainGame(),
            SizedBox(height:2.h),
            const ScheduleNotification(),
            SizedBox(height:2.h),
            const NewsNotification(),
            SizedBox(height:2.h),
            const MatchNotification(),
          ],
        ),
      ),
    ));
  }
}
