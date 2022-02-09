
import 'package:esports_crystal/configs/size_config.dart';
import 'package:flutter/material.dart';

class RoundRow extends StatelessWidget {
  const RoundRow({Key? key, this.homeColor, this.awayColor, this.homeOutcome, this.awayOutcome, this.homeIcon, this.awayIcon, this.roundNumber, }) : super(key: key);

  final homeColor;
  final awayColor;
  final homeOutcome;
  final awayOutcome;
  final homeIcon;
  final awayIcon;
  final roundNumber;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final height = SizeConfig.safeBlockHorizontal! * 8;
    return Padding(
      padding: EdgeInsets.only(bottom: 1),
      child: Row(
        children: [
          Container(
            height: height,
            width: SizeConfig.safeBlockHorizontal! * 40,
            decoration: BoxDecoration(
              color: homeColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(SizeConfig.safeBlockHorizontal! * 2),
                bottomLeft:
                    Radius.circular(SizeConfig.safeBlockHorizontal! * 2),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  child: Center(child: Text(homeOutcome)),
                  width: SizeConfig.safeBlockHorizontal! * 30,
                  height: height,
                ),
                SizedBox(
                  width: height,
                  height: height,
                  child: homeIcon,
                )
              ],
            ),
          ),
          SizedBox(
            width: height,
            height: height,
            child: Center(child: Text(roundNumber.toString())),
          ),
          Container(
            height: height,
            width: SizeConfig.safeBlockHorizontal! * 40,
            decoration: BoxDecoration(
              color: awayColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(SizeConfig.safeBlockHorizontal! * 2),
                bottomRight:
                    Radius.circular(SizeConfig.safeBlockHorizontal! * 2),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: height,
                  height: height,
                  child: awayIcon,
                ),
                SizedBox(
                  child: Center(child: Text(awayOutcome)),
                  width: SizeConfig.safeBlockHorizontal! * 30,
                  height: height,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
