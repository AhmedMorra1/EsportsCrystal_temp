import 'package:esports_crystal/configs/consts.dart';
import 'package:esports_crystal/configs/size_config.dart';
import 'package:esports_crystal/features/match_details/dota/controllers/dota_controller.dart';
import 'package:esports_crystal/features/schedule/models/match_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:esports_crystal/helper_widgets/breather.dart';
import 'package:esports_crystal/features/match_details/dota/views/stream_link_row.dart';

import 'game_score_card.dart';
import 'lineup.dart';
import 'no_start_card.dart';
import 'team_objectives.dart';
import 'match_games_row.dart';
import 'teams_card.dart';
import 'package:esports_crystal/helper_widgets/text_divider.dart';

class DotaMatchGamesDetailsView extends StatelessWidget {
  const DotaMatchGamesDetailsView({Key? key, required this.matchDetails})
      : super(key: key);
  final MatchDetails matchDetails;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final controller = Get.put(DotaMatchGamesContoller());
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
          child: Obx(()=>Column(
            children: [
              //StreamLinkRow(match: match),
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
                  onRefresh: ()  { return controller.updateEveryThing(matchDetails); },
                  child: Obx(() => ListView(
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
                              : GamesListRow(
                                  gamesList: controller.matchGamesList,
                                  selectedGameIndex:
                                      controller.selectedGameNumber.value),
                          TextDivider(
                              text: 'Game ${controller.selectedGameNumber.value+1}'),
                          Breather(
                            h: 2,
                          ),
                          controller.isLoadingMatchGamesList.value
                              ? GameScoreCardShimmer()
                              : (controller.isLoadingObjectivesData.value
                                  ? GameScoreCardShimmer()
                                  : GameScoreCard(
                                      cardData: controller.gameScoreCardData,
                                    )),
                          Breather(
                            h: 3,
                          ),
                          TextDivider(text: 'Lineups'),
                          Breather(
                            h: 3,
                          ),
                          controller.isLoadingMatchGamesList.value
                              ? LineupLeagueShimmer()
                              : (controller.isLoadingObjectivesData.value
                              ? GameTeamObjectivesShimmer()
                              : (controller.isLoadingPlayerData.value
                                  ? LineupLeagueShimmer()
                                  : (controller.lineUpRows.isNotEmpty ? Column(
                                    children: [
                                      LineupDota(
                                          lineUpRows: controller.lineUpRows,
                            homeTeamSide:
                            controller.gameScoreCardData['homeTeamSide'],
                                        ),
                                      Breather(
                                        h: 3,
                                      ),
                                      TextDivider(text: 'Objectives'),
                                      Breather(
                                        h: 3,
                                      ),
                                      controller.isLoadingMatchGamesList.value
                                          ? GameTeamObjectivesShimmer()
                                          : (controller.isLoadingObjectivesData.value
                                          ? GameTeamObjectivesShimmer()
                                          : (GameTeamObjectives(
                                        objectivesRowsData: controller.objectivesRowsData,
                                        homeTeamSide:
                                        controller.gameScoreCardData['homeTeamSide'],
                                      ))),
                                    ],
                                  ):Center(child: Text('Limited game data, Try again later.',style: TextStyle(color: kPastColor),),)))),

                        ],
                      )),
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
