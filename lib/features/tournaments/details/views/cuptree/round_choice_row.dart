import 'package:esports_crystal/features/tournaments/details/controllers/tournament_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'round_choice.dart';

/// Tested
class RoundChoiceRow extends StatelessWidget {
  const RoundChoiceRow({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TournamentDetailController());
    return Obx(() => Padding(
          padding: EdgeInsets.all(2.h),
          child: controller.isLoadingSeasons.value
              ? SizedBox()
              : (controller.isLoadingCupTree.value
                  ? SizedBox()
                  : (controller.cupTreeRounds.isEmpty
                      ? SizedBox()
                      : SingleChildScrollView(
            scrollDirection: Axis.horizontal,
                        child: Obx(() => Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: List.generate(
                                  controller.cupTreeRounds.length,
                                  (index) => Obx(() => RoundChoice(
                                        roundName: controller.cupTreeRounds[index].description!,
                                        roundNumber: index,
                                      ))),
                            )),
                      ))),
        ));
  }
}
