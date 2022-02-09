import 'package:esports_crystal/configs/consts.dart';
import 'package:esports_crystal/features/settings/controllers/settings_controller.dart';
import 'package:esports_crystal/services/analytics_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class GameIconChoice extends StatelessWidget {
  const GameIconChoice({Key? key, required this.gameName, required this.gameId}) : super(key: key);
  final String gameName;
  final String gameId;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SettingsController());
    return InkWell(
      onTap: (){
        controller.updateGameId(gameId);
        logEvent(
          event: 'main_game_selected',
          parameters: {'gameId': gameId},
        );
      },
      child: Obx(()=>Container(
        height: 5.h,
        width: 5.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2.w),
          color: controller.gameId.value == gameId ? kSelectedColor : kFrontColor,
        ),
        child: Padding(
          padding: EdgeInsets.all(1.h),
          child: Image.asset(kGameIcons[gameId],),
        ),
      )),
    );
  }
}