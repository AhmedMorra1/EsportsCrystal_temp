import 'package:esports_crystal/configs/consts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:esports_crystal/features/tournaments/list/controllers/tournaments_list_controller.dart';
import 'package:esports_crystal/services/analytics_helper.dart';
import 'package:sizer/sizer.dart';

///Tested
class GameChoice extends StatelessWidget {
  const GameChoice({
    Key? key,
    required this.gameName,
    required this.gameId,
  }) : super(key: key);

  final String gameName;
  final String gameId;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TournamentListController());
    return Obx(() => ChoiceChip(
          label: Text(
            gameName,
            style: TextStyle(
              color: controller.gameId.value == gameId ? Colors.white : kPastColor,
              fontSize: 4.w,
            ),
          ),
          selected: controller.gameId.value == gameId ? true : false,
          onSelected: (bool selected) {
            controller.changeGameId(theGameId: gameId);
            logEvent(
              event: 'game_selected_tournaments',
              parameters: {'gameId': gameId},
            );
          },
          selectedColor: kSelectedColor,
          backgroundColor: kFrontColor,
        ));
  }
}

class GameIconChoice extends StatelessWidget {
  const GameIconChoice({Key? key, required this.gameName, required this.gameId}) : super(key: key);
  final String gameName;
  final String gameId;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TournamentListController());
    return InkWell(
      onTap: (){
        controller.changeGameId(theGameId: gameId);
        logEvent(
          event: 'game_selected_match_details',
          parameters: {'gameId': gameId},
        );
      },
      child: Obx(()=>Container(
        height: 6.h,
        width: 6.h,
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

