import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../anim/ease_in_widget.dart';
import '../values/styles.dart';
import '/core/values/app_colors.dart';

//Default appbar customized with the design of our app
class CustomAppBarBlue extends StatelessWidget implements PreferredSizeWidget {
  final String appBarTitleText;
  final List<Widget>? actions;
  final bool isBackButtonEnabled;
  final Widget? childButtonAdd;
  final Function? onTapButtonBack;

  CustomAppBarBlue({
    Key? key,
    required this.appBarTitleText,
    this.actions,
    this.isBackButtonEnabled = true,
    this.childButtonAdd,
    this.onTapButtonBack,
  }) : super(key: key);

  @override
  Size get preferredSize => AppBar().preferredSize;

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    return PreferredSize(
        preferredSize: Size.fromHeight(120), // Set this height
        child: Container(
          width: double.infinity,
          height: 55,
          decoration: BoxDecoration(
            color: AppColors.colorAppBarBlue,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withAlpha(70),
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              isBackButtonEnabled
                  ? EaseInWidget(
                      onTap: onTapButtonBack,
                      /*    onTap: () {
                        AppUtil.showLog("CustomAppBarBlue onTapBack");
                        Get.back();
                      },*/
                      child: Container(
                        height: 44,
                        width: 44,
                        color: AppColors.transparent,
                        child: Center(
                          child: Container(
                            width: 36,
                            height: 36,
                            decoration: BoxDecoration(
                              borderRadius: new BorderRadius.circular(15.0),
                              color: AppColors.white.withAlpha(20),
                            ),
                            child: Icon(
                              Icons.arrow_back_ios_outlined,
                              size: 18,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ),
                    ).marginOnly(left: 16, right: 16)
                  : SizedBox(
                      height: 44,
                      width: 44,
                    ).marginOnly(left: 16, right: 16),
              Expanded(
                  child: Center(
                child: childButtonAdd != null
                    ? childButtonAdd
                    : Text(
                        appBarTitleText,
                        style: Styles.styleTextTitleWhiteColorBold,
                      ),
              )),
              SizedBox(
                width: 44,
                height: 44,
              ).marginOnly(left: 16, right: 16),
            ],
          ),
        )).marginOnly(top: statusBarHeight);
  }
}
