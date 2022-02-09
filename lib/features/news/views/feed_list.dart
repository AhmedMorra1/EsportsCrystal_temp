import 'package:esports_crystal/configs/consts.dart';
import 'package:esports_crystal/features/news/controllers/news_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'feed_list_tile.dart';

class FeedList extends StatelessWidget {
  const FeedList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NewsController());
    return Obx(()=>Container(
      child: controller.isLoading.value
          ? const Center(
              child: CircularProgressIndicator(
                color: kPastColor,
              ),
            )
          : Expanded(
            child: Obx(()=>ListView.builder(
                itemCount: controller.feed.value.items!.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = controller.feed.value.items![index];
                  return FeedListTile(
                    item: item,
                  );
                },
              )),
          ),
    ));
  }
}
