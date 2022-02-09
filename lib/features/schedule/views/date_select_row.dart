import 'package:esports_crystal/configs/consts.dart';
import 'package:esports_crystal/configs/size_config.dart';
import 'package:esports_crystal/features/schedule/controllers/schedule_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:esports_crystal/services/analytics_helper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

/// (Tested)
class DateSelectRow extends StatelessWidget {
  const DateSelectRow({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final controller = Get.put(ScheduleController());
    return SizedBox(
      height: 12.w,
      child: Padding(
        padding: EdgeInsets.all(2.w),
        /// Date Selector
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding:  EdgeInsets.only(left: SizeConfig.safeBlockHorizontal! * 2),
              child: Obx(() => Text(
                    controller.selectedDateText.value,
                    style: TextStyle(
                        fontSize: 6.w,
                        fontWeight: FontWeight.w600),
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(right: SizeConfig.safeBlockHorizontal! * 2),
              child: InkWell(
                onTap: () async {
                  /// wait for date selection
                  final DateTime? selected = await showDatePicker(
                    context: context,
                    firstDate: DateTime(2010),
                    initialDate: controller.selectedDate.value,
                    lastDate: DateTime.now().add(const Duration(days: 365)),
                    builder: (context,child)=>Theme(
                      data: ThemeData().copyWith(
                        dialogBackgroundColor: kFrontColor,
                        colorScheme: const ColorScheme.dark().copyWith(
                          primary: kSelectedColor,
                          onPrimary: Colors.white,
                          surface: kBackColor,
                          onSurface: Colors.white,
                        ),
                        dialogTheme: const DialogTheme(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(20))),
                        ),
                        textButtonTheme: TextButtonThemeData(
                          style: TextButton.styleFrom(
                            primary: Colors.white, // button text color
                          ),
                        ),
                      ),
                    child: child!,
                    ),
                  );
                  /// check the selected date and act upon it to display matches and date text
                  if (selected != null && selected != controller.selectedDate.value) {
                    controller.updateSelectedDate(selected);
                  }
                  /// change the selected date text based on the date
                  if (controller.selectedDate.value.toString().substring(0, 10) ==
                      DateTime.now().toString().substring(0, 10)) {
                    controller.updateSelectedDateText('Today');
                    logEvent(event: 'date_selected_today');
                  } else if (controller.selectedDate.value.toString().substring(0, 10) ==
                      DateTime.now()
                          .add(const Duration(days: 1))
                          .toString()
                          .substring(0, 10)) {
                    controller.updateSelectedDateText('Tomorrow');
                    logEvent(event: 'date_selected_tomorrow');
                  } else if (controller.selectedDate.value.toString().substring(0, 10) ==
                      DateTime.now()
                          .subtract(const Duration(days: 1))
                          .toString()
                          .substring(0, 10)) {
                    controller.updateSelectedDateText('Yesterday');
                    logEvent(event: 'date_selected_yesterday');
                  } else {
                    controller.updateSelectedDateText(
                        DateFormat('yMMMMd').format(controller.selectedDate.value));
                    logEvent(event: 'date_selected_different');
                  }
                  // Analytics
                  logEvent(event: 'date_selected');
                  logEvent(event: 'select_date_press');
                },
                child: FaIcon(
                  FontAwesomeIcons.calendarAlt,
                  size: SizeConfig.safeBlockHorizontal! * 6,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
