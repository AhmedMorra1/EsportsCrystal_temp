import 'package:esports_crystal/configs/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:esports_crystal/features/tournaments/list/views/games_list_row.dart';
import 'package:sizer/sizer.dart';

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
  });

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
    expect(find.byWidget(Image.asset(kGameIcons['1571'],)), findsOneWidget);
    expect(find.text('CS:GO'), findsOneWidget);
    expect(find.text('Dota 2'), findsOneWidget);
  });
}

/// asset Image test fail