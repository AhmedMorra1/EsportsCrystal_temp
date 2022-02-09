import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TournamentsTitleRow extends StatelessWidget {
  const TournamentsTitleRow({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90.w,
      child: Text(
        'Tournaments',
        textAlign: TextAlign.start,
        style: TextStyle(
          fontSize: 6.w,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
