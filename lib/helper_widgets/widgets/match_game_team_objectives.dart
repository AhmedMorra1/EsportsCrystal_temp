import 'dart:math' as math;
import 'package:esports_crystal/configs/consts.dart';
import 'package:esports_crystal/configs/size_config.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:esports_crystal/helper_widgets/progress_bar.dart';

/// Game Teams Objectives
class GameTeamObjectives extends StatelessWidget {
  /// Construct the widget with the data
  const GameTeamObjectives({Key? key, required this.objectivesRowsData})
      : super(key: key);
  final List objectivesRowsData;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: SizeConfig.safeBlockVertical! * 40,
      width: SizeConfig.safeBlockHorizontal! * 90,
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.all(
          Radius.circular(SizeConfig.safeBlockHorizontal! * 3),
        ),
      ),
      child: Column(
        children: List.generate(
          objectivesRowsData.length,
          (index) => TeamObjectivesRow(
            objective: objectivesRowsData[index]['objective'],
            blueObjectiveData:
                int.parse(objectivesRowsData[index]['blueObjectiveData']),
            redObjectiveData:
                int.parse(objectivesRowsData[index]['redObjectiveData']),
          ),
        ),
      ),
    );
  }
}

/// Team Composition Row
class TeamObjectivesRow extends StatelessWidget {
  /// Construct team Composition Row
  const TeamObjectivesRow(
      {Key? key,
      required this.objective,
      required this.blueObjectiveData,
      required this.redObjectiveData})
      : super(key: key);

  /// blue side champion name
  final int blueObjectiveData;

  /// red side champion name
  final int redObjectiveData;

  /// position on the map or rule in the game
  final String objective;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final total = blueObjectiveData + redObjectiveData;
    final bluePercent = blueObjectiveData / total;
    final redPercent = redObjectiveData / total;
    return Column(
      children: [
        SizedBox(
          height: SizeConfig.safeBlockVertical! * 5,
          child: Row(
            children: [
              SizedBox(
                width: SizeConfig.safeBlockHorizontal! * 35,
                child: Center(
                  child: Text(
                    blueObjectiveData.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: SizeConfig.safeBlockHorizontal! * 4,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: SizeConfig.safeBlockHorizontal! * 20,
                child: Center(
                  child: Text(
                    objective,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: SizeConfig.safeBlockHorizontal! * 4,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: SizeConfig.safeBlockHorizontal! * 35,
                child: Center(
                  child: Text(
                    redObjectiveData.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: SizeConfig.safeBlockHorizontal! * 4,
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
                baseColor: Theme.of(context).backgroundColor,
                progressColor: Colors.blue,
                percentage: bluePercent,
              ),
            ),
            ProgressBar(
                height: SizeConfig.safeBlockVertical! * .5,
                width: SizeConfig.safeBlockHorizontal! * 40,
                baseColor: Theme.of(context).backgroundColor,
                progressColor: Colors.red,
                percentage: redPercent),
          ],
        ),
      ],
    );
  }
}

/// Team Composition Row
class TeamObjectivesHeraldsRow extends StatelessWidget {
  /// Construct team Composition Row
  const TeamObjectivesHeraldsRow(
      {Key? key,
      required this.objective,
      required this.blueObjectiveData,
      required this.redObjectiveData})
      : super(key: key);

  /// blue side champion name
  final String blueObjectiveData;

  /// red side champion name
  final String redObjectiveData;

  /// position on the map or rule in the game
  final String objective;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: SizeConfig.safeBlockVertical! * 4,
          child: Row(
            children: [
              SizedBox(
                width: SizeConfig.safeBlockHorizontal! * 38,
                child: Center(
                  child: Text(
                    blueObjectiveData,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        //fontWeight: FontWeight.bold,
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
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: SizeConfig.safeBlockHorizontal! * 38,
                child: Center(
                  child: Text(
                    redObjectiveData,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        //fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
            ],
          ),
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
            color: Colors.grey.shade900,
            borderRadius: BorderRadius.all(
              Radius.circular(SizeConfig.safeBlockHorizontal! * 3),
            ),
          ),
        ),
        baseColor: kBaseColor,
        highlightColor: kHighlightColor);
  }
}
