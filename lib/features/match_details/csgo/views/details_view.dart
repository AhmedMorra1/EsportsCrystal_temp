import 'package:esports_crystal/configs/size_config.dart';
import 'package:esports_crystal/features/match_details/csgo/controllers/csgo_controller.dart';
import 'package:esports_crystal/features/match_details/csgo/views/lineup.dart';
import 'package:esports_crystal/features/match_details/csgo/views/no_start_card.dart';
import 'package:esports_crystal/features/match_details/csgo/views/stream_link_row.dart';
import 'package:esports_crystal/features/schedule/models/match_details.dart';
import 'package:flutter/material.dart';
import 'package:esports_crystal/configs/consts.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:esports_crystal/helper_widgets/text_divider.dart';
import 'game_score_card.dart';
import 'package:esports_crystal/helper_widgets/breather.dart';
import 'round_row.dart';
import 'teams_card.dart';
import 'match_games_row.dart';

class CSGOMatchGamesDetailsView extends StatelessWidget {
  const CSGOMatchGamesDetailsView({Key? key, required this.matchDetails}) : super(key: key);
  final MatchDetails matchDetails;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final controller = Get.put(CSGOMatchGamesContoller());
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackColor,
        body: Padding(
          padding: EdgeInsets.only(
            left: SizeConfig.safeBlockHorizontal! * 5,
            right: SizeConfig.safeBlockHorizontal! * 5,
            top: SizeConfig.safeBlockVertical! * 2,
            bottom: SizeConfig.safeBlockVertical! * 1,
          ),
          child: Obx(() => Column(
                children: [
                  controller.isLoadingStreamLink.value
                      ? StreamLinkRowShimmer()
                      : (controller.streamLink.value == 'https://www.twitch.tv'
                          ? StreamLinkRow()
                          : StreamLinkRow(
                              streamUrl: controller.streamLink.value,
                            )),
                  Breather(
                    h: 3,
                  ),
                  TextDivider(text: '${matchDetails.tournament}'),
                  Breather(
                    h: 3,
                  ),
                  if ((matchDetails.status == 'inprogress') || (matchDetails.status == 'finished'))
                    Expanded(
                      child: RefreshIndicator(
                        backgroundColor: kFrontColor,
                        color: kPastColor,
                        onRefresh: () {
                          return controller.updateEveryThing(matchDetails);
                        },
                        child: Obx(
                          () => ListView(
                            children: [
                              GameTeamsCard(
                                matchDetails: matchDetails,
                              ),
                              Breather(
                                h: 3,
                              ),
                              TextDivider(text: 'Best of ${matchDetails.bestOf}'),
                              controller.isLoadingMatchGamesList.value
                                  ? GamesListShimmerRow()
                                  : GamesListRow(gamesList: controller.matchGamesList, selectedGameIndex: controller.selectedGameNumber.value),
                              TextDivider(text: 'Game ${controller.selectedGameNumber.value + 1}'),
                              Breather(
                                h: 3,
                              ),
                              controller.isLoadingMatchGamesList.value
                                  ? GameScoreCardShimmer()
                                  : (controller.isLoadingMapCardData.value
                                      ? GameScoreCardShimmer()
                                      : GameScoreCardCSGO(
                                          homeTeamScore: controller.gameScoreCardData['homeTeamScore'].toString(),
                                          awayTeamName: controller.gameScoreCardData['awayTeamName'],
                                          mapName: controller.gameScoreCardData['mapName'],
                                          awayTeamScore: controller.gameScoreCardData['awayTeamScore'].toString(),
                                          homeTeamName: controller.gameScoreCardData['homeTeamName'],
                                          periodsScoresList: controller.gameScoreCardData['periodsScoresList'],
                                          homeTeamSide: controller.gameScoreCardData['homeTeamSide'].toString(),
                                        )),
                              Breather(
                                h: 3,
                              ),
                              TextDivider(text: 'Timeline'),
                              Breather(
                                h: 3,
                              ),
                              controller.isLoadingMatchGamesList.value
                                  ? GameScoreCardShimmer()
                                  : (controller.isLoadingRoundData.value
                                      ? GameScoreCardShimmer()
                                      : Column(
                                          children: List.generate(controller.roundsData['normalTimeRounds']!.length, (index) {
                                            print('.');
                                            print(controller.roundsData['normalTimeRounds']![index]['homeOutcomeIcon']);
                                            print(controller.roundsData['normalTimeRounds']![index]['awayOutcomeIcon']);
                                            return RoundRow(
                                              homeColor: controller.roundsData['normalTimeRounds']![index]['homeColor'],
                                              awayColor: controller.roundsData['normalTimeRounds']![index]['awayColor'],
                                              homeOutcome: controller.roundsData['normalTimeRounds']![index]['homeOutcome'],
                                              awayOutcome: controller.roundsData['normalTimeRounds']![index]['awayOutcome'],
                                              homeOutcomeIcon: controller.roundsData['normalTimeRounds']![index]['homeOutcomeIcon'],
                                              awayOutcomeIcon: controller.roundsData['normalTimeRounds']![index]['awayOutcomeIcon'],
                                              roundNumber: controller.roundsData['normalTimeRounds']![index]['roundNumber'],
                                            );
                                          }),
                                        )),
                              Breather(
                                h: 2,
                              ),
                              controller.isLoadingMatchGamesList.value
                                  ? SizedBox()
                                  : (controller.roundsData['overTimeRounds']!.isNotEmpty
                                      ? (controller.isLoadingRoundData.value ? GameScoreCardShimmer() : TextDivider(text: 'OverTime'))
                                      : SizedBox()),
                              Breather(
                                h: 2,
                              ),
                              controller.isLoadingMatchGamesList.value
                                  ? GameScoreCardShimmer()
                                  : (controller.roundsData['overTimeRounds']!.isNotEmpty
                                      ? (controller.isLoadingRoundData.value
                                          ? GameScoreCardShimmer()
                                          : Column(
                                              children: List.generate(
                                                  controller.roundsData['overTimeRounds']!.length,
                                                  (index) => RoundRow(
                                                        homeColor: controller.roundsData['overTimeRounds']![index]['homeColor'],
                                                        awayColor: controller.roundsData['overTimeRounds']![index]['awayColor'],
                                                        homeOutcome: controller.roundsData['overTimeRounds']![index]['homeOutcome'],
                                                        awayOutcome: controller.roundsData['overTimeRounds']![index]['awayOutcome'],
                                                        homeOutcomeIcon: controller.roundsData['overTimeRounds']![index]['homeOutcomeIcon'],
                                                        awayOutcomeIcon: controller.roundsData['overTimeRounds']![index]['awayOutcomeIcon'],
                                                        roundNumber: controller.roundsData['overTimeRounds']![index]['roundNumber'],
                                                      )),
                                            ))
                                      : SizedBox()),
                              controller.isLoadingMatchGamesList.value
                                  ? LineupCSGOShimmer()
                                  : (controller.isLoadingPlayerData.value
                                      ? LineupCSGOShimmer()
                                      : (controller.lineUpRows.isNotEmpty
                                          ? Column(
                                              children: [
                                                Breather(
                                                  h: 3,
                                                ),
                                                TextDivider(text: 'Lineups'),
                                                Breather(
                                                  h: 3,
                                                ),
                                                LineupCSGO(
                                                  lineUpRows: controller.lineUpRows,
                                                ),
                                              ],
                                            )
                                          : SizedBox(
                                              child: Center(
                                                child: Text(
                                                  'Limited game data, try again later!',
                                                  style: TextStyle(color: kPastColor),
                                                ),
                                              ),
                                            ))),
                              Breather(
                                h: 3,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  else
                    NoStartCard(matchDetails: matchDetails),
                ],
              )),
        ),
      ),
    );
  }
}

class RoundsShimmer extends StatelessWidget {
  const RoundsShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        child: Text(
          'Rounds',
          style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal! * 4),
        ),
        baseColor: kBaseColor,
        highlightColor: kHighlightColor);
  }
}

//     Column(mainAxisAlignment: MainAxisAlignment.start, children: [
//   StreamLinkRow(match: match),
//   SizedBox(
//     height: SizeConfig.safeBlockVertical! * 2,
//   ),
//   CSGOMatchGamesRow(),
//   SizedBox(
//     height: SizeConfig.safeBlockVertical! * 2,
//   ),
//   CSGOGameTeamsCard(),
//   SizedBox(
//     height: SizeConfig.safeBlockVertical! * 2,
//   ),
//   cmgc.isLoadingMatchGamesList.value
//       ? MapNameCardShimmer()
//       : MapNameCard(),
//   SizedBox(
//     height: SizeConfig.safeBlockVertical! * 2,
//   ),
//   cmgc.isLoadingMatchGamesList.value
//       ? RoundsShimmer()
//       : (cmgc.isLoadingGameRounds.value
//           ? RoundsShimmer()
//           : (cmgc
//                       .matchGamesList
//                       .value[cmgc.selectedGameNumber.value]
//                       .hasCompleteStatistics !=
//                   'false'
//               ? Expanded(
//                   child: Obx(
//                     () => ListView.builder(
//                       itemCount: cmgc.gameRounds
//                           .value['normalTimeRounds'].length,
//                       itemBuilder: (context, index) => cmgc
//                                       .gameRounds
//                                       .value['normalTimeRounds']
//                                   [index] !=
//                               null
//                           ? RoundRow(
//                               round: cmgc.gameRounds
//                                       .value['normalTimeRounds']
//                                   [index])
//                           : SizedBox(
//                               child: Text('wtf'),
//                             ),
//                     ),
//                   ),
//                 )
//               : Container(
//                   height: SizeConfig.safeBlockVertical! * 20,
//                   width: SizeConfig.safeBlockHorizontal! * 90,
//                   child: Center(
//                     child: Text(
//                       'This Game Has Limited Data\n\nPlease Try Again Later.',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         color: Colors.grey,
//                         fontSize:
//                             SizeConfig.safeBlockVertical! * 2,
//                       ),
//                     ),
//                   ),
//                 ))),
//
// ],),
