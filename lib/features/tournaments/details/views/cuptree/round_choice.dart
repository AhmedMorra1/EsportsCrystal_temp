import 'package:esports_crystal/configs/consts.dart';
import 'package:esports_crystal/features/tournaments/details/controllers/tournament_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:esports_crystal/services/analytics_helper.dart';
import 'package:sizer/sizer.dart';

/// Tested
class RoundChoice extends StatelessWidget {
  const RoundChoice({
    Key? key,
    required this.roundName,required this.roundNumber,
  }) : super(key: key);

  final String roundName;
  final int roundNumber;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TournamentDetailController());
    return Padding(
      padding: EdgeInsets.only(right: 5.w),
      child: Obx(() => ChoiceChip(
        label: Text(
          roundName,
          style: TextStyle(
            color: controller.selectedCupTreeRound.value ==  roundNumber ? Colors.white : kPastColor ,
            fontSize: 4.w,
          ),
        ),
        selected: controller.selectedCupTreeRound.value ==  roundNumber   ? true : false,
        onSelected: (bool selected) {
          controller.changeCupTreeRound(cupTreeNumberRound: roundNumber);
          logEvent(
            event: 'round_selected',
            parameters: {'roundType': roundName},
          );
        },
        selectedColor: kSelectedColor,
        backgroundColor: kFrontColor,
      )),
    );
  }
}
