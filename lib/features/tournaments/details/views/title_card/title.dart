import 'package:esports_crystal/features/tournaments/list/models/tournament_model.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TournamentTitle extends StatelessWidget {
  const TournamentTitle({Key? key, required this.tournament}) : super(key: key);
  final Tournament tournament;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60.w,
      child: Align(
        alignment: Alignment.centerLeft,
        child: FittedBox(
          child: Text(
            tournament.name!,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 7.w,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
