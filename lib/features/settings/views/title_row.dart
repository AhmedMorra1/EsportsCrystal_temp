import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

///Tested
class TitleRow extends StatelessWidget {
  const TitleRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text('Settings',style: TextStyle(
          color: Colors.white,
          fontSize: 6.w,
          fontWeight: FontWeight.w500
      ),),
    );
  }
}
