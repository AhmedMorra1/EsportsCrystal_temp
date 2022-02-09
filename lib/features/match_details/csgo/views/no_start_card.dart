import 'package:esports_crystal/configs/size_config.dart';
import 'package:esports_crystal/features/schedule/models/match_details.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:esports_crystal/configs/consts.dart';
import 'package:sizer/sizer.dart';

/// Game teams card view
class NoStartCard extends StatelessWidget {
  /// construct game teams card view
  const NoStartCard({
    Key? key,
    required this.matchDetails,
  }) : super(key: key);

  final MatchDetails matchDetails;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var h = SizeConfig.safeBlockVertical! * 7;
    var f = SizeConfig.safeBlockHorizontal! * 4;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: h,
          width: SizeConfig.safeBlockHorizontal! * 90,
          decoration: BoxDecoration(
            color: kFrontColor, //Colors.grey.shade900,
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
                      matchDetails.homeTeam!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: f,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: SizeConfig.safeBlockHorizontal! * 5,
                  height: h,
                ),
                SizedBox(
                  height: h,
                  width: SizeConfig.safeBlockHorizontal! * 6,
                  child: Center(
                    child: Text(
                      '-',
                      style: TextStyle(
                        fontSize: f,
                        color: kPastColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: SizeConfig.safeBlockHorizontal! * 5,
                  height: h,
                ),
                SizedBox(
                  height: h,
                  width: SizeConfig.safeBlockHorizontal! * 35,
                  child: Center(
                    child: Text(
                      matchDetails.awayTeam!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: f,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 5.h,
        ),
        if (matchDetails.status == 'notstarted')
          Center(
            child: Text(
              'Match has not started yet',
              style: TextStyle(color: kPastColor, fontSize: 4.w),
            ),
          )
        else if (matchDetails.status == 'canceled')
          Center(
            child: Text(
              "Match is canceled",
              style: TextStyle(color: kPastColor, fontSize: 4.w),
            ),
          )
        else if (matchDetails.status == 'postponed')
          Center(
            child: Text(
              "Match is postponed",
              style: TextStyle(color: kPastColor, fontSize: 4.w),
            ),
          )
      ],
    );
  }
}
