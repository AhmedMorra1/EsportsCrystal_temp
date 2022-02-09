import 'package:esports_crystal/configs/size_config.dart';
import 'package:esports_crystal/features/match_details/dota/controllers/dota_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:esports_crystal/services/analytics_helper.dart';
import 'package:esports_crystal/configs/consts.dart';

class GamesListRow extends StatelessWidget {
  const GamesListRow({Key? key,required this.gamesList,required this.selectedGameIndex}) : super(key: key);
  final List gamesList;
  final int selectedGameIndex;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final controller = Get.put(DotaMatchGamesContoller());
    return Container(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                gamesList.length,
                (index) => InkWell(
                  onTap: () {
                    logEvent(
                        event: 'match_game_selected',
                        parameters: {'gameId': '1570'});
                    controller.updateSelectedGameNumber(index);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: ChoiceChip(
                          label: Text(
                            '${index + 1}',
                            style: TextStyle(
                                color: selectedGameIndex ==
                                            index
                                        ? Colors.white
                                        : kPastColor.withOpacity(.7),
                                fontSize:
                                    SizeConfig.safeBlockHorizontal! *
                                        4),
                          ),
                          selected:
                          selectedGameIndex == index
                                  ? true
                                  : false,
                          onSelected: (bool selected) {
                            controller.updateSelectedGameNumber(index);
                            logEvent(
                                event: 'game_${index}_opened',
                                parameters: {'gameId': '1570'});
                          },
                          selectedColor: kSelectedColor,
                          backgroundColor: kFrontColor,
                        ),
                  ),
                ),
              ),
            ),

        );
  }
}

class GamesListShimmerRow extends StatelessWidget {
  const GamesListShimmerRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Shimmer.fromColors(
          baseColor: kBackColor,
          highlightColor: kFrontColor,
          child: Chip(
            label: Text(
              ' ',
              style: TextStyle(
                  color: kPastColor,
                  fontSize: SizeConfig.safeBlockHorizontal! * 4),
            ),
          ),
        ),
        Shimmer.fromColors(
          baseColor: kBackColor,
          highlightColor: kFrontColor,
          child: Chip(
            label: Text(
              ' ',
              style: TextStyle(
                  color: kPastColor,
                  fontSize: SizeConfig.safeBlockHorizontal! * 4),
            ),
          ),
        ),
        Shimmer.fromColors(
          baseColor: kBackColor,
          highlightColor: kFrontColor,
          child: Chip(
            label: Text(
              ' ',
              style: TextStyle(
                  color: kPastColor,
                  fontSize: SizeConfig.safeBlockHorizontal! * 4),
            ),
          ),
        ),
      ],
    );
  }
}
