import 'package:esports_crystal/configs/consts.dart';
import 'package:esports_crystal/configs/size_config.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:auto_size_text/auto_size_text.dart';

class GameScoreCard extends StatelessWidget {
  const GameScoreCard({
    Key? key,
    required this.cardData,
  }) : super(key: key);

  final Map cardData;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var h = SizeConfig.safeBlockVertical! * 6;
    var f = SizeConfig.safeBlockHorizontal! * 4;
    return cardData['homeTeamName'] != null ? Container(
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
          top: SizeConfig.safeBlockHorizontal! * 1,
          bottom: SizeConfig.safeBlockHorizontal! * 1,
        ),
        child: Row(
          children: [
            SizedBox(
              height: h,
              width: SizeConfig.safeBlockHorizontal! * 34,
              child: Center(
                child: AutoSizeText(
                  cardData['homeTeamName'],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: f,
                    fontWeight: FontWeight.bold,
                    color: cardData['homeTeamSide'] == 'blue'
                        ? Colors.green
                        : Colors.red,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: SizeConfig.safeBlockHorizontal! * 7,
              height: h,
              child: Center(
                child: Text(
                  cardData['homeTeamScore'].toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: f,
                    fontWeight: FontWeight.bold,
                    color: cardData['status'] == 'inprogress' ? Colors.white : (
                        cardData['homeTeamScore'] > cardData['awayTeamScore']
                            ? Colors.white
                            : kPastColor.withOpacity(.6)),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: h,
              width: SizeConfig.safeBlockHorizontal! * 4,
              child: Center(
                child: Text(
                  '-',
                  style: TextStyle(
                    fontSize: f,
                    color: kPastColor.withOpacity(.6),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: SizeConfig.safeBlockHorizontal! * 7,
              height: h,
              child: Center(
                child: Text(
                  cardData['awayTeamScore'].toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: f,
                    color:cardData['status'] == 'inprogress' ? Colors.white : (
                        cardData['homeTeamScore'] < cardData['awayTeamScore']
                            ? Colors.white
                            : kPastColor.withOpacity(.6)),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: h,
              width: SizeConfig.safeBlockHorizontal! * 34,
              child: Center(
                child: AutoSizeText(
                  cardData['awayTeamName'],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: f,
                    fontWeight: FontWeight.bold,
                    color: cardData['homeTeamSide'] == 'blue'
                        ? Colors.red
                        : Colors.green,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ):SizedBox();
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

