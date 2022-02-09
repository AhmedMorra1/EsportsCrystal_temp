import 'package:esports_crystal/configs/size_config.dart';
import 'package:esports_crystal/features/match_details/league/controllers/league_controller.dart';
import 'package:esports_crystal/features/match_details/league/views/stream_link_row.dart';
import 'package:esports_crystal/helper_widgets/text_divider.dart';
import 'package:esports_crystal/features/schedule/models/match_details.dart';
import 'package:flutter/material.dart';
import 'package:esports_crystal/configs/consts.dart';
import 'package:get/get.dart';
import 'package:esports_crystal/helper_widgets/breather.dart';
import 'package:esports_crystal/features/match_details/league/views/teams_card.dart';
import 'package:esports_crystal/features/match_details/league/views/match_games_row.dart';
import 'package:esports_crystal/features/match_details/league/views/game_score_card.dart';
import 'package:esports_crystal/features/match_details/league/views/team_objectives.dart';
import 'package:esports_crystal/features/match_details/league/views/lineup.dart';

import 'no_start_card.dart';

class LeagueMatchGamesDetailsView extends StatelessWidget {
  const LeagueMatchGamesDetailsView({Key? key, required this.matchDetails}) : super(key: key);
  final MatchDetails matchDetails;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final controller = Get.put(LeagueMatchGamesContoller());
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
                      ? const StreamLinkRowShimmer()
                      : (controller.streamLink.value == 'https://www.twitch.tv'
                          ? const StreamLinkRow()
                          : StreamLinkRow(
                              streamUrl: controller.streamLink.value,
                            )),
                  const Breather(
                    h: 3,
                  ),
                  TextDivider(text: '${matchDetails.tournament}'),
                  const Breather(
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
                        child: Obx(() => ListView(
                              //mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                GameTeamsCard(
                                  matchDetails: matchDetails,
                                ),
                                Breather(
                                  h: 3,
                                ),
                                TextDivider(text: 'Best of ${matchDetails.bestOf}'),
                                controller.isLoadingMatchGamesList.value
                                    ? const GamesListShimmerRow()
                                    : (controller.matchGamesList.isNotEmpty
                                        ? GamesListRow(gamesList: controller.matchGamesList, selectedGameIndex: controller.selectedGameNumber.value)
                                        : const SizedBox()),
                                TextDivider(text: 'Game ${controller.selectedGameNumber.value + 1}'),
                                Breather(
                                  h: 3,
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
                                controller.isLoadingMatchGamesList.value
                                    ? LineupLeagueShimmer()
                                    : (controller.isLoadingPlayerData.value
                                        ? LineupLeagueShimmer()
                                        : (controller.lineUpRows.isNotEmpty
                                            ? Column(
                                                children: [
                                                  LineupLeague(
                                                    lineUpRows: controller.lineUpRows,
                                                  ),
                                                  Breather(
                                                    h: 3,
                                                  ),
                                                  controller.isLoadingMatchGamesList.value
                                                      ? GameTeamObjectivesShimmer()
                                                      : (controller.isLoadingObjectivesData.value
                                                          ? GameTeamObjectivesShimmer()
                                                          : GameTeamObjectives(
                                                              objectivesRowsData: controller.objectivesRowsData,
                                                              homeTeamSide: controller.gameScoreCardData['homeTeamSide'],
                                                            )),
                                                ],
                                              )
                                            : Center(
                                                child: Text(
                                                  'Limited game data, try again later!',
                                                  style: TextStyle(color: kPastColor),
                                                ),
                                              ))),
                                Breather(
                                  h: 5,
                                ),
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
