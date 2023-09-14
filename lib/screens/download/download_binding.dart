

import 'package:base_project_getx/screens/download/download_controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class DownloadBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<DownloadController>(DownloadController());
  }
}