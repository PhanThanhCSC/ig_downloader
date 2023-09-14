import 'package:base_project_getx/screens/splash/splash_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:base_project_getx/core/base/base_view.dart';

import '../../core/base/mixin_base_page.dart';
import '../../core/widget/custom_app_bar.dart';

class SplashPage extends BaseView<SplashController> with BasePage {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(
      appBarTitleText: 'Intro',
    );
  }

  @override
  Widget body(BuildContext context) {
    // final controller = Get.find<IntroController>();
    return Scaffold(
    );
  }
}