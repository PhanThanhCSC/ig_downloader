import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../core/base/base_controller.dart';
import '../../routes/app_pages.dart';

class TabHomeController extends BaseController {

  var currentIndex = 0.obs;
  var counter = 0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  onClickDetail() {
    Get.toNamed(AppRoutes.TAB);
    update();
  }

  changerTab() {
    counter.value++;
    update();
  }

  selectTab(int index) {
    currentIndex.value = index;
    update();
  }
}