import 'package:esports_crystal/configs/consts.dart';
import 'package:esports_crystal/features/tournaments/details/models/season.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:esports_crystal/features/tournaments/details/controllers/tournament_detail_controller.dart';
import 'package:sizer/sizer.dart';

class SeasonsMenu extends StatelessWidget {
  const SeasonsMenu({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TournamentDetailController());
    return SizedBox(
      height: 10.w,
      width: 60.w,
      child: DropdownButtonHideUnderline(
        child: Obx(
          () => DropdownButton(
            hint: Text('Seasons'),
            value: controller.seasons[controller.selectedSeason.value],
            onChanged: (newValue) {
              controller.changeSeason(season: newValue);
            },
            items: controller.seasons.map(buildMenuItem).toList(),
            isExpanded: true,
            dropdownColor: kFrontColor,
            iconEnabledColor: kPastColor,
            iconDisabledColor: kPastColor,
          ),
        ),
      ),
    );
  }

  DropdownMenuItem<Season> buildMenuItem(Season season) {
    return DropdownMenuItem(
      value: season,
      child: FittedBox(
        child: Text(
          season.name!,
          style: TextStyle(fontSize: 4.w),
        ),
      ),
    );
  }
}
