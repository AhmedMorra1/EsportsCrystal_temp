import 'package:esports_crystal/configs/consts.dart';
import 'package:esports_crystal/features/bottom_navigator/controller/navigator_controller.dart';
import 'package:esports_crystal/features/news/views/news_feed.dart';
import 'package:esports_crystal/features/schedule/views/schedule_view.dart';
import 'package:esports_crystal/features/settings/controllers/settings_controller.dart';
import 'package:esports_crystal/features/settings/views/settings_page.dart';
import 'package:esports_crystal/features/tournaments/list/views/tournaments_list_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigator extends StatelessWidget {
  const BottomNavigator({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigatorController());
    return SafeArea(
      child: Scaffold(
        body: Obx(()=>IndexedStack(
          index: controller.tabIndex.value,
          children: const [
            ScheduleView(),
            TournamentsListPage(),
            NewsFeed(),
            Settings(),
          ],
        )),
        bottomNavigationBar: Obx(()=>BottomNavigationBar(
          items: [
            _bottomNavigationBarItem(icon: Icons.event_note, label: 'Schedule'),
            _bottomNavigationBarItem(icon: Icons.emoji_events, label: 'Tournaments'),
            _bottomNavigationBarItem(icon: Icons.article, label: 'News'),
            _bottomNavigationBarItem(icon: Icons.settings, label: 'Settings'),
          ],
          unselectedItemColor: kPastColor,
          selectedItemColor: kSelectedColor,
          onTap: controller.changeTabIndex,
          currentIndex: controller.tabIndex.value,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          backgroundColor: kBackColor,
          elevation: 0,
        )),
      ),
    );
  }

  _bottomNavigationBarItem({
    required IconData icon,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }
}
