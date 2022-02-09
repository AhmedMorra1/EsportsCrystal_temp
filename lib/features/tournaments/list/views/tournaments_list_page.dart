import 'package:esports_crystal/configs/consts.dart';
import 'package:esports_crystal/features/tournaments/list/controllers/tournaments_list_controller.dart';
import 'package:esports_crystal/features/tournaments/list/views/tournament_list.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'title_row.dart';
import 'games_list_row.dart';
import 'package:get/get.dart';

class TournamentsListPage extends StatelessWidget {
  const TournamentsListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TournamentListController());
    controller.getTournamentList();
    return Scaffold(
      backgroundColor: kBackColor,
      body: SafeArea(
        child:
        Padding(
          padding: EdgeInsets.all(5.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              TournamentsTitleRow(),
              GameSelectRow(),
              TournamentList(),
            ],
          ),
        ),
      ),
    );
  }
}
