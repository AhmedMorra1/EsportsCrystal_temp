import 'package:esports_crystal/configs/consts.dart';
import 'package:esports_crystal/features/tournaments/list/views/tournament_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:esports_crystal/features/tournaments/list/controllers/tournaments_list_controller.dart';
import 'package:sizer/sizer.dart';

class TournamentList extends StatelessWidget {
  const TournamentList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TournamentListController());
    return Expanded(
      child: Obx(() => Center(
            child: controller.isLoadingTournamentList.value
                ? CircularProgressIndicator(
                    color: kFrontColor,
                  )
                : (controller.tournamentList.isEmpty
                    ? Text(
                        'Connection Error!\nPlease Try Again Later',
                        style: TextStyle(color: kPastColor, fontSize: 4.w),
                      )
                    : ListView(
                        children: List.generate(
                            controller.tournamentList.length,
                            (index) => TournamentCard(
                                  tournament: controller.tournamentList[index],
                                  gameCode: controller.gameId.value,
                                )),
                      )),
          )),
    );
  }
}
