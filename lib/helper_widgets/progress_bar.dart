import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar(
      {Key? key,
      required this.height,
      required this.width,
      required this.baseColor,
      required this.progressColor,
      required this.percentage,})
      : super(key: key);
  final Color progressColor;
  final Color baseColor;
  final double width;
  final double height;
  final double percentage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: height,
          width: width,

            decoration: BoxDecoration(
              color: baseColor,
              borderRadius: BorderRadius.all(
                Radius.circular(height/2),
              ),
            ),
        ),
        Container(
          height: height,
          width: percentage.isNaN ?  0: width*percentage ,
          decoration: BoxDecoration(
            color: progressColor,
            borderRadius: BorderRadius.all(
              Radius.circular(height/2),
            ),
          ),
        ),
      ],
    );
  }
}
