import 'package:esports_crystal/features/tournaments/details/views/cuptree/cup_tree_title.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

void main() {
  testWidgets('When title build it shows title', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(Sizer(builder: (
        context,
        orientation,
        deviceType,
        ) {
      return const GetMaterialApp(
        home: Scaffold(
          body: CupTreeStandingsTitle(title: 'Title',),
        ),
      );
    }));
    expect(find.text('Title'), findsOneWidget);
  });
}
