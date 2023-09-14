import 'dart:ui' show ImageFilter;

import 'package:flutter/cupertino.dart'
    show
        Alignment,
        Border,
        BorderSide,
        BoxDecoration,
        BuildContext,
        Color,
        Column,
        Container,
        CrossAxisAlignment,
        CupertinoButton,
        CupertinoDatePicker,
        CupertinoDatePickerMode,
        CupertinoIcons,
        CupertinoTheme,
        EdgeInsets,
        Expanded,
        FontWeight,
        Icon,
        Key,
        MainAxisAlignment,
        Navigator,
        Row,
        SizedBox,
        Text,
        Widget,
        required,
        showCupertinoDialog,
        showCupertinoModalPopup;
import 'package:flutter/material.dart' show Color, Colors, Locale, Localizations;
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:get/get.dart';

import '../values/styles.dart';

export 'dart:ui' show ImageFilter;

export 'package:flutter/material.dart' show Color, Colors;

void showCupertinoDatePicker(
  BuildContext context, {
  Key? key,
  CupertinoDatePickerMode mode = CupertinoDatePickerMode.dateAndTime,
  required Function(DateTime value) onDateTimeChanged,
  required Function() onCancelClick,
  required Function(DateTime value) onOkClick,
  DateTime? initialDateTime,
  DateTime? minimumDate,
  DateTime? maximumDate,
  int minimumYear = 1,
  int? maximumYear,
  int minuteInterval = 1,
  bool use24hFormat = false,
  Color? backgroundColor,
  ImageFilter? filter,
  bool useRootNavigator = true,
  bool? semanticsDismissible,
  Widget? cancelText,
  Widget? doneText,
  bool useText = false,
  bool leftHanded = false,
}) {
  // Default to right now.
  initialDateTime ??= DateTime.now();
  DateTime selectedDateTime = initialDateTime != null ? initialDateTime : DateTime.now();

  if (!useText) {
    cancelText = Icon(CupertinoIcons.clear_circled);
  } else {
    if (cancelText == null)
      cancelText = Text(
        'Hủy',
        style: Styles.styleTextNormalRedColor,
      );
  }

  if (!useText) {
    doneText = Icon(CupertinoIcons.check_mark_circled);
  } else {
    if (doneText == null)
      doneText = Text(
        'Đồng ý',
        style: Styles.styleTextNormalPrimaryColorBold,
      );
  }

  var cancelButton = CupertinoButton(
    padding: const EdgeInsets.symmetric(horizontal: 15.0),
    child: cancelText,
    onPressed: () {
      onCancelClick();
      // onDateTimeChanged(DateTime(0000, 01, 01, 0, 0, 0, 0, 0));
      Navigator.of(context).pop();
    },
  );

  var doneButton = CupertinoButton(
    padding: const EdgeInsets.symmetric(horizontal: 15.0),
    child: doneText,
    onPressed: () {
      onOkClick(selectedDateTime);
      Navigator.of(context).pop();
    },
  );

  /* showCupertinoDialog(
    barrierDismissible: true,
    context: context,
    builder: (context) => Center(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        color: AppColors.white,
        height: 240.0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                child: CupertinoDatePicker(
              key: key,
              mode: mode,
              onDateTimeChanged: (DateTime value) {
                if (onDateTimeChanged == null) return;
                if (mode == CupertinoDatePickerMode.time) {
                  onDateTimeChanged(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, value.hour, value.minute));
                } else {
                  selectedDateTime = value;
                  onDateTimeChanged(value);
                }
              },
              initialDateTime: initialDateTime,
              minimumDate: minimumDate,
              maximumDate: maximumDate,
              minimumYear: minimumYear,
              maximumYear: maximumYear,
              minuteInterval: minuteInterval,
              use24hFormat: use24hFormat,
              backgroundColor: backgroundColor,
            )),
            Container(
              alignment: Alignment.centerRight,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(249, 249, 247, 1.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  leftHanded ? doneButton : cancelButton,
                  leftHanded ? cancelButton : doneButton,
                ],
              ),
            ),
          ],
        ),
      ),
    ),
    // filter: filter,
    useRootNavigator: useRootNavigator,
    // semanticsDismissible: semanticsDismissible,
  );*/
  Get.dialog(Center(
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      height: 240.0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: CupertinoDatePicker(
            key: key,
            mode: mode,
            onDateTimeChanged: (DateTime value) {
              if (onDateTimeChanged == null) return;
              if (mode == CupertinoDatePickerMode.time) {
                onDateTimeChanged(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, value.hour, value.minute));
              } else {
                selectedDateTime = value;
                onDateTimeChanged(value);
              }
            },
            initialDateTime: initialDateTime,
            minimumDate: minimumDate,
            maximumDate: maximumDate,
            minimumYear: minimumYear,
            maximumYear: maximumYear,
            minuteInterval: minuteInterval,
            use24hFormat: use24hFormat,
            backgroundColor: backgroundColor,
          )),
          /*Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              versionModel.forceUpdate == false
                  ? Expanded(
                  child: GestureDetector(
                    child: Container(
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(horizontal: 30),
                        height: 40,
                        decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(25)),
                        child: Center(
                          child: Text(
                            "Hủy",
                            style: Styles.styleTextNormalRedColorBold,
                          ),
                        )),
                    onTap: () {
                      Get.back();
                    },
                  ))
                  : SizedBox(),
              Expanded(
                  child: GestureDetector(
                    child: Container(
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(horizontal: 30),
                        height: 40,
                        decoration: BoxDecoration(color: AppColors.colorPrimary, borderRadius: BorderRadius.circular(25)),
                        child: Center(
                          child: Text(
                            "Đồng ý",
                            style: Styles.styleTextNormalWhiteColorBold,
                          ),
                        )),
                    onTap: () {
                      Get.back();
                      OpenStore.instance.open(
                        appStoreId: '1132002156', // AppStore id of your app
                        androidAppBundleId: 'com.medservices.iCNM',
                      );
                    },
                  )),
            ],
          ),*/
          Container(
            alignment: Alignment.centerRight,
            // decoration: BoxDecoration(
            //   color: const Color.fromRGBO(249, 249, 247, 1.0),
            // ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                leftHanded ? doneButton : cancelButton,
                leftHanded ? cancelButton : doneButton,
              ],
            ),
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    ),
  ));
  /* showCupertinoDialog(
    context: context,
    builder: (context) => Container(
      color: AppColors.white,
      height: 240.0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(249, 249, 247, 1.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                leftHanded ? doneButton : cancelButton,
                leftHanded ? cancelButton : doneButton,
              ],
            ),
          ),
          Expanded(
              child: CupertinoDatePicker(
            key: key,
            mode: mode,
            onDateTimeChanged: (DateTime value) {
              if (onDateTimeChanged == null) return;
              if (mode == CupertinoDatePickerMode.time) {
                onDateTimeChanged(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, value.hour, value.minute));
              } else {
                selectedDateTime = value;
                onDateTimeChanged(value);
              }
            },
            initialDateTime: initialDateTime,
            minimumDate: minimumDate,
            maximumDate: maximumDate,
            minimumYear: minimumYear,
            maximumYear: maximumYear,
            minuteInterval: minuteInterval,
            use24hFormat: use24hFormat,
            backgroundColor: backgroundColor,
          )),
        ],
      ),
    ),
    // filter: filter,
    useRootNavigator: useRootNavigator,
    // semanticsDismissible: semanticsDismissible,
  );*/
}
