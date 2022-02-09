import 'package:esports_crystal/configs/consts.dart';
import 'package:esports_crystal/features/settings/controllers/settings_controller.dart';
import 'package:esports_crystal/services/analytics_helper.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:get/get.dart';

class ScheduleNotification extends StatelessWidget {
  const ScheduleNotification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SettingsController());
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Schedule Notification',
          style: TextStyle(
            color: Colors.white,
            fontSize: 4.5.w,
          ),
        ),
        Text(
          "Time to remind you to check today's schedule",
          style: TextStyle(
            color: kPastColor,
            fontSize: 3.5.w,
          ),
        ),
        TextButton(
          onPressed: () async {
            await Navigator.of(context).push(
              showPicker(
                context: context,
                value: controller.scheduleTimeOfDay.value,
                onChange: controller.setScheduleTime,
                okStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 4.w,
                  fontWeight: FontWeight.w500,
                ),
                cancelStyle: TextStyle(
                  color: kPastColor,
                  fontSize: 4.w,
                  fontWeight: FontWeight.w500,
                ),
                unselectedColor: kSelectedColor.withOpacity(.7),
                accentColor: kSelectedColor,
                themeData: ThemeData.dark().copyWith(
                  cardColor: kFrontColor,
                ),
              ),
            );
            logEvent(event: 'schedule_notification_changed');
          },
          child: Align(
            alignment: Alignment.center,
            child: Obx(()=>Text(
              controller.scheduleTimeOfDay.value.format(context),
              style: TextStyle(fontSize: 4.w, color: kSelectedColor),
            )),
          ),
        ),
        const Divider(),
      ],
    );
  }
}
