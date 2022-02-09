import 'package:esports_crystal/configs/consts.dart';
import 'package:esports_crystal/features/schedule/models/match_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:esports_crystal/features/tournaments/details/controllers/tournament_detail_controller.dart';
import 'package:sizer/sizer.dart';

import 'match_card.dart';

class ListOfMatches extends StatelessWidget {
  const ListOfMatches({
    Key? key,
    required this.isUpcoming,
  }) : super(key: key);
  final bool isUpcoming;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TournamentDetailController());
    isUpcoming ? controller.getUpcoming() : controller.getResults();
    var matchList = isUpcoming ? controller.upcoming : controller.results;
    return Obx(() => Container(
          child: controller.isUpcomingLoading.value || controller.isResultsLoading.value
              ? Center(
                  child: CircularProgressIndicator(
                    color: kPastColor,
                  ),
                )
              : (isUpcoming ? Container(
                  width: 90.w,
                  decoration: BoxDecoration(
                      //color: kFrontColor, //Colors.grey.shade900,
                      borderRadius: BorderRadius.circular(2.w)),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 2.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {
                                isUpcoming ? controller.previousPageUpcoming() : controller.previousPageResults();
                              },
                              child: Text(
                                'Previous',
                                style: TextStyle(color: kPastColor, fontSize: 4.w),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                isUpcoming ? controller.nextPageUpcoming() : controller.nextPageResults();
                              },
                              child: Text(
                                'Next',
                                style: TextStyle(color: kPastColor, fontSize: 4.w),
                              ),
                            ),
                          ],
                        ),
                      ),
                      matchList.isNotEmpty
                          ? SizedBox()
                          : Padding(
                        padding: EdgeInsets.only(top: 10.h),
                            child: Center(
                                child: Text(
                                  'No Matches Available',
                                  style: TextStyle(
                                    color: kPastColor.withOpacity(.5),
                                    fontSize: 4.w,
                                  ),
                                ),
                              ),
                          ),
                      ...List.generate(
                          matchList.length,
                          (index) => Padding(
                                padding: EdgeInsets.only(bottom: 2.w),
                                child: MatchCard(gameCode: controller.gameCode.value, matchDetails: matchList[index]),
                              )),
                    ],
                  ),
                ) : Container(
            width: 90.w,
            decoration: BoxDecoration(
              //color: kFrontColor, //Colors.grey.shade900,
                borderRadius: BorderRadius.circular(2.w)),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 2.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          isUpcoming ? controller.previousPageUpcoming() : controller.previousPageResults();
                        },
                        child: Text(
                          'Previous',
                          style: TextStyle(color: kPastColor, fontSize: 4.w),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          isUpcoming ? controller.nextPageUpcoming() : controller.nextPageResults();
                        },
                        child: Text(
                          'Next',
                          style: TextStyle(color: kPastColor, fontSize: 4.w),
                        ),
                      ),
                    ],
                  ),
                ),
                matchList.isNotEmpty
                    ? SizedBox()
                    : Padding(
                  padding: EdgeInsets.only(top: 10.h),
                  child: Center(
                    child: Text(
                      'No Matches Available',
                      style: TextStyle(
                        color: kPastColor.withOpacity(.5),
                        fontSize: 4.w,
                      ),
                    ),
                  ),
                ),
                ...List.generate(
                    matchList.length,
                        (index) => Padding(
                      padding: EdgeInsets.only(bottom: 2.w),
                      child: MatchCard(gameCode: controller.gameCode.value, matchDetails: matchList[index]),
                    )).reversed,
              ],
            ),
          )),
        ));
  }
}
