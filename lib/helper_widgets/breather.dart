import 'package:esports_crystal/configs/size_config.dart';
import 'package:flutter/material.dart';

class Breather extends StatelessWidget {
  const Breather({Key? key, this.h = 0, this.w = 0}) : super(key: key);
  final double? h;
  final double? w;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.safeBlockHorizontal! * h!,
      width: SizeConfig.safeBlockHorizontal! * w!,
    );
  }
}