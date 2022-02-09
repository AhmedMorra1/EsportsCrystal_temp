import 'package:esports_crystal/configs/consts.dart';
import 'package:esports_crystal/features/tournaments/details/views/tournament_details.dart';
import 'package:esports_crystal/features/tournaments/list/models/tournament_model.dart';
import 'package:esports_crystal/services/analytics_helper.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';

class TournamentCard extends StatelessWidget {
  const TournamentCard({
    Key? key,
    required this.tournament,
    required this.gameCode,
  }) : super(key: key);
  final Tournament tournament;
  final String gameCode;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          highlightColor: kFrontColor,
          splashColor: kFrontColor,
          onTap: () {
            logEvent(event: 'tournament_open', parameters: {
              'tournament': tournament.name,
            });
            Get.to(() => TournamentDetail(
                  tournament: tournament,
                  gameCode: gameCode,
                ));
          },
          child: SizedBox(
            width: 90.w,
            height: 4.h,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                tournament.name!,
                style: TextStyle(
                  fontSize: 4.w,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 90.w,
          height: 1.h,
          child: Divider(),
        ),
      ],
    );
  }
}
