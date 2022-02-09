import 'package:esports_crystal/features/news/controllers/news_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  group('News Controller', () {

   final sc = Get.put(NewsController());

    test('Default values"', () {
      expect(sc.gameId.value, '1571');
      expect(sc.dotLinks,{
        '1571':'https://dotesports.com/league-of-legends/feed',
        '1572':'https://dotesports.com/counter-strike/feed',
        '1570':'https://dotesports.com/dota-2/feed',
      });
      expect(sc.feedLink.value, 'https://dotesports.com/league-of-legends/feed');
      expect(sc.isLoading.value, false);
      sc.updateGameId('1572');
      expect(sc.gameId.value, '1572');
      expect(sc.feedLink.value, 'https://dotesports.com/counter-strike/feed');
    });

  });
}

/// Shared Preferences won't load the test