import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:esports_crystal/features/schedule/views/game_select_row.dart';
import 'package:sizer/sizer.dart';

void main() {
  testWidgets('Game Select Row', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(Sizer(builder: (
      context,
      orientation,
      deviceType,
    ) {
      return const GetMaterialApp(
        home: Scaffold(
          body: GameSelectRow(),
        ),
      );
    }));
    //find games names text
    expect(find.text('League'), findsOneWidget);
    expect(find.text('CS:GO'), findsOneWidget);
    expect(find.text('Dota 2'), findsOneWidget);
  });
}

/// Asset Image fails the test
