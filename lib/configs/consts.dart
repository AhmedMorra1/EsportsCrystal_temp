import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'
;
const Map kGameNames = {'1571':'League of Legends','1572':'CS:GO','1570':'Dota 2'};

const Color kBackGroundColor = Colors.black;

/// Shimmer Colors
Color kBaseColor = Colors.grey.shade900;
const Color kHighlightColor = Colors.black;


/// Round Row Outcomes
const Map kOutcomes = {'0':'5 Eliminated','1':'Bomb Defused','2':'Target Bombed','3':'Time Expired',};

/// Round Row Outcomes Icons
const Map kOutcomesIcons = {'0':FontAwesomeIcons.skull,'1':FontAwesomeIcons.tools,'2':FontAwesomeIcons.bomb,'3':FontAwesomeIcons.hourglassEnd,};

/// Round Row Colors
const Color kTerroristsColor = Color(0xFF7D6608);
const Color kCounterTerroristsColor = Color(0xFF1B4F72);

/// Design Colors
const Color kBackColor = Color(0xFF070d17);
const Color kFrontColor = Color(0xFF182035);
const Color kPastColor = Color(0xFF9CA6B7);
const Color kSelectedColor = Color(0xFF513db0);
const Color kLiveColor = Color(0xFFed3044);

const Map kGameIcons = {
  '1571':'assets/icons8-league-of-legends-96.png','1572':'assets/icons8-counter-strike-200.png','1570':'assets/icons8-dota-2-96.png'
};