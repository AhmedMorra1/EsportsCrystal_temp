import 'package:esports_crystal/configs/consts.dart';
import 'package:esports_crystal/configs/size_config.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'dart:io' show Platform;
import 'package:url_launcher/url_launcher.dart';
import 'package:esports_crystal/services/analytics_helper.dart';
import 'package:get/get.dart';

///(tested)
class StreamLinkRow extends StatelessWidget {
  const StreamLinkRow({Key? key, this.streamUrl}) : super(key: key);
  final String? streamUrl;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            Get.back();
            logEvent(event: 'back_from_league_match_details');
          },
          child: Platform.isIOS
              ? Icon(Icons.arrow_back_ios_new)
              : Icon(Icons.arrow_back),
        ),
        Spacer(),
        streamUrl != null
            ? InkWell(
                onTap: () async {
                  logEvent(
                    event: 'stream_link_opened',
                    parameters: {'gameId': '1571'},
                  );
                  await canLaunch(streamUrl!)
                      ? await launch(
                          streamUrl!,
                          forceSafariVC: true,
                          forceWebView: true,
                          enableJavaScript: true,
                        )
                      : throw 'Could not launch ${streamUrl}';
                },
                child: Icon(Icons.tv),
              )
            : SizedBox(),
      ],
    );
  }
}

class StreamLinkRowShimmer extends StatelessWidget {
  const StreamLinkRowShimmer({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            Get.back();
            logEvent(event: 'back_from_league_match_details');
          },
          child: Platform.isIOS
              ? Icon(Icons.arrow_back_ios_new)
              : Icon(Icons.arrow_back),
        ),
        Spacer(),
        Shimmer.fromColors(
          child: Icon(Icons.tv),
          baseColor: kBaseColor,
          highlightColor: kHighlightColor,
        ),
      ],
    );
  }
}
