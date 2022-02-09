import 'package:esports_crystal/configs/consts.dart';
import 'package:esports_crystal/features/match_details/csgo/controllers/csgo_controller.dart';
import 'package:esports_crystal/features/match_details/csgo/views/details_view.dart';
import 'package:esports_crystal/features/match_details/dota/controllers/dota_controller.dart';
import 'package:esports_crystal/features/match_details/dota/views/details_view.dart';
import 'package:esports_crystal/features/match_details/league/controllers/league_controller.dart';
import 'package:esports_crystal/features/match_details/league/views/details_view.dart';
import 'package:flutter/material.dart';
import 'package:esports_crystal/features/schedule/models/match_details.dart';
import 'package:esports_crystal/services/notifications_helper.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:esports_crystal/configs/size_config.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:esports_crystal/services/analytics_helper.dart';
import 'package:sizer/sizer.dart';
import 'package:auto_size_text/auto_size_text.dart';

///(Tested)
class MatchCard extends StatefulWidget {
  const MatchCard(
      {Key? key, required this.gameCode, required this.matchDetails})
      : super(key: key);

  /// Define a Match Details object
  final MatchDetails matchDetails;

  /// define a game type
  final String gameCode;

  @override
  State<MatchCard> createState() => _MatchCardState();
}

class _MatchCardState extends State<MatchCard> {
  Future<void> _checkNotification(String matchId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? checker = prefs.getBool(matchId);
    isNotified = checker;
  }

  void _addNotificationId(String matchId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(matchId, true);
    _checkNotification(widget.matchDetails.id!);
  }

  void _removeNotificationId(String matchId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(matchId, false);
  }

  bool? isNotified;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void showSnackBar(
      String msg,
      ) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final lmgc = Get.put(LeagueMatchGamesContoller());
    final dmgc = Get.put(DotaMatchGamesContoller());
    final cmgc = Get.put(CSGOMatchGamesContoller());
    Color statusColor = widget.matchDetails.status == 'finished'
        ? kPastColor//Colors.grey
        : (widget.matchDetails.status == 'canceled' ||
        widget.matchDetails.status == 'postponed'
        ? kPastColor//Colors.grey
        : Colors.white);
    var matchStartTime = DateTime.fromMillisecondsSinceEpoch(
        int.parse(widget.matchDetails.startTimestamp!) * 1000)
        .toString()
        .substring(11, 16);
    var matchStartTimeDay = DateTime.fromMillisecondsSinceEpoch(
        int.parse(widget.matchDetails.startTimestamp!) * 1000)
        .toString()
        .substring(0, 10);
    return InkWell(
      onTap: () async {
        //print('Match Id is ${widget.matchDetails.id}');
        if (widget.gameCode == '1571') {
          lmgc.updateEveryThing(widget.matchDetails);
          Get.to(() => LeagueMatchGamesDetailsView(
            matchDetails: widget.matchDetails,
          ));
          logEvent(event: 'opened_game_details_1571');
        } else if (widget.gameCode == '1570') {
          dmgc.updateEveryThing(widget.matchDetails);
          Get.to(() => DotaMatchGamesDetailsView(
            matchDetails: widget.matchDetails,
          ));
          logEvent(event: 'opened_game_details_1570');
        } else if (widget.gameCode == '1572') {
          cmgc.updateEveryThing(widget.matchDetails);
          Get.to(() => CSGOMatchGamesDetailsView(
            matchDetails: widget.matchDetails,
          ));
          logEvent(event: 'opened_game_details_1572');
        }
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: SizeConfig.safeBlockHorizontal! * 2),
        child: Container(
          width: SizeConfig.safeBlockHorizontal! * 90,
          height: SizeConfig.safeBlockVertical! * 8,
          decoration: BoxDecoration(
              color: kFrontColor,//Colors.grey.shade900,
              borderRadius:
              BorderRadius.circular(SizeConfig.safeBlockHorizontal! * 2)),
          child: Row(
            children: [
              Padding(
                padding:
                EdgeInsets.only(left: SizeConfig.safeBlockHorizontal! * 2),
                child: SizedBox(
                  width: SizeConfig.safeBlockHorizontal! * 16,
                  height: SizeConfig.safeBlockVertical! * 8,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Center(
                          child: Text(
                            matchStartTimeDay,
                            style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                  color: kPastColor,//Colors.grey,
                                  fontSize: SizeConfig.safeBlockHorizontal! * 3,
                                )),
                          )),
                      Center(
                          child: Text(
                            matchStartTime,
                            style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                  color: kPastColor,//Colors.grey,
                                  fontSize: SizeConfig.safeBlockHorizontal! * 3,
                                )),
                          )),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: SizeConfig.safeBlockHorizontal! * 60,
                height: SizeConfig.safeBlockVertical! * 8,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: SizeConfig.safeBlockHorizontal! * 2,
                      right: SizeConfig.safeBlockHorizontal! * 2),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: SingleChildScrollView( 
                              child: Text(
                                widget.matchDetails.homeTeam.toString(),
                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                    fontSize: SizeConfig.safeBlockHorizontal! * 4,
                                    color: statusColor,
                                  ),
                                ),
                              ),
                              scrollDirection: Axis.horizontal,
                            ),
                          ),
                          if (widget.matchDetails.status == 'canceled' ||
                              widget.matchDetails.status == 'postponed')
                            Text('')
                          else if (widget.matchDetails.status != 'notstarted')
                            Text(
                              widget.matchDetails.homeScore.toString() != 'null'
                                  ? widget.matchDetails.homeScore.toString()
                                  : '0',
                              style: GoogleFonts.robotoMono(
                                textStyle: TextStyle(
                                  fontSize: SizeConfig.safeBlockHorizontal! * 4,
                                  color: statusColor,
                                ),
                              ),
                              textAlign: TextAlign.center,
                            )
                          else
                            Text(''),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: SingleChildScrollView(
                              child: Text(
                                widget.matchDetails.awayTeam.toString(),
                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                    fontSize: SizeConfig.safeBlockHorizontal! * 4,
                                    color: statusColor,
                                  ),
                                ),
                              ),
                              scrollDirection: Axis.horizontal,
                            ),
                          ),
                          if (widget.matchDetails.status == 'canceled' ||
                              widget.matchDetails.status == 'postponed')
                            Text('')
                          else if (widget.matchDetails.status != 'notstarted')
                            Text(
                              widget.matchDetails.awayScore.toString() != 'null'
                                  ? widget.matchDetails.awayScore.toString()
                                  : '0',
                              style: GoogleFonts.robotoMono(
                                textStyle: TextStyle(
                                  fontSize: SizeConfig.safeBlockHorizontal! * 4,
                                  color: statusColor,
                                ),
                              ),
                              textAlign: TextAlign.center,
                            )
                          else
                            Text(''),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              if (widget.matchDetails.status == 'inprogress')
                SizedBox(
                  width: SizeConfig.safeBlockHorizontal! * 10,
                  height: SizeConfig.safeBlockVertical! * 8,
                  child: Center(
                    child: Container(
                      width: SizeConfig.safeBlockHorizontal! * 8,
                      height: SizeConfig.safeBlockVertical! * 2,
                      child: Center(
                          child: Text(
                            'Live',
                            style: TextStyle(color: Colors.white,fontSize:SizeConfig.safeBlockVertical! * 1.3, ),
                            textAlign: TextAlign.center,
                          )),
                      decoration: BoxDecoration(
                          color: kLiveColor,
                          borderRadius: BorderRadius.circular(SizeConfig.safeBlockHorizontal! * 1)
                      ),
                    ),
                  ),
                )
              else if (widget.matchDetails.status == 'finished')
                SizedBox(
                  width: SizeConfig.safeBlockHorizontal! * 12,
                  height: SizeConfig.safeBlockVertical! * 8,
                  child: Padding(
                    padding: EdgeInsets.only(right: SizeConfig.safeBlockHorizontal! * 2),
                    child: Center(
                        child: Text(
                          'FT',
                          style: TextStyle(color: kPastColor,fontSize:SizeConfig.safeBlockVertical! * 1.5,),
                          textAlign: TextAlign.center,
                        )),
                  ),
                )
              else if (widget.matchDetails.status == 'canceled')
                  SizedBox(
                    width: SizeConfig.safeBlockHorizontal! * 12,
                    height: SizeConfig.safeBlockVertical! * 8,
                    child: Padding(
                      padding: EdgeInsets.only(right: SizeConfig.safeBlockHorizontal! * 2),
                      child: Center(
                          child: Text(
                            'CL',
                            style: TextStyle(color: kPastColor,fontSize:SizeConfig.safeBlockVertical! * 1.5,),
                            textAlign: TextAlign.center,
                          )),
                    ),
                  )
                else if (widget.matchDetails.status == 'postponed')
                    SizedBox(
                      width: SizeConfig.safeBlockHorizontal! * 12,
                      height: SizeConfig.safeBlockVertical! * 8,
                      child: Padding(
                        padding: EdgeInsets.only(right: SizeConfig.safeBlockHorizontal! * 2),
                        child: Center(
                            child: Text(
                              'PP',
                              style: TextStyle(color: kPastColor,fontSize:SizeConfig.safeBlockVertical! * 1.5,),
                              textAlign: TextAlign.center,
                            )),
                      ),
                    )
                  else if (DateTime.fromMillisecondsSinceEpoch(
                        int.parse(widget.matchDetails.startTimestamp!) * 1000)
                        .isAfter(DateTime
                        .now())) //widget.matchDetails.status == 'notstarted')
                      FutureBuilder(
                        future: _checkNotification(widget.matchDetails.id!),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState != ConnectionState.done) {
                            // Future hasn't finished yet, return a placeholder
                            return SizedBox(
                              width: SizeConfig.safeBlockHorizontal! * 12,
                              height: SizeConfig.safeBlockVertical! * 8,
                            );
                          }
                          if (isNotified == true) {
                            return InkWell(
                              onTap: () {
                                /// remove notification
                                NotificationsHelper.cancel(
                                    int.parse(widget.matchDetails.id!));

                                /// remove notification id to shared preferences
                                _removeNotificationId(widget.matchDetails.id!);

                                setState(() {
                                  isNotified = false;
                                });

                                /// Show snack bar to confirm
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Notification Cancelled!'),
                                  ),
                                );
                              },
                              child: SizedBox(
                                width: SizeConfig.safeBlockHorizontal! * 10,
                                height: SizeConfig.safeBlockVertical! * 8,
                                child: Icon(
                                  Icons.notifications_active,
                                  color: kPastColor,
                                ),
                              ),
                            );
                          } else {
                            return InkWell(
                              onTap: () {
                                /// add notification
                                NotificationsHelper.showScheduledNotifications(
                                    servingTime: DateTime.fromMillisecondsSinceEpoch(
                                        int.parse(
                                            widget.matchDetails.startTimestamp!) *
                                            1000),
                                    id: int.parse(widget.matchDetails.id!),
                                    title: 'Match Time',
                                    body:
                                    '${widget.matchDetails.homeTeam} vs ${widget.matchDetails.awayTeam} is about to start.', payload: widget.matchDetails.id.toString());

                                /// add notification id to shared preferences
                                _addNotificationId(widget.matchDetails.id!);

                                setState(() {
                                  isNotified = true;
                                });

                                /// Show snack bar to confirm
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                        'You will be notified when the match is about to start.'),
                                  ),
                                );
                              },
                              child: SizedBox(
                                width: SizeConfig.safeBlockHorizontal! * 10,
                                height: SizeConfig.safeBlockVertical! * 8,
                                child: Icon(
                                  Icons.notifications_none_outlined,
                                  color: kPastColor,
                                ),
                              ),
                            );
                          }
                          //return Text('Loading Complete');
                        },
                      )
                    else if (widget.matchDetails.status == 'ended')
                        SizedBox(
                          child: Text('FT'),
                        )
            ],
          ),
        ),
      ),
    );
  }
}
