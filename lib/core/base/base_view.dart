import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../anim/ease_in_widget.dart';
import '../values/app_colors.dart';
import '../values/styles.dart';
import '/flavors/build_config.dart';
import 'base_controller.dart';

abstract class BaseView<Controller extends BaseController> extends GetView<Controller> {
  final GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  // AppLocalizations get appLocalization => AppLocalizations.of(Get.context!)!;

  // final Logger logger = BuildConfig.instance.config.logger;

  Widget body(BuildContext context);

  PreferredSizeWidget? appBar(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return pageScaffold(context);
  }

/*  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Stack(
        children: [
          annotatedRegion(context),
          // Obx(() => controller.pageState == PageState.LOADING ? _showLoading() : Container()),
          // Obx(() => controller.errorMessage.isNotEmpty ? showErrorSnackBar(controller.errorMessage) : Container()),
          Container(),
        ],
      ),
    );
  }*/

  Widget annotatedRegion(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        //Status bar color for android
        statusBarColor: statusBarColor(),
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Material(
        color: Colors.transparent,
        child: pageScaffold(context),
      ),
    );
  }

  Widget customAppbar({required String pageTitle, Function? onTapBack}) {
    return Container(
      width: double.infinity,
      height: 55,
      decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15))),
      child: Row(
        children: [
          EaseInWidget(
            onTap: () => onTapBack != null
                ? onTapBack()
                : () {
                    Get.back();
                  },
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
                    color: AppColors.colorPrimary.withAlpha(15),
                  ),
                  child: Icon(
                    Icons.arrow_back_ios_outlined,
                    size: 18,
                    color: AppColors.colorPrimary,
                  ),
                ),
              ),
            ),
          ).marginOnly(left: 16, right: 16),
          Expanded(
              child: Center(
            child: Text(
              pageTitle,
              style: Styles.styleTextTitleMainColorBold,
            ),
          )),
          SizedBox(
            width: 44,
            height: 44,
          ).marginOnly(left: 16, right: 16),
        ],
      ),
    );
  }

  Widget pageScaffold(BuildContext context) {
    return Scaffold(
      //sets ios status bar color
      backgroundColor: pageBackgroundColor(),
      key: globalKey,
      appBar: appBar(context),
      floatingActionButton: floatingActionButton(),
      body: pageContent(context),
      bottomNavigationBar: bottomNavigationBar(),
      drawer: drawer(),
    );
  }

  Widget pageContent(BuildContext context) {
    return SafeArea(
      child: body(context),
    );
  }

  Widget showErrorSnackBar(String message) {
    final snackBar = SnackBar(content: Text(message));
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
    });

    return Container();
  }

  void showToast(String message) {
    Fluttertoast.showToast(msg: message, toastLength: Toast.LENGTH_SHORT, timeInSecForIosWeb: 1);
  }

  Color pageBackgroundColor() {
    return AppColors.white;
  }

  Color statusBarColor() {
    return AppColors.white;
  }

  Widget? floatingActionButton() {
    return null;
  }

  Widget? bottomNavigationBar() {
    return null;
  }

  Widget? drawer() {
    return null;
  }

  // void _showLoading() {
  //   AppUtil.showLoading();
  //   // return const Loading();
  // }
}
