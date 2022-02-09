import 'package:esports_crystal/features/schedule/models/match_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:esports_crystal/helper_widgets/text_divider.dart';

void main() {
  testWidgets('ًWhen a TextDivider Widget is built, it shows the text in the middle', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const GetMaterialApp(
      home: Scaffold(
        body: TextDivider(text: 'Hello',),
      ),
    ));
    expect(find.text('     Hello     '), findsOneWidget);
  });
}