import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:esports_crystal/features/tournaments/details/controllers/tournament_detail_controller.dart';
import 'package:sizer/sizer.dart';
import 'package:cached_network_image/cached_network_image.dart';

class TournamentLogo extends StatelessWidget {
  const TournamentLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TournamentDetailController());
    return Container(
      width: 20.w,
      height: 20.w,
      child: FadeInImage(
        image: CachedNetworkImageProvider(
            controller.logoUrl.value,headers: controller.headers),
        placeholder: const AssetImage('assets/transparent.png',),
      ),//controller.isLoadingTournamentLogo.value ? Placeholder() : controller.tournamentLogoList[0],
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(2.w)),
        color: Colors.transparent,
      ),
    );
  }
}
