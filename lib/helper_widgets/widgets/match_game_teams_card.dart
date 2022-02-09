import 'package:esports_crystal/configs/size_config.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:esports_crystal/configs/consts.dart';

/// Game teams card view
class LeagueGameTeamsCard extends StatelessWidget {
  /// construct game teams card view
  const LeagueGameTeamsCard({
    Key? key,
    required this.homeTeamName,
    required this.awayTeamName,
    required this.homeTeamScore,
    required this.awayTeamScore,
    required this.winnerTeam,
  }) : super(key: key);

  /// Match Teams And Scores
  final String homeTeamName;
  final String awayTeamName;
  final String homeTeamScore;
  final String awayTeamScore;
  final String winnerTeam;
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
          top: SizeConfig.safeBlockVertical! * 1,
          bottom: SizeConfig.safeBlockVertical! * 1,
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
                    color: winnerTeam == 'homeTeam' ? Colors.white : Colors.grey.shade600,
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
                        color: winnerTeam == 'homeTeam' ? Colors.white : Colors.grey.shade600,
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
                        color: winnerTeam == 'awayTeam' ? Colors.white : Colors.grey.shade600,
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
                        color: winnerTeam == 'awayTeam' ? Colors.white : Colors.grey.shade600,
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

class LeagueGameTeamsCardShimmer extends StatelessWidget {
  const LeagueGameTeamsCardShimmer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      child: Container(
        height: SizeConfig.safeBlockVertical! * 7,
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
