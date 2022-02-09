import 'package:esports_crystal/configs/size_config.dart';
import 'package:esports_crystal/features/schedule/models/match_details.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:esports_crystal/configs/consts.dart';
import 'package:auto_size_text/auto_size_text.dart';

/// Game teams card view
class GameTeamsCard extends StatelessWidget {
  /// construct game teams card view
  const GameTeamsCard({
    Key? key,
    required this.matchDetails,
  }) : super(key: key);

  final MatchDetails matchDetails;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var h = SizeConfig.safeBlockVertical! * 7;
    var f = SizeConfig.safeBlockHorizontal! * 4;
    return Container(
      height: h,
      width: SizeConfig.safeBlockHorizontal! * 90,
      decoration: BoxDecoration(
        color: kFrontColor,
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
                child: AutoSizeText(
                  matchDetails.homeTeam!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: f,
                    fontWeight: FontWeight.bold,
                    color: matchDetails.status != 'inprogress'
                        ? (int.parse(matchDetails.homeScore!) >
                        int.parse(matchDetails.awayScore!)
                        ? Colors.white
                        : kPastColor.withOpacity(.7))
                        : Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: SizeConfig.safeBlockHorizontal! * 5,
              height: h,
              child: Center(
                child: Text(
                  matchDetails.homeScore!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: f,
                    fontWeight: FontWeight.bold,
                    color: matchDetails.status != 'inprogress'
                        ? (int.parse(matchDetails.homeScore!) >
                                int.parse(matchDetails.awayScore!)
                            ? Colors.white
                            : kPastColor.withOpacity(.7))
                        : Colors.white,
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
                    color: kPastColor.withOpacity(.7),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: SizeConfig.safeBlockHorizontal! * 5,
              height: h,
              child: Center(
                child: Text(
                  matchDetails.awayScore!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: f,
                    color: matchDetails.status != 'inprogress'
                        ? (int.parse(matchDetails.homeScore!) <
                            int.parse(matchDetails.awayScore!)
                        ? Colors.white
                        : kPastColor.withOpacity(.7)) : Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: h,
              width: SizeConfig.safeBlockHorizontal! * 35,
              child: Center(
                child: AutoSizeText(
                  matchDetails.awayTeam!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: f,
                    fontWeight: FontWeight.bold,
                    color: matchDetails.status != 'inprogress'
                        ? (int.parse(matchDetails.homeScore!) <
                        int.parse(matchDetails.awayScore!)
                        ? Colors.white
                        : kPastColor.withOpacity(.7)) : Colors.white,
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

class GameTeamsCardShimmer extends StatelessWidget {
  const GameTeamsCardShimmer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      child: Container(
        height: SizeConfig.safeBlockVertical! * 7,
        width: SizeConfig.safeBlockHorizontal! * 90,
        decoration: BoxDecoration(
          color: kFrontColor,
          borderRadius: BorderRadius.all(
            Radius.circular(SizeConfig.safeBlockHorizontal! * 3),
          ),
        ),
      ),
      baseColor: kBackColor,
      highlightColor: kFrontColor,
    );
  }
}
