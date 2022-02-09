import 'package:esports_crystal/configs/consts.dart';
import 'package:esports_crystal/features/tournaments/details/controllers/tournament_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:esports_crystal/services/analytics_helper.dart';
import 'package:sizer/sizer.dart';

///Tested
class DetailChoice extends StatelessWidget {
  const DetailChoice({
    Key? key,
    required this.detailName, this.detailType,
  }) : super(key: key);

  final String detailName;
  final detailType;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TournamentDetailController());
    return Obx(() => ChoiceChip(
      label: Text(
        detailName,
        style: TextStyle(
          color: controller.selectedDetail.value ==  detailType ? Colors.white : kPastColor ,
          fontSize: 4.w,
        ),
      ),
      selected: controller.selectedDetail.value ==  detailType   ? true : false,
      onSelected: (bool selected) {
        controller.changeDetailType(detailType);
        logEvent(
          event: 'detail_selected',
          parameters: {'detailType': detailType.toString()},
        );
        //print(detailType.toString());
      },
      selectedColor: kSelectedColor,
      backgroundColor: kFrontColor,
    ));
  }
}
