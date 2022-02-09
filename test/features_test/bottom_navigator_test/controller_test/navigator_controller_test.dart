import 'package:esports_crystal/features/bottom_navigator/controller/navigator_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  group('Navigator Controller', () {

    final controller = Get.put(NavigatorController());
    test('Check default value and when the method called the value change', () {
      expect(controller.tabIndex.value,0);
      controller.changeTabIndex(2);
      expect(controller.tabIndex.value,2);
    });
  });
}