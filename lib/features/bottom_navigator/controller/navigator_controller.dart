import 'package:esports_crystal/services/analytics_helper.dart';
import 'package:get/get.dart';

class NavigatorController extends GetxController{

  var tabIndex = 0.obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
    logEvent(event: '${tabIndex.value}_opened');
  }

}