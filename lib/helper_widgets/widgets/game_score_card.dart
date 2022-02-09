import 'package:esports_crystal/configs/consts.dart';
import 'package:esports_crystal/configs/size_config.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class GameScoreCard extends StatelessWidget {
  const GameScoreCard({
    Key? key,
    required this.homeTeamName,
    required this.awayTeamName,
    required this.homeTeamScore,
    required this.awayTeamScore,
    required this.homeTeamSide,
  }) : super(key: key);

  /// Teams and there scores
  final String homeTeamName;
  final String awayTeamName;
  final String homeTeamScore;
  final String awayTeamScore;
  final String homeTeamSide;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var h = SizeConfig.safeBlockVertical! * 7;
    var f = SizeConfig.safeBlockHorizontal! * 4;
    return Container(
      height: h,
      width: SizeConfig.safeBlockHorizontal! * 90,
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.all(
          Radius.circular(SizeConfig.safeBlockHorizontal! * 3),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: SizeConfig.safeBlockHorizontal! * 2,
          right: SizeConfig.safeBlockHorizontal! * 2,
          top: SizeConfig.safeBlockHorizontal! * 1,
          bottom: SizeConfig.safeBlockHorizontal! * 1,
        ),
        child: Row(
          children: [
            SizedBox(
              height: h,
              width: SizeConfig.safeBlockHorizontal! * 35,
              child: Center(
                child: Text(
                  homeTeamName,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: f,
                    fontWeight: FontWeight.bold,
                    color: homeTeamSide == 'blue' ? Colors.blue : Colors.red,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: SizeConfig.safeBlockHorizontal! * 5,
              height: h,
              child: Center(
                child: Text(
                  homeTeamScore,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: f,
                    fontWeight: FontWeight.bold,
                    color: int.parse(homeTeamScore) > int.parse(awayTeamScore)
                        ? Colors.white
                        : Colors.grey.shade600,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: h,
              width: SizeConfig.safeBlockHorizontal! * 6,
              child: Center(
                child: Text(
                  '-',
                  style: TextStyle(
                    fontSize: f,
                    color: Colors.grey.shade600,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: SizeConfig.safeBlockHorizontal! * 5,
              height: h,
              child: Center(
                child: Text(
                  awayTeamScore,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: f,
                    color: int.parse(homeTeamScore) < int.parse(awayTeamScore)
                        ? Colors.white
                        : Colors.grey.shade600,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: h,
              width: SizeConfig.safeBlockHorizontal! * 35,
              child: Center(
                child: Text(
                  awayTeamName,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: f,
                    fontWeight: FontWeight.bold,
                    color: homeTeamSide == 'blue' ? Colors.red : Colors.blue,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GameScoreCardShimmer extends StatelessWidget {
  const GameScoreCardShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var h = SizeConfig.safeBlockVertical! * 7;
    return Shimmer.fromColors(
      child: Container(
        height: h,
        width: SizeConfig.safeBlockHorizontal! * 90,
        decoration: BoxDecoration(
          color: Colors.grey.shade900,
          borderRadius: BorderRadius.all(
            Radius.circular(SizeConfig.safeBlockHorizontal! * 3),
          ),
        ),
      ),
      baseColor: kBaseColor,
      highlightColor: kHighlightColor,
    );
  }
}

class GameScoreCardCSGO extends StatelessWidget {
  const GameScoreCardCSGO({
    Key? key,
    required this.homeTeamName,
    required this.awayTeamName,
    required this.homeTeamScore,
    required this.awayTeamScore,
    required this.homeTeamSide,
    required this.mapName,
    required this.periodsScoresList,
  }) : super(key: key);

  /// Teams and there scores
  final String homeTeamName;
  final String awayTeamName;
  final String homeTeamScore;
  final String awayTeamScore;
  final String homeTeamSide;
  final String mapName;
  final List periodsScoresList;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var f = SizeConfig.safeBlockHorizontal! * 4;
    return Container(
      width: SizeConfig.safeBlockHorizontal! * 90,
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.all(
          Radius.circular(SizeConfig.safeBlockHorizontal! * 3),
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: SizeConfig.safeBlockHorizontal! * 1,
          ),
          SizedBox(
            height: SizeConfig.safeBlockHorizontal! * 10,
            child: Center(
              child: Text(
                mapName,
                style: TextStyle(
                  fontSize: SizeConfig.safeBlockHorizontal! * 5,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(
            height: SizeConfig.safeBlockHorizontal! * 1,
            child: Divider(),
          ),
          Row(
            children: [
              SizedBox(
                height: SizeConfig.safeBlockHorizontal! * 10,
                width: SizeConfig.safeBlockHorizontal! * 37,
                child: Center(
                  child: Text(
                    homeTeamName,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: f,
                      fontWeight: FontWeight.bold,
                      color: homeTeamSide == 'blue' ? Colors.blue : Colors.red,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: SizeConfig.safeBlockHorizontal! * 5,
                child: Center(
                  child: Text(
                    homeTeamScore,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: f,
                      fontWeight: FontWeight.bold,
                      color: int.parse(homeTeamScore) > int.parse(awayTeamScore)
                          ? Colors.white
                          : Colors.grey.shade600,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: SizeConfig.safeBlockHorizontal! * 6,
                child: Center(
                  child: Text(
                    '-',
                    style: TextStyle(
                      fontSize: f,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: SizeConfig.safeBlockHorizontal! * 5,
                child: Center(
                  child: Text(
                    awayTeamScore,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: f,
                      color: int.parse(homeTeamScore) < int.parse(awayTeamScore)
                          ? Colors.white
                          : Colors.grey.shade600,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: SizeConfig.safeBlockHorizontal! * 37,
                child: Center(
                  child: Text(
                    awayTeamName,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: f,
                      fontWeight: FontWeight.bold,
                      color: homeTeamSide == 'blue' ? Colors.red : Colors.blue,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: SizeConfig.safeBlockHorizontal! * 1,
            child: Divider(),
          ),
          Column(
            children: List.generate(
              periodsScoresList.length,
              (index) => Padding(
                padding: EdgeInsets.only(
                  bottom: SizeConfig.safeBlockHorizontal! * 1,
                ),
                child: ScoreRow(
                  last: index == periodsScoresList.length-1 ? true : false,
                  away: periodsScoresList[index]['away'],
                  home: periodsScoresList[index]['home'],
                  statName: periodsScoresList[index]['statName'],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ScoreRow extends StatelessWidget {
  const ScoreRow(
      {Key? key,
      required this.home,
      required this.statName,
      required this.away,
      required this.last})
      : super(key: key);
  final String home;
  final String statName;
  final String away;
  final bool last;

  @override
  Widget build(BuildContext context) {
    var f = SizeConfig.safeBlockHorizontal! * 4;
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: SizeConfig.safeBlockHorizontal! * 37,
              height: SizeConfig.safeBlockHorizontal! * 10,
              child: Center(
                child: Text(
                  home,
                  style: TextStyle(
                    fontSize: f,
                    color: int.parse(home) > int.parse(away)
                        ? Colors.white
                        : Colors.grey.shade600,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: SizeConfig.safeBlockHorizontal! * 16,
              height: SizeConfig.safeBlockHorizontal! * 10,
              child: Center(
                  child: Text(
                    statName,
                style: TextStyle(
                  fontSize: f,
                  color: Colors.grey,
                ),
              )),
            ),
            SizedBox(
              width: SizeConfig.safeBlockHorizontal! * 37,
              height: SizeConfig.safeBlockHorizontal! * 10,
              child: Center(
                child: Text(
                  away,
                  style: TextStyle(
                    fontSize: f,
                    color: int.parse(away) > int.parse(home)
                        ? Colors.white
                        : Colors.grey.shade600,
                  ),
                ),
              ),
            ),
          ],
        ),
        last
            ? SizedBox()
            : SizedBox(
                height: SizeConfig.safeBlockHorizontal! * 1,
                child: Divider(),
              ),
      ],
    );
  }
}
