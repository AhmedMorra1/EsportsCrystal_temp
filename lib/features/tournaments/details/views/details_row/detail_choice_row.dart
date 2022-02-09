import 'package:esports_crystal/features/tournaments/details/controllers/tournament_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'detail_choice.dart';
import 'package:get/get.dart';

///Tested
class DetailChoiceRow extends StatelessWidget {
  const DetailChoiceRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TournamentDetailController());
    return Padding(
      padding:
      EdgeInsets.all(2.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          DetailChoice(detailName: 'Upcoming',detailType: detailType.upcoming,),
          DetailChoice(detailName: 'Results',detailType: detailType.results,),
          DetailChoice(detailName: 'Standings',detailType: detailType.standings,),
        ],
      ),
    );
  }
}

