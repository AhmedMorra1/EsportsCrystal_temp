import 'package:esports_crystal/configs/consts.dart';
import 'package:esports_crystal/configs/size_config.dart';
import 'package:esports_crystal/helper_widgets/breather.dart';
import 'package:esports_crystal/helper_widgets/text_divider.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class LineupLeague extends StatelessWidget {
  const LineupLeague({Key? key, required this.lineUpRows}) : super(key: key);
  final List lineUpRows;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return (lineUpRows[0]['homePlayerName'] !='-'&&lineUpRows[0]['awayPlayerName'] !='-') ? Column(
      children: [
        const TextDivider(text: 'Lineups'),
        const Breather(
          h: 3,
        ),
        Container(
          height: SizeConfig.safeBlockHorizontal! * 17 * 5,
          width: SizeConfig.safeBlockHorizontal! * 90,
          decoration: BoxDecoration(
            color: kFrontColor, //Colors.grey.shade900,
            borderRadius: BorderRadius.all(
              Radius.circular(SizeConfig.safeBlockHorizontal! * 3),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                lineUpRows.length,
                (index) => LineUpRow(
                      homePlayerName: lineUpRows[index]['homePlayerName'],
                      homeChampionName: lineUpRows[index]['homeChampionName'],
                      homeStats: lineUpRows[index]['homeStats'],
                      lane: lineUpRows[index]['lane'],
                      awayPlayerName: lineUpRows[index]['awayPlayerName'],
                      awayChampionName: lineUpRows[index]['awayChampionName'],
                      awayStats: lineUpRows[index]['awayStats'],
                      number: index,
                    )),
          ),
        ),
      ],
    ):Center(child: Text('Limited game data\nTry again later',textAlign: TextAlign.center,style: TextStyle(color: kPastColor,fontSize: 4.w),),);
  }
}

class LineUpRow extends StatelessWidget {
  const LineUpRow(
      {Key? key,
      required this.homePlayerName,
      required this.homeChampionName,
      required this.homeStats,
      required this.lane,
      required this.awayPlayerName,
      required this.awayChampionName,
      required this.awayStats,
      required this.number})
      : super(key: key);
  final String homePlayerName;
  final String homeChampionName;
  final String homeStats;
  final String lane;
  final String awayPlayerName;
  final String awayChampionName;
  final String awayStats;
  final int number;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              height: SizeConfig.safeBlockHorizontal! * 15,
              width: SizeConfig.safeBlockHorizontal! * 37,
              child: Column(
                children: [
                  SizedBox(
                    height: SizeConfig.safeBlockHorizontal! * 5,
                    width: SizeConfig.safeBlockHorizontal! * 37,
                    child: Center(
                      child: Text(
                        homePlayerName,
                        style: TextStyle(
                          color: kPastColor, //Colors.grey.shade600,
                          fontSize: SizeConfig.safeBlockHorizontal! * 3.5,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockHorizontal! * 5,
                    width: SizeConfig.safeBlockHorizontal! * 37,
                    child: Center(
                      child: Text(
                        homeChampionName,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: SizeConfig.safeBlockHorizontal! * 4,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockHorizontal! * 5,
                    width: SizeConfig.safeBlockHorizontal! * 37,
                    child: Center(
                      child: Text(
                        homeStats,
                        style: TextStyle(
                          color: kPastColor, //Colors.grey.shade600,
                          fontSize: SizeConfig.safeBlockHorizontal! * 3.5,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.safeBlockHorizontal! * 15,
              width: SizeConfig.safeBlockHorizontal! * 16,
              child: Center(
                child: Text(
                  lane,
                  style: TextStyle(
                    color: kPastColor, //Colors.grey,
                    fontSize: SizeConfig.safeBlockHorizontal! * 4,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.safeBlockHorizontal! * 15,
              width: SizeConfig.safeBlockHorizontal! * 37,
              child: Column(
                children: [
                  SizedBox(
                    height: SizeConfig.safeBlockHorizontal! * 5,
                    width: SizeConfig.safeBlockHorizontal! * 37,
                    child: Center(
                      child: Text(
                        awayPlayerName,
                        style: TextStyle(
                          color: kPastColor, //Colors.grey.shade600,
                          fontSize: SizeConfig.safeBlockHorizontal! * 3.5,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockHorizontal! * 5,
                    width: SizeConfig.safeBlockHorizontal! * 37,
                    child: Center(
                      child: Text(
                        awayChampionName,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: SizeConfig.safeBlockHorizontal! * 4,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockHorizontal! * 5,
                    width: SizeConfig.safeBlockHorizontal! * 37,
                    child: Center(
                      child: Text(
                        awayStats,
                        style: TextStyle(
                          color: kPastColor,//Colors.grey.shade600,
                          fontSize: SizeConfig.safeBlockHorizontal! * 3.5,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        number != 4
            ? SizedBox(
                height: SizeConfig.safeBlockHorizontal! * 1,
                child: const Divider(),
              )
            : const SizedBox()
      ],
    );
  }
}

class LineupLeagueShimmer extends StatelessWidget {
  const LineupLeagueShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: kBackColor,
      highlightColor: kFrontColor,
      child: Container(
        height: SizeConfig.safeBlockHorizontal! * 15 * 5,
        width: SizeConfig.safeBlockHorizontal! * 90,
        decoration: BoxDecoration(
          color: kPastColor,//Colors.grey.shade900,
          borderRadius: BorderRadius.all(
            Radius.circular(SizeConfig.safeBlockHorizontal! * 3),
          ),
        ),
      ),
    );
  }
}

class LineupCSGO extends StatelessWidget {
  const LineupCSGO({Key? key, required this.lineUpRows}) : super(key: key);
  final List lineUpRows;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: SizeConfig.safeBlockHorizontal! * 26 * 5,
      width: SizeConfig.safeBlockHorizontal! * 90,
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.all(
          Radius.circular(SizeConfig.safeBlockHorizontal! * 3),
        ),
      ),
      child: Column(
        children: List.generate(
            lineUpRows.length,
            (index) => LineUpRowCSGO(
                  homePlayerName: lineUpRows[index]['homePlayerName'],
                  awayPlayerName: lineUpRows[index]['awayPlayerName'],
                  homeKDA: lineUpRows[index]['homeKDA'],
                  homeKD: lineUpRows[index]['homeKD'],
                  homeADR: lineUpRows[index]['homeADR'],
                  awayKDA: lineUpRows[index]['awayKDA'],
                  awayKD: lineUpRows[index]['awayKD'],
                  awayADR: lineUpRows[index]['awayADR'],
                  number: index,
                )),
      ),
    );
  }
}

class LineUpRowCSGO extends StatelessWidget {
  const LineUpRowCSGO({
    Key? key,
    required this.homePlayerName,
    required this.awayPlayerName,
    required this.number,
    required this.homeKDA,
    required this.homeKD,
    required this.homeADR,
    required this.awayKDA,
    required this.awayKD,
    required this.awayADR,
  }) : super(key: key);
  final String homePlayerName;
  final String homeKDA;
  final String homeKD;
  final String homeADR;
  final String awayPlayerName;
  final String awayKDA;
  final String awayKD;
  final String awayADR;
  final int number;
  @override
  Widget build(BuildContext context) {
    final nameFontSize = SizeConfig.safeBlockHorizontal! * 4;
    final statFontSize = SizeConfig.safeBlockHorizontal! * 4;
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              height: SizeConfig.safeBlockHorizontal! * 25,
              width: SizeConfig.safeBlockHorizontal! * 37,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: SizeConfig.safeBlockHorizontal! * 5,
                    width: SizeConfig.safeBlockHorizontal! * 37,
                    child: Center(
                      child: Text(
                        homePlayerName,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: nameFontSize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockHorizontal! * 5,
                    width: SizeConfig.safeBlockHorizontal! * 37,
                    child: Center(
                      child: Text(
                        homeKDA,
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: statFontSize,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockHorizontal! * 5,
                    width: SizeConfig.safeBlockHorizontal! * 37,
                    child: Center(
                      child: Text(
                        homeKD,
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: statFontSize,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockHorizontal! * 5,
                    width: SizeConfig.safeBlockHorizontal! * 37,
                    child: Center(
                      child: Text(
                        homeADR,
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: statFontSize,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.safeBlockHorizontal! * 25,
              width: SizeConfig.safeBlockHorizontal! * 16,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: SizeConfig.safeBlockHorizontal! * 5,
                    child: Center(
                      child: Text(
                        '',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: statFontSize,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockHorizontal! * 5,
                    child: Center(
                      child: Text(
                        'K/D/A',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: statFontSize,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockHorizontal! * 5,
                    child: Center(
                      child: Text(
                        'K-D',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: statFontSize,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockHorizontal! * 5,
                    child: Center(
                      child: Text(
                        'ADR',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: statFontSize,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.safeBlockHorizontal! * 25,
              width: SizeConfig.safeBlockHorizontal! * 37,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: SizeConfig.safeBlockHorizontal! * 5,
                    width: SizeConfig.safeBlockHorizontal! * 37,
                    child: Center(
                      child: Text(
                        awayPlayerName,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: nameFontSize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockHorizontal! * 5,
                    width: SizeConfig.safeBlockHorizontal! * 37,
                    child: Center(
                      child: Text(
                        awayKDA,
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: statFontSize,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockHorizontal! * 5,
                    width: SizeConfig.safeBlockHorizontal! * 37,
                    child: Center(
                      child: Text(
                        awayKD,
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: statFontSize,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockHorizontal! * 5,
                    width: SizeConfig.safeBlockHorizontal! * 37,
                    child: Center(
                      child: Text(
                        awayADR,
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: statFontSize,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        number != 4
            ? SizedBox(
                height: SizeConfig.safeBlockHorizontal! * 1,
                child: const Divider(),
              )
            : const SizedBox()
      ],
    );
  }
}
