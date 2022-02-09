import 'package:esports_crystal/configs/consts.dart';
import 'package:esports_crystal/features/settings/controllers/settings_controller.dart';
import 'package:esports_crystal/services/analytics_helper.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';

class MatchNotification extends StatelessWidget {
  const MatchNotification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SettingsController());
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Match Notification',
          style: TextStyle(
            color: Colors.white,
            fontSize: 4.5.w,
          ),
        ),
        Obx(() => Text(
              "Reminds you ${controller.minutes.value} minutes before the match",
              style: TextStyle(
                color: kPastColor,
                fontSize: 3.5.w,
              ),
            )),
        Row(
          children: [
            SizedBox(
              width: 5.w,
              child: const Center(
                  child: Text(
                '0',
                style: TextStyle(color: kSelectedColor),
              )),
            ),
            Expanded(
              child: Obx(() => Slider(
                    value: controller.minutes.value.toDouble(),
                    onChanged: (value) {
                      controller.setMinutes(value);
                      logEvent(event: 'match_notification',parameters: {'minutes':value});
                    },
                    min: 0,
                    max: 60,
                    activeColor: kSelectedColor,
                    inactiveColor: kSelectedColor.withOpacity(.5),
                    thumbColor: kSelectedColor,
                divisions: 12,
                  )),
            ),
            SizedBox(
              width: 5.w,
              child: const Center(
                  child: Text(
                '60',
                style: TextStyle(color: kSelectedColor),
              )),
            ),
          ],
        ),
        const Divider(),
      ],
    );
  }
}
