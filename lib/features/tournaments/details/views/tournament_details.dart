import 'package:esports_crystal/configs/consts.dart';
import 'package:esports_crystal/features/tournaments/details/controllers/tournament_detail_controller.dart';
import 'package:esports_crystal/features/tournaments/details/views/matches/matches_view.dart';
import 'package:esports_crystal/features/tournaments/details/views/standings/standing_page.dart';
import 'package:esports_crystal/features/tournaments/details/views/title_card/title_row.dart';
import 'package:esports_crystal/features/tournaments/list/models/tournament_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'details_row/detail_choice_row.dart';

class TournamentDetail extends StatelessWidget {
  const TournamentDetail({Key? key, required this.tournament, required this.gameCode}) : super(key: key);
  final String gameCode;
  final Tournament tournament;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TournamentDetailController());
    controller.setTournamentData(tournament: tournament);
    controller.setGameCode(gameCode);
    return Scaffold(
      backgroundColor: kBackColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(5.w),
          child: Obx(() => ListView(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(Icons.arrow_back),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  TitleRow(
                    tournament: tournament,
                  ),
                  DetailChoiceRow(),
              // controller.isLoadingSeasons.value ? SizedBox() :

                  if ((controller.selectedDetail.value == detailType.upcoming)&&controller.isLoadingSeasons.value!=true)
                    MatchesView()
                  else if ((controller.selectedDetail.value == detailType.results)&&controller.isLoadingSeasons.value!=true)
                    MatchesView()
                  else if ((controller.selectedDetail.value == detailType.standings)&&controller.isLoadingSeasons.value!=true)
                    StandingPage()
                ],
              )),
        ),
      ),
    );
  }
}
