import 'package:esports_crystal/configs/consts.dart';
import 'package:esports_crystal/features/tournaments/details/models/cup_tree_round_block.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

/// ( Tested )
class BlockCard extends StatelessWidget {
  const BlockCard({
    Key? key,
    required this.cupTreeRoundBlock,
  }) : super(key: key);
  final CupTreeRoundBlock cupTreeRoundBlock;
  @override
  Widget build(BuildContext context) {
    bool homeWon = cupTreeRoundBlock.participants!.isNotEmpty ? cupTreeRoundBlock.participants![0].winner! : true;
    String? homeName = cupTreeRoundBlock.participants!.isNotEmpty ? cupTreeRoundBlock.participants![0].name:'-';
    String? homeScore = cupTreeRoundBlock.homeTeamScore;
    String? awayName = cupTreeRoundBlock.participants!.length > 1 ? cupTreeRoundBlock.participants![1].name:'-';
    String? awayScore = cupTreeRoundBlock.awayTeamScore;
    return Column(
      children: [
        Container(
          width: 90.w,
          height: 8.h,
          decoration: BoxDecoration(
              color: kFrontColor, //Colors.grey.shade900,
              borderRadius: BorderRadius.circular(2.w,)),
          child: Padding(
            padding: EdgeInsets.only(left: 4.w,right: 4.w,),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 3.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        homeName??'',
                        style: TextStyle(
                          color: homeWon ? Colors.white : kPastColor,
                          fontSize: 4.w,
                        ),
                      ),
                      Text(
                        homeScore??'',
                        style: TextStyle(
                          color: homeWon ? Colors.white : kPastColor,
                          fontSize: 4.w,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 3.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        awayName??'',
                        style: TextStyle(
                          color: homeWon ? kPastColor : Colors.white,
                          fontSize: 4.w,
                        ),
                      ),
                      Text(
                        awayScore??'',
                        style: TextStyle(
                          color: homeWon ? kPastColor : Colors.white,
                          fontSize: 4.w,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 2.w,)
      ],
    );
  }
}
