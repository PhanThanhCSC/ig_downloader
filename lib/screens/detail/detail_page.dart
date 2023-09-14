import 'package:base_project_getx/core/base/base_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/anim/ease_in_widget.dart';
import '../../core/base/mixin_base_page.dart';
import '../../core/values/app_colors.dart';
import '../../core/values/styles.dart';
import '../../core/widget/custom_app_bar.dart';
import 'detail_controller.dart';

class DetailPage extends BaseView<DetailController> with BasePage {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(
      appBarTitleText: 'Thông tin chi tiết',
    );
  }

  @override
  Widget body(BuildContext context) {
    // final controller = Get.find<IntroController>();
    return Scaffold(
        backgroundColor: AppColors.bgColor,
        body:
            Column(
          children: [
            SizedBox(
              height: 25,
            ),
            EaseInWidget(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(15),
                decoration: decorationWhiteShadow(borderRadius: 15),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Đây là trang chi tiết",
                        style: Styles.styleTextTitleMainColor,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.textSub1,
                      size: 18,
                    )
                  ],
                ),
              ),
              onTap: () async {
                try {} catch (e) {}
              },
            ).marginSymmetric(horizontal: 20),
            SizedBox(
              height: 10,
            ),
          ],
        )
        // )
        );
  }
}
