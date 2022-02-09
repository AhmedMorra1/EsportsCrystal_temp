import 'package:esports_crystal/configs/consts.dart';
import 'package:esports_crystal/features/news/controllers/news_controller.dart';
import 'package:esports_crystal/features/news/views/title_row.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'feed_list.dart';
import 'game_select_row.dart';
import 'package:get/get.dart';

class NewsFeed extends StatelessWidget {
  const NewsFeed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NewsController());
    controller.refreshNews();
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackColor,
        body: Padding(
          padding:  EdgeInsets.all(5.w),
          child: Column(
            children: const [
              TitleRow(),
              GameSelectRow(),
              FeedList(),
            ],
          ),
        ),
      ),
    );
  }
}

