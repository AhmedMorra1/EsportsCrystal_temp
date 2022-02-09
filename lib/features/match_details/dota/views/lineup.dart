import 'package:esports_crystal/configs/consts.dart';
import 'package:esports_crystal/configs/size_config.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LineupDota extends StatelessWidget {
  const LineupDota({Key? key, required this.lineUpRows, required this.homeTeamSide}) : super(key: key);
  final List lineUpRows;
  final String homeTeamSide;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: SizeConfig.safeBlockHorizontal! * 34 * 5,
      width: SizeConfig.safeBlockHorizontal! * 90,
      decoration: BoxDecoration(
        color: kFrontColor,
        borderRadius: BorderRadius.all(
          Radius.circular(SizeConfig.safeBlockHorizontal! * 3),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
            lineUpRows.length,
            (index) => LineUpRow(
                  homePlayerName: lineUpRows[index]['homePlayerName'],
                  homeChampionName: lineUpRows[index]['homeChampionName'],
                  homeKDA: lineUpRows[index]['homeKDA'],
                  homeGM: lineUpRows[index]['homeGM'].toString(),
                  homeLHDN: lineUpRows[index]['homeLHDN'],
                  homeXPM: lineUpRows[index]['homeXPM'].toString(),
                  awayPlayerName: lineUpRows[index]['awayPlayerName'],
                  awayChampionName: lineUpRows[index]['awayChampionName'],
                  awayKDA: lineUpRows[index]['awayKDA'],
                  awayLHDN: lineUpRows[index]['awayLHDN'],
                  awayGM: lineUpRows[index]['awayGM'].toString(),
                  awayXPM: lineUpRows[index]['awayXPM'].toString(),
                  number: index,
              homeTeamSide: homeTeamSide,
                )),
      ),
    );
  }
}

class LineUpRow extends StatelessWidget {
  const LineUpRow(
      {Key? key,
      required this.homePlayerName,
      required this.homeChampionName,
      required this.homeKDA,
        required this.homeLHDN,
        required this.homeGM,
        required this.homeXPM,
      required this.awayPlayerName,
      required this.awayChampionName,
      required this.awayKDA,
        required this.awayLHDN,
        required this.awayGM,
        required this.awayXPM,
      required this.number, required this.homeTeamSide,})
      : super(key: key);
  final String homePlayerName;
  final String homeChampionName;
  final String homeKDA;
  final String homeLHDN;
  final String homeGM;
  final String homeXPM;
  final String awayPlayerName;
  final String awayChampionName;
  final String awayKDA;
  final String awayLHDN;
  final String awayGM;
  final String awayXPM;
  final int number;
  final String homeTeamSide;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              height: SizeConfig.safeBlockHorizontal! * 30,
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
                          color: kPastColor.withOpacity(.7),
                          fontSize: SizeConfig.safeBlockHorizontal! * 3.5,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockHorizontal! * 5,
                    width: SizeConfig.safeBlockHorizontal! * 37,
                    child: Center(
                      child: FittedBox(
                        child: Text(
                          homeChampionName,
                          style: TextStyle(
                            //color: homeTeamSide == 'blue' ? Colors.green : Colors.red,//Colors.white,
                            fontSize: SizeConfig.safeBlockHorizontal! * 4,
                            fontWeight: FontWeight.bold,
                          ),
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
                          color: kPastColor.withOpacity(.7),
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
                        homeLHDN,
                        style: TextStyle(
                          color: kPastColor.withOpacity(.7),
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
                        homeGM,
                        style: TextStyle(
                          color: kPastColor.withOpacity(.7),
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
                        homeXPM,
                        style: TextStyle(
                          color: kPastColor.withOpacity(.7),
                          fontSize: SizeConfig.safeBlockHorizontal! * 3.5,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.safeBlockHorizontal! * 30,
              width: SizeConfig.safeBlockHorizontal! * 16,
              child: Column(
                children: [
                  SizedBox(
                    height: SizeConfig.safeBlockHorizontal! * 5,
                    width: SizeConfig.safeBlockHorizontal! * 37,
                    child: Center(
                      child: Text(
                        '',
                        style: TextStyle(
                          color: kPastColor.withOpacity(.7),
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
                        '',
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
                        'K/D/A',
                        style: TextStyle(
                          color: kPastColor.withOpacity(.7),
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
                        'LH/DN',
                        style: TextStyle(
                          color: kPastColor.withOpacity(.7),
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
                        'G/Min',
                        style: TextStyle(
                          color: kPastColor.withOpacity(.7),
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
                        'XP/Min',
                        style: TextStyle(
                          color: kPastColor.withOpacity(.7),
                          fontSize: SizeConfig.safeBlockHorizontal! * 3.5,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.safeBlockHorizontal! * 30,
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
                          color: kPastColor.withOpacity(.7),
                          fontSize: SizeConfig.safeBlockHorizontal! * 3.5,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockHorizontal! * 5,
                    width: SizeConfig.safeBlockHorizontal! * 37,
                    child: Center(
                      child: FittedBox(
                        child: Text(
                          awayChampionName,
                          style: TextStyle(
                            //color: homeTeamSide != 'blue' ? Colors.green : Colors.red,//Colors.white,
                            fontSize: SizeConfig.safeBlockHorizontal! * 4,
                            fontWeight: FontWeight.bold,
                          ),
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
                          color: kPastColor.withOpacity(.7),
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
                        awayLHDN,
                        style: TextStyle(
                          color: kPastColor.withOpacity(.7),
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
                        awayGM,
                        style: TextStyle(
                          color: kPastColor.withOpacity(.7),
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
                        awayXPM,
                        style: TextStyle(
                          color: kPastColor.withOpacity(.7),
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
        SizedBox(
        height: SizeConfig.safeBlockHorizontal! * 1.5,),
        number != 4
            ? SizedBox(
                height: SizeConfig.safeBlockHorizontal! * 1,
                child: Divider(),
              )
            : SizedBox()
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
        height: SizeConfig.safeBlockHorizontal! * 34 * 5,
        width: SizeConfig.safeBlockHorizontal! * 90,
        decoration: BoxDecoration(
          color: kFrontColor,
          borderRadius: BorderRadius.all(
            Radius.circular(SizeConfig.safeBlockHorizontal! * 3),
          ),
        ),
      ),
    );
  }
}
