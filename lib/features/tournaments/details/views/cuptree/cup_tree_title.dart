import 'package:esports_crystal/configs/consts.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

/// Tested
class CupTreeStandingsTitle extends StatelessWidget {
  const CupTreeStandingsTitle({
    Key? key, required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: TextStyle(
          color: kPastColor,
          fontSize: 4.w,
        ),
      ),
    );
  }
}
