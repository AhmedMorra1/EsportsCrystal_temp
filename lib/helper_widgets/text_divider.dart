import 'package:esports_crystal/configs/consts.dart';
import 'package:flutter/material.dart';

class TextDivider extends StatelessWidget {
  const TextDivider({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Divider(
          color: kPastColor.withOpacity(.3),
        ),
        Center(
          child: Container(
            child: Text('     $text     ',style: TextStyle(color: kPastColor.withOpacity(.6)),),
            color: kBackColor,
          ),
        ),
      ],
    );
  }
}
