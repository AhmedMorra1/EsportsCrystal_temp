import 'package:esports_crystal/configs/consts.dart';
import 'package:esports_crystal/features/tournaments/details/controllers/tournament_detail_controller.dart';
import 'package:esports_crystal/features/tournaments/details/views/cuptree/round_choice_row.dart';
import 'package:esports_crystal/features/tournaments/details/views/standings/standings_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../cuptree/block_card_list.dart';
import '../cuptree/cup_tree_title.dart';

class StandingPage extends StatelessWidget {
  const StandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TournamentDetailController());
    controller.getStandings();
    controller.getCupTree();
    return Obx(() => Column(
          children: [
            controller.isLoadingSeasons.value
                ? Center(
                    child: CircularProgressIndicator(
                      color: kPastColor,
                    ),
                  )
                : (controller.isLoadingStandings.value
                    ? SizedBox()
                    : (controller.standingsList.isNotEmpty
                        ? Column(
                            children: [
                              StandingsView(),
                            ],
                          )
                        : Padding(
                          padding: EdgeInsets.only(top: 15.h),
                          child: Center(
                              child: Text(
                                'No Standings Available',
                                style: TextStyle(
                                  color: kPastColor.withOpacity(.5),
                                  fontSize: 4.w,
                                ),
                              ),
                            ),
                        ))),
            SizedBox(
              height: 2.h,
            ),
            controller.isLoadingSeasons.value
                ? SizedBox()
                : (controller.isLoadingCupTree.value
                    ? SizedBox()
                    : (controller.cupTreeRounds.isNotEmpty
                        ? Column(
                            children: [
                              CupTreeStandingsTitle(
                                title: controller.cupTreesList[controller.selectedCupTree.value].name!,
                              ),
                              RoundChoiceRow(),
                              SizedBox(
                                height: 2.h,
                              ),
                              BlockCardList(
                                cupTreeRound: controller.cupTreesList[controller.selectedCupTree.value].rounds![controller.selectedCupTreeRound.value],
                              )
                            ],
                          )
                        : SizedBox())),
            SizedBox(
              height: 2.h,
            ),
          ],
        ));
  }
}
