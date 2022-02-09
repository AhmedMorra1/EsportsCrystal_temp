import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:esports_crystal/features/schedule/views/date_select_row.dart';
import 'package:sizer/sizer.dart';

void main(){
  testWidgets('Date Row and Calendar', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      Sizer(builder: (
          context,
          orientation,
          deviceType,
          ) {
        return const GetMaterialApp(
          home: Scaffold(
            body: DateSelectRow(),
          ),
        );
      }),
    );

    //find Today Text
    expect(find.text('Today'), findsOneWidget);
    //find Icon of selecting dates (of font awesome)
    expect(
        find.byWidgetPredicate((Widget widget) =>
        widget is FaIcon && widget.icon == FontAwesomeIcons.calendarAlt),
        findsOneWidget);

    //Tap the calendar icon and click cancel
    await tester.tap(find.byWidgetPredicate((Widget widget) =>
    widget is FaIcon && widget.icon == FontAwesomeIcons.calendarAlt));
    await tester.pump();

    //Verify that select date appeared
    expect(find.text('SELECT DATE'), findsOneWidget);
    expect(find.text('CANCEL'), findsOneWidget);
    expect(find.text('OK'), findsOneWidget);

    //this used to skip the timer opened for testing
    //await tester.pumpAndSettle(const Duration(microseconds: 1));
  });
}