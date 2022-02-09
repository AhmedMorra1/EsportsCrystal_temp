import 'package:esports_crystal/configs/consts.dart';
import 'package:esports_crystal/features/tournaments/details/views/tournament_details.dart';
import 'package:esports_crystal/features/tournaments/list/models/tournament_model.dart';
import 'package:esports_crystal/services/analytics_helper.dart';
import 'package:flutter/material.dart';
import 'package:esports_crystal/configs/size_config.dart';
import 'package:esports_crystal/features/schedule/views/match_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

///(Tested)
class TournamentCard extends StatelessWidget {
  const TournamentCard({
    Key? key,
    required this.tournament,
    required this.matchList,
    required this.gameCode,
    required this.tournamentId,
  }) : super(key: key);

  /// Define the tournament name
  final String tournament;

  /// Define the tournament name
  final String tournamentId;

  /// Define the match list
  final List matchList;

  /// Define the game code
  final String gameCode;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      width: SizeConfig.safeBlockHorizontal! * 90,
      decoration: BoxDecoration(
        color: kBackColor, //Colors.black,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: (){
              logEvent(event: 'tournament_open_from_schedule', parameters: {
                'tournament': tournament,
              });
              Get.to(() => TournamentDetail(
                tournament: Tournament(id: int.parse(tournamentId), name: tournament),
                gameCode: gameCode,
              ));
            },
            child: Padding(
              padding: EdgeInsets.only(left: SizeConfig.safeBlockHorizontal! * 5),
              child: Text(
                tournament,
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                  fontSize: SizeConfig.safeBlockHorizontal! * 4,
                  fontWeight: FontWeight.w500,
                )),
              ),
            ),
          ),
          SizedBox(
            height: SizeConfig.safeBlockHorizontal! * 2,
          ),
          Center(
            child: Column(
              children: List.generate(
                matchList.length,
                (index) => MatchCard(gameCode: gameCode, matchDetails: matchList[index]),
              ),
            ),
          ),
          SizedBox(
            height: SizeConfig.safeBlockHorizontal! * 4,
          )
        ],
      ),
    );
  }
}
