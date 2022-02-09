import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:esports_crystal/features/tournaments/list/views/title_row.dart';

void main() {
  testWidgets('When the tournaments row title build it shows tournaments text', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(Sizer(builder: (
      context,
      orientation,
      deviceType,
    ) {
      return const GetMaterialApp(
        home: Scaffold(
          body: TournamentsTitleRow(),
        ),
      );
    }));
    expect(find.text('Tournaments'), findsOneWidget);
  });
}
