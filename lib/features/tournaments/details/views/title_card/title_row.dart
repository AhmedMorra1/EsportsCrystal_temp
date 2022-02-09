import 'package:esports_crystal/configs/consts.dart';
import 'package:esports_crystal/features/tournaments/details/controllers/tournament_detail_controller.dart';
import 'package:esports_crystal/features/tournaments/details/views/title_card/seasons_menu.dart';
import 'package:esports_crystal/features/tournaments/list/models/tournament_model.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'logo.dart';
import 'title.dart';
import 'package:get/get.dart';

class TitleRow extends StatelessWidget {
  const TitleRow({Key? key, required this.tournament}) : super(key: key);
  final Tournament tournament;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TournamentDetailController());
    return Container(
      width: 90.w,
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
          color: kFrontColor,//Colors.grey.shade900,
          borderRadius:
          BorderRadius.circular(2.w)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Obx(()=>Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TournamentTitle(tournament: tournament,),
              controller.isLoadingSeasons.value ? SizedBox(): (controller.seasons.isNotEmpty ? SeasonsMenu() : SizedBox()),
            ],
          )),
          TournamentLogo(),
        ],
      ),
    );
  }
}
