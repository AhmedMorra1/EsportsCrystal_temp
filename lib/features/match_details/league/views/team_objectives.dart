import 'dart:math' as math;
import 'package:esports_crystal/configs/consts.dart';
import 'package:esports_crystal/configs/size_config.dart';
import 'package:esports_crystal/helper_widgets/breather.dart';
import 'package:esports_crystal/helper_widgets/text_divider.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:esports_crystal/helper_widgets/progress_bar.dart';

/// Game Teams Objectives
class GameTeamObjectives extends StatelessWidget {
  /// Construct the widget with the data
  const GameTeamObjectives({Key? key, required this.objectivesRowsData, required this.homeTeamSide})
      : super(key: key);
  final List objectivesRowsData;
  final String homeTeamSide;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    print(objectivesRowsData);
    return objectivesRowsData[1]['homeObjectiveData'] != 0 ? Column(
      children: [
        TextDivider(text: 'Objectives'),
        Breather(
          h: 3,
        ),
        Container(
          height: SizeConfig.safeBlockVertical! * 40,
          width: SizeConfig.safeBlockHorizontal! * 90,
          decoration: BoxDecoration(
            color: kFrontColor,//Colors.grey.shade900,
            borderRadius: BorderRadius.all(
              Radius.circular(SizeConfig.safeBlockHorizontal! * 3),
            ),
          ),
          child: Column(
            children: List.generate(
              objectivesRowsData.length,
              (index) {
                return TeamObjectivesRow(
                objective: objectivesRowsData[index]['objective'],
                homeObjectiveData:
                    objectivesRowsData[index]['homeObjectiveData'],
                awayObjectiveData:
                    objectivesRowsData[index]['redObjectiveData'],
                homeTeamSide: homeTeamSide,
              );},
            ),
          ),
        ),
      ],
    ):SizedBox();
  }
}

/// Team Composition Row
class TeamObjectivesRow extends StatelessWidget {
  /// Construct team Composition Row
  const TeamObjectivesRow(
      {Key? key,
      required this.objective,
      required this.homeObjectiveData,
      required this.awayObjectiveData, required this.homeTeamSide,})
      : super(key: key);

  /// blue side champion name
  final int homeObjectiveData;

  /// red side champion name
  final int awayObjectiveData;

  /// position on the map or rule in the game
  final String objective;

  final String homeTeamSide;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final total = homeObjectiveData + awayObjectiveData;
    final homePercent = homeObjectiveData / total;
    final awayPercent = awayObjectiveData / total;
    final homeObjective = objective == 'Gold' ? (homeObjectiveData/1000).toStringAsFixed(1)+'k' : homeObjectiveData.toString();
    final awayObjective = objective == 'Gold' ? (awayObjectiveData/1000).toStringAsFixed(1)+'k' : awayObjectiveData.toString();
    return Column(
      children: [
        SizedBox(
          height: SizeConfig.safeBlockVertical! * 5,
          child: Row(
            children: [
              SizedBox(
                width: SizeConfig.safeBlockHorizontal! * 36,
                child: Center(
                  child: Text(
                    homeObjective,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: SizeConfig.safeBlockHorizontal! * 4,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: SizeConfig.safeBlockHorizontal! * 18,
                child: Center(
                  child: Text(
                    objective,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: kPastColor,//Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: SizeConfig.safeBlockHorizontal! * 4,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: SizeConfig.safeBlockHorizontal! * 36,
                child: Center(
                  child: Text(
                    awayObjective.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: SizeConfig.safeBlockHorizontal! * 4,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(math.pi),
              child: ProgressBar(
                height: SizeConfig.safeBlockVertical! * .5,
                width: SizeConfig.safeBlockHorizontal! * 40,
                baseColor: kPastColor.withOpacity(.2),//Theme.of(context).backgroundColor,
                progressColor: homeTeamSide == 'blue' ? Colors.blue : Colors.red,
                percentage: homePercent,
              ),
            ),
            ProgressBar(
                height: SizeConfig.safeBlockVertical! * .5,
                width: SizeConfig.safeBlockHorizontal! * 40,
                baseColor: kPastColor.withOpacity(.2),//Theme.of(context).backgroundColor,
                progressColor: homeTeamSide != 'blue' ? Colors.blue : Colors.red,
                percentage: awayPercent),
          ],
        ),
      ],
    );
  }
}


class GameTeamObjectivesShimmer extends StatelessWidget {
  const GameTeamObjectivesShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        child: Container(
          height: SizeConfig.safeBlockVertical! * 40,
          width: SizeConfig.safeBlockHorizontal! * 90,
          decoration: BoxDecoration(
            color: kFrontColor,//Colors.grey.shade900,
            borderRadius: BorderRadius.all(
              Radius.circular(SizeConfig.safeBlockHorizontal! * 3),
            ),
          ),
        ),
        baseColor: kBackColor,
        highlightColor: kFrontColor,);
  }
}
