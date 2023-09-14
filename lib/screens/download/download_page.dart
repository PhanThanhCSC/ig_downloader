

import 'package:base_project_getx/screens/download/download_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:base_project_getx/core/base/base_view.dart';
import 'package:flutter/material.dart';
import '../../core/base/mixin_base_page.dart';
import '../../core/values/app_colors.dart';
import '../../core/widget/custom_app_bar.dart';

class DownloadPage extends BaseView<DownloadController> with BasePage {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(
      appBarTitleText: 'Download Reel',
    );
  }

  @override
  Widget body(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.bgColor,
        body:
        Column(
          children: [
            SizedBox(
              height: 25,
            ),

          ],
        ),
    );
  }
}
