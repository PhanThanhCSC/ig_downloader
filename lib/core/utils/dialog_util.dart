import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../anim/ease_in_widget.dart';
import '../values/app_colors.dart';
import '../values/styles.dart';
import '../widget/button_primary.dart';
import '../widget/button_primary_outline.dart';
import '../widget/custom_date_picker.dart';

class DialogUtil {
  static showDialog(String title, String message, String okLabel, {Function()? onOK}) async {
    return await Get.dialog(
      Center(
        child: Container(
          // width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 20.0,
              ),
              SizedBox(
                width: double.infinity,
                child: Text(
                  title,
                  style: Styles.styleTextTitlePrimaryColorBold,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Divider(
                color: AppColors.dividerColor,
              ),
              SizedBox(
                height: 30.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Center(
                  child: Text(message, style: Styles.styleTextNormalMainColor),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: GestureDetector(
                    child: Container(
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(horizontal: 30),
                        height: 41,
                        decoration: BoxDecoration(color: AppColors.colorPrimary, borderRadius: BorderRadius.circular(25)),
                        child: Center(
                          child: Text(
                            okLabel,
                            style: Styles.styleTextNormalWhiteColorBold,
                          ),
                        )),
                    onTap: onOK,
                  )),
                ],
              ),
              SizedBox(
                height: 23.0,
              ),
            ],
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
        ),
      ),
    );
  }

  static showConfirmDialog(String message, {required String cancelLable, required String okLabel, Function()? onCancel, Function()? onOK, String? imageResource}) async {
    return await Get.dialog(
      Center(
        child: Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                /*  SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    title,
                    style: Styles.styleTextTitlePrimaryColorBold,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Divider(
                  color: AppColors.dividerColor,
                ),*/
                SizedBox(
                  height: 30.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Center(
                    child: Text(
                      message,
                      style: Styles.styleTextNormalMainColorBold,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(child: ButtonPrimaryOutline(btnTitle: cancelLable, onTap: onCancel)),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(child: ButtonPrimary(btnTitle: okLabel, onTap: onOK)),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                SizedBox(
                  height: 23.0,
                ),
              ],
              crossAxisAlignment: CrossAxisAlignment.start,
            )),
      ),
    );
  }

  static showDatePicker(
    BuildContext context, {
    DateTime? minDate,
    DateTime? maxDate,
    required Function(DateTime value) onOkClick,
    DateTime? initialDateTime,
    Function()? onCancelClick,
    Function(DateTime value)? onDateTimeChange,
  }) {
    // if (minDate != null) {
    showCupertinoDatePicker(context,
        mode: CupertinoDatePickerMode.date,
        initialDateTime: initialDateTime != null ? initialDateTime : DateTime.now(),
//     leftHanded: true,
        useText: true,
        minimumDate: minDate,
        maximumDate: maxDate,
        onDateTimeChanged: onDateTimeChange != null ? onDateTimeChange : (value) {},
        onCancelClick: onCancelClick != null ? onCancelClick : () {},
        onOkClick: onOkClick);
//     } else {
//       showCupertinoDatePicker(context,
//           mode: CupertinoDatePickerMode.date,
//           initialDateTime: initialDateTime != null ? initialDateTime : DateTime.now(),
// //     leftHanded: true,
//           useText: true,
//           onDateTimeChanged: onDateTimeChange != null ? onDateTimeChange : (value) {},
//           onCancelClick: onCancelClick != null ? onCancelClick : () {},
//           onOkClick: onOkClick);
//     }
  }

  static showMonthPicker(
    BuildContext context, {
    DateTime? minDate,
    DateTime? maxDate,
    required Function(DateTime value) onOkClick,
    DateTime? initialDateTime,
    Function()? onCancelClick,
    Function(DateTime value)? onDateTimeChange,
  }) {
    // if (minDate != null) {
    showCupertinoDatePicker(context,
        mode: CupertinoDatePickerMode.date,
        initialDateTime: initialDateTime != null ? initialDateTime : DateTime.now(),
//     leftHanded: true,
        useText: true,
        minimumDate: minDate,
        maximumDate: maxDate,
        onDateTimeChanged: onDateTimeChange != null ? onDateTimeChange : (value) {},
        onCancelClick: onCancelClick != null ? onCancelClick : () {},
        onOkClick: onOkClick);
//     } else {
//       showCupertinoDatePicker(context,
//           mode: CupertinoDatePickerMode.date,
//           initialDateTime: initialDateTime != null ? initialDateTime : DateTime.now(),
// //     leftHanded: true,
//           useText: true,
//           onDateTimeChanged: onDateTimeChange != null ? onDateTimeChange : (value) {},
//           onCancelClick: onCancelClick != null ? onCancelClick : () {},
//           onOkClick: onOkClick);
//     }
  }

  static Future<ImageSource>? showDialogPickeImage() async {
    return await Get.bottomSheet(
        Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: Text("Chụp ảnh"),
                  leading: Icon(Icons.camera_alt),
                  onTap: () => Get.back(result: ImageSource.camera),
                ),
                ListTile(
                  title: Text("Chọn ảnh từ thư viện"),
                  leading: Icon(Icons.photo_library),
                  onTap: () => Get.back(result: ImageSource.gallery),
                ),
                ListTile(
                  title: Text("Đóng"),
                  leading: Icon(Icons.close),
                  onTap: () => Get.back(),
                ),
              ],
            ),
          ),
        ),
        elevation: 20.0,
        enableDrag: false,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        )));
  }

  static showDialogBottom(String actionTitle, String actionDescription, String cancelTitle, {required onTap}) async {
    return await Get.bottomSheet(
        Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  actionTitle,
                  style: Styles.styleTextNormalMainColorBold,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  color: AppColors.dividerColor,
                  indent: 60,
                  endIndent: 60,
                ),
                SizedBox(
                  height: 5,
                ),
                ButtonPrimary(btnTitle: actionDescription, onTap: onTap),
                SizedBox(
                  height: 5,
                ),
                Divider(
                  color: AppColors.dividerColor,
                  indent: 80,
                  endIndent: 80,
                ),
                SizedBox(
                  height: 5,
                ),
                EaseInWidget(
                  child: Container(
                    height: 45,
                    color: AppColors.transparent,
                    child: Center(
                      child: Text(
                        cancelTitle,
                        style: Styles.styleTextNormalMainColorLight,
                      ),
                    ),
                  ),
                  onTap: () {
                    Get.back();
                  },
                  // onTap: () => onTap,
                ),
                SizedBox(
                  height: 0,
                ),
              ],
            ),
          ),
        ),
        elevation: 20.0,
        enableDrag: false,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        )));
  }

  static showDialogLogout({required onTapLogout}) async {
    return await Get.bottomSheet(
        Container(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Bạn có chắc chắn muốn đăng xuất khỏi My Medlatec không?",
                  style: Styles.styleTextNormalMainColorBold,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  color: AppColors.dividerColor,
                  indent: 60,
                  endIndent: 60,
                ),
                SizedBox(
                  height: 5,
                ),
                ButtonPrimary(btnTitle: "Đăng xuất", onTap: onTapLogout),
                SizedBox(
                  height: 5,
                ),
                Divider(
                  color: AppColors.dividerColor,
                  indent: 80,
                  endIndent: 80,
                ),
                SizedBox(
                  height: 5,
                ),
                EaseInWidget(
                  child: Container(
                    height: 45,
                    color: AppColors.transparent,
                    child: Center(
                      child: Text(
                        "Hủy",
                        style: Styles.styleTextNormalMainColorLight,
                      ),
                    ),
                  ),
                  onTap: () {
                    Get.back();
                  },
                  // onTap: () => onTap,
                ),
                SizedBox(
                  height: 0,
                ),
              ],
            ),
          ),
        ),
        elevation: 20.0,
        enableDrag: false,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        )));
  }
}
