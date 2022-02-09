import 'package:cached_network_image/cached_network_image.dart';
import 'package:esports_crystal/configs/consts.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webfeed/webfeed.dart';
import 'package:esports_crystal/services/analytics_helper.dart';

class FeedListTile extends StatelessWidget {
  const FeedListTile({Key? key, required this.item}) : super(key: key);
  final RssItem item;
  @override
  Widget build(BuildContext context) {
    int startIndex = item.description!.indexOf('src="');
    int endIndex = item.description!.contains('.jpg"')
        ? item.description!.indexOf('.jpg"')
        : (item.description!.contains('jpeg"') ? item.description!.indexOf('jpeg"') : item.description!.indexOf('.png"'));
    return ListTile(
      title: Title(
        title: item.title!,
      ),
      subtitle: Subtitle(
        subTitle: DateFormat.yMMMMd('en_US').add_jm().format(item.pubDate!),
      ),
      leading: ThumbnailPhoto(
        imageUrl: item.description!.substring(startIndex + 5, endIndex + 4),
      ),
      trailing: Icon(
        Icons.keyboard_arrow_right,
        color: kPastColor,
        size: 4.w,
      ),
      contentPadding: EdgeInsets.all(2.w),
      onTap: () {
        openFeed(item.link!);
        logEvent(event: 'news_opened');
      },
    );
  }
}

class Title extends StatelessWidget {
  const Title({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: 4.w, fontWeight: FontWeight.w500),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class Subtitle extends StatelessWidget {
  const Subtitle({Key? key, required this.subTitle}) : super(key: key);
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Text(
      subTitle,
      style: TextStyle(fontSize: 3.w, fontWeight: FontWeight.w100),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class ThumbnailPhoto extends StatelessWidget {
  const ThumbnailPhoto({Key? key, required this.imageUrl}) : super(key: key);
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      placeholder: (context, url) => Image.asset('assets/transparent.png'),
      imageUrl: imageUrl,
      height: 50,
      width: 70,
      alignment: Alignment.center,
      fit: BoxFit.fill,
    );
  }
}

Future<void> openFeed(String url) async {
  if (await canLaunch(url)) {
    await launch(
      url,
      forceSafariVC: true,
      forceWebView: true,
    );
    return;
  }
}
