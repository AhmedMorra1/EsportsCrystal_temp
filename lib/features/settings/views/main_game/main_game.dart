import 'package:esports_crystal/configs/consts.dart';
import 'package:esports_crystal/features/settings/views/main_game/game_select_row.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MainGame extends StatelessWidget {
  const MainGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Main Game',style: TextStyle(color: Colors.white,fontSize: 4.5.w,),),
        Text('Choose your main game across the app',style: TextStyle(color: kPastColor,fontSize: 3.5.w,),),
        const GameSelectRow(),
        const Divider(),
      ],
    );
  }
}
