import 'package:base_project_getx/screens/home/home_controller.dart';
import 'package:base_project_getx/screens/tab/tab_controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class TabBinding extends Bindings {
  @override
  void dependencies() {
    print("=======>put home");
    Get.put<TabHomeController>(TabHomeController());
  }
}
