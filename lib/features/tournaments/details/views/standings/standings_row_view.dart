import 'package:esports_crystal/configs/consts.dart';
import 'package:esports_crystal/features/tournaments/details/models/standings_row.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

/// ( Tested )
class StandingsRowView extends StatelessWidget {
  const StandingsRowView({
    Key? key,
    required this.standingsRow,
  }) : super(key: key);

  final StandingsRow standingsRow;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 7.w,
          child: Row(
            children: [
              StandingsRowText(
                width: 10,
                text: standingsRow.position.toString(),
                centered: true,
                name: true,
              ),
              StandingsRowText(
                width: 50,
                text: standingsRow.name.toString(),
                centered: false,
                name: true,
              ),
              StandingsRowText(
                width: 10,
                text: standingsRow.matches.toString(),
                centered: true,
              ),
              StandingsRowText(
                width: 10,
                text: standingsRow.wins.toString(),
                centered: true,
              ),
              StandingsRowText(
                width: 10,
                text: standingsRow.losses.toString(),
                centered: true,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 1.w,
          child: Divider(),
        ),
      ],
    );
  }
}

class StandingsRowTitle extends StatelessWidget {
  const StandingsRowTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 7.w,
          child: Row(
            children: [
              StandingsRowText(
                width: 10,
                text: '',
                centered: true,
              ),
              StandingsRowText(
                width: 50,
                text: '',
                centered: false,
              ),
              StandingsRowText(
                width: 10,
                text: 'P',
                centered: true,
                title: true,
              ),
              StandingsRowText(
                width: 10,
                text: 'W',
                centered: true,
                title: true,
              ),
              StandingsRowText(
                width: 10,
                text: 'L',
                centered: true,
                title: true,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 1.w,
          child: Divider(),
        ),
      ],
    );
  }
}

class StandingsRowText extends StatelessWidget {
  const StandingsRowText({
    Key? key,
    required this.width,
    required this.text,
    required this.centered,
     this.title = false, this.name = false,
  }) : super(key: key);
  final int width;
  final String text;
  final bool centered;
  final bool title;
  final bool name;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 8.w,
      width: width.w,
      child: Center(
        child: Align(
          alignment: centered ? Alignment.center : Alignment.centerLeft,
          child: Text(
            text,
            style: TextStyle(
              fontSize: 4.w,
              color: title ? kPastColor : Colors.white,
              fontWeight: name ? FontWeight.w500 : FontWeight.w300,
            ),
          ),
        ),
      ),
    );
  }
}
