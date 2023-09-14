import 'package:base_project_getx/screens/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'api_rest/api_repository.dart';

class AppBinding extends Bindings {
  @override
  @override
  void dependencies() async {
    Get.put(ApiRepository(), permanent: true);
  }
}
