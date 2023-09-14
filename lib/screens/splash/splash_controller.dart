import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../core/base/base_controller.dart';
import '../../routes/app_pages.dart';

class SplashController extends BaseController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  onClickDetail() {
    Get.toNamed(AppRoutes.DETAIL);
  }
}