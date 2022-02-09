import 'package:esports_crystal/features/tournaments/details/controllers/tournament_detail_controller.dart';
import 'package:esports_crystal/features/tournaments/details/models/season.dart';
import 'package:esports_crystal/features/tournaments/details/views/title_card/logo.dart';
import 'package:esports_crystal/features/tournaments/details/views/title_card/seasons_menu.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:network_image_mock/network_image_mock.dart';

Widget makeTestableWidget() => Sizer(builder: (
      context,
      orientation,
      deviceType,
    ) {
      return GetMaterialApp(
        home: Scaffold(
          body: TournamentLogo(),
        ),
      );
    });

void main() {
  testWidgets(
    'should properly mock Image.network and not crash',
        (WidgetTester tester) async {
      mockNetworkImagesFor(()  =>  tester.pumpWidget(makeTestableWidget()));
    },
  );

}