import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:esports_crystal/features/news/views/feed_list_tile.dart';
import 'package:sizer/sizer.dart';

void main(){
  testWidgets('SubTitle Row Builds', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      Sizer(builder: (
          context,
          orientation,
          deviceType,
          ) {
        return const GetMaterialApp(
          home: Scaffold(
            body: Subtitle(subTitle: 'Ahmed',),
          ),
        );
      }),
    );

    //find Today Text
    expect(find.text('Ahmed'), findsOneWidget);

  });
}