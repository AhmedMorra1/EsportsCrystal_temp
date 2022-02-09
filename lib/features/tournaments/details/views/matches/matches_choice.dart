// import 'package:esports_crystal/configs/consts.dart';
// import 'package:esports_crystal/features/tournaments/details/controllers/tournament_detail_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:esports_crystal/services/analytics_helper.dart';
// import 'package:sizer/sizer.dart';
//
//
// class MatchChoiceContainer extends StatelessWidget {
//   const MatchChoiceContainer({
//     Key? key,
//     required this.name,
//     required this.isNext,
//     required this.isRight,
//   }) : super(key: key);
//   final String name;
//   final bool isNext;
//   final bool isRight;
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(TournamentDetailController());
//     return InkWell(
//       onTap: (){
//         controller.changeMatchesType();
//         logEvent(
//           event: 'next_Last_selected',
//           parameters: {'type': name},
//         );
//       },
//       child: Obx(()=>Container(
//         height: 3.5.h,
//         width: 25.w,
//         decoration: BoxDecoration(
//             color: controller.isUpcoming == isNext ? kSelectedColor : kFrontColor, //Colors.grey.shade900,
//             borderRadius: isRight
//                 ? BorderRadius.only(
//               bottomRight: Radius.circular(
//                 2.w,
//               ),
//               topRight: Radius.circular(
//                 2.w,
//               ),
//             )
//                 : BorderRadius.only(
//               bottomLeft: Radius.circular(
//                 2.w,
//               ),
//               topLeft: Radius.circular(
//                 2.w,
//               ),
//             )),
//         child: Center(
//           child: Text(
//             name,
//             style: TextStyle(
//               fontSize: 4.w,
//               color: controller.isUpcoming == isNext ? Colors.white : kPastColor,
//             ),
//           ),
//         ),
//       )),
//     );
//   }
// }
