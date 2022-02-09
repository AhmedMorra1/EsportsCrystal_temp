
import 'package:esports_crystal/features/tournaments/details/controllers/tournament_detail_controller.dart';
import 'package:esports_crystal/features/tournaments/details/views/matches/list_of_matches.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MatchesView extends StatelessWidget {
  const MatchesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TournamentDetailController());
    return Column(
      children: [
        Obx(
          () => ListOfMatches(
            isUpcoming: controller.selectedDetail.value == detailType.upcoming,
          ),
        ),
      ],
    );
  }
}
