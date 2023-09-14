import 'package:base_project_getx/core/base/base_view.dart';
import 'package:base_project_getx/core/values/app_colors.dart';
import 'package:base_project_getx/core/widget/custom_app_bar.dart';
import 'package:base_project_getx/screens/home/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

import '../../core/base/mixin_base_page.dart';
import '../../customwidget/tab_bar/bottom_navy_bar.dart';
import 'tab_controller.dart';

class TabPage extends BaseView<TabHomeController> with BasePage {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(
      appBarTitleText: 'Intro',
    );
  }

  @override
  Widget body(BuildContext context) {
    return Scaffold(
      body: _optionController(context),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: controller.currentIndex.value,
        showElevation: true,
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        onItemSelected: (index) => {controller.selectTab(index)},
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: Image.asset(
              "images/ic_tab_clock.png",
              width: 26,
              height: 26,
            ),
            title: Text(
              'Igsnap',
              style: TextStyle(fontSize: 20),
            ),
            activeColor: AppColors.vionetColor,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Image.asset(
              "images/ic_tab_history_new.png",
              width: 26,
              height: 26,
            ),
            title: Text(''),
            activeColor: AppColors.grayTextColor,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Image.asset(
              "images/ic_tab_setting.png",
              width: 26,
              height: 26,
            ),
            title: Text(''),
            activeColor: AppColors.grayTextColor,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _optionController(BuildContext context) {
    final controller = Get.find<TabHomeController>();
    switch (controller.counter.value) {
      case 0:
        return HomePage();
      case 1:
        return HomePage().build(context);
      case 2:
        return HomePage().build(context);
      default:
        return HomePage().build(context);
    }
  }
}
