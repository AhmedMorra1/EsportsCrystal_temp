import 'package:esports_crystal/configs/consts.dart';
import 'package:esports_crystal/features/tournaments/details/models/standings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:esports_crystal/features/tournaments/details/controllers/tournament_detail_controller.dart';
import 'package:sizer/sizer.dart';

/// ( Tested )
class StandingsMenu extends StatelessWidget {
  const StandingsMenu({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TournamentDetailController());
    return SizedBox(
      height: 10.w,
      width: 84.w,
      child: DropdownButtonHideUnderline(
        child: Obx(
              () => DropdownButton(
            hint: Text('Standings'),
            value: controller.standingsList[controller.selectedStandings.value],
            onChanged: (newValue) {
              controller.changeStandings(standings: newValue);
            },
            items: controller.standingsList.map(buildMenuItem).toList(),
            isExpanded: true,
            dropdownColor: kFrontColor,
            iconEnabledColor: kPastColor,
            iconDisabledColor: kPastColor,
          ),
        ),
      ),
    );
  }

  DropdownMenuItem<Standings> buildMenuItem(Standings standings) {
    return DropdownMenuItem(
      value: standings,
      child: FittedBox(
        child: Text(
          standings.name!,
          style: TextStyle(fontSize: 4.w),
        ),
      ),
    );
  }
}
