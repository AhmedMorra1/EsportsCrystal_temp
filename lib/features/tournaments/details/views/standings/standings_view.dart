import 'package:esports_crystal/configs/consts.dart';
import 'package:esports_crystal/features/tournaments/details/views/standings/standings_row_view.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:esports_crystal/features/tournaments/details/controllers/tournament_detail_controller.dart';
import 'package:esports_crystal/features/tournaments/details/views/standings/standings_menu.dart';
import 'package:get/get.dart';

/// ( Tested what is inside it )
class StandingsView extends StatelessWidget {
  const StandingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TournamentDetailController());
    return Container(
      padding: EdgeInsets.only(bottom:2.w,top:2.w),
      decoration: BoxDecoration(
          color: kFrontColor,//Colors.grey.shade900,
          borderRadius:
          BorderRadius.circular(2.w)),
      child: Column(
        children: [
          StandingsMenu(),
          StandingsRowTitle(),
          Obx(()=>Column(children: List.generate(controller.standingsRows.length, (index) =>
              StandingsRowView(standingsRow: controller.standingsRows[index])
          ),)),
        ],
      ),
    );
  }
}
