import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'game_choice_chip.dart';

///Tested
class GameSelectRow extends StatelessWidget {
  const GameSelectRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5.w,bottom:5.w,),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          GameIconChoice(gameName: 'League', gameId: '1571',),
          GameIconChoice(gameName: 'CS:GO', gameId: '1572',),
          GameIconChoice(gameName: 'Dota 2', gameId: '1570',),
        ],
      ),
    );
  }
}

