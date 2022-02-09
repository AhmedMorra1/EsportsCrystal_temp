import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:esports_crystal/features/news/views/title_row.dart';
import 'package:sizer/sizer.dart';

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
    expect(find.text('News'), findsOneWidget);

  });
}