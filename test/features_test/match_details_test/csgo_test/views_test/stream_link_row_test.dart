import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:esports_crystal/features/match_details/csgo/views/stream_link_row.dart';

void main() {
  group('Stream Link Row', () {
    testWidgets('Stream Link Row With URL', (WidgetTester tester) async {
      await tester.pumpAndSettle(const Duration(seconds: 5));
      // Build our app and trigger a frame.
      await tester.pumpWidget(const GetMaterialApp(
        home: Scaffold(
          body: StreamLinkRow(
            streamUrl: 'google.com',
          ),
        ),
      ));
      //find games names text
      expect(find.byIcon(Icons.tv), findsOneWidget);
      expect(find.byIcon(Icons.arrow_back), findsOneWidget);
      //this used to skip the timer opened for testing
      await tester.pumpAndSettle(const Duration(microseconds: 1));
    });

    testWidgets('Stream Link Row Without URL', (WidgetTester tester) async {
      await tester.pumpAndSettle(const Duration(seconds: 5));
      // Build our app and trigger a frame.
      await tester.pumpWidget(const GetMaterialApp(
        home: Scaffold(
          body: StreamLinkRow(),
        ),
      ));
      //find games names text
      expect(find.byIcon(Icons.tv), findsNothing);
      expect(find.byIcon(Icons.arrow_back), findsOneWidget);
      //this used to skip the timer opened for testing
      await tester.pumpAndSettle(const Duration(microseconds: 1));
    });
  });
}