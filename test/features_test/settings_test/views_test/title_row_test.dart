import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:esports_crystal/features/settings/views/title_row.dart';
void main(){
  testWidgets('Title Row Builds', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      Sizer(builder: (
          context,
          orientation,
          deviceType,
          ) {
        return const GetMaterialApp(
          home: Scaffold(
            body: TitleRow(),
          ),
        );
      }),
    );

    //find Today Text
    expect(find.text('Settings'), findsOneWidget);

  });
}