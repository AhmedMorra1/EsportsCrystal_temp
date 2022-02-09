import 'package:esports_crystal/features/settings/views/schedule_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

void main(){
  testWidgets('Row Builds', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      Sizer(builder: (
          context,
          orientation,
          deviceType,
          ) {
        return const GetMaterialApp(
          home: Scaffold(
            body: ScheduleNotification(),
          ),
        );
      }),
    );

    //find Today Text
    expect(find.text('Schedule Notification'), findsOneWidget);

  });
}