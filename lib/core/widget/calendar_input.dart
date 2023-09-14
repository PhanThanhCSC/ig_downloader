import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../anim/ease_in_widget.dart';
import '../utils/dialog_util.dart';
import '../values/app_colors.dart';
import '../values/styles.dart';

///ignore: must_be_immutable
class CalendarInput extends StatelessWidget {
  CalendarInput({Key? key, this.editable = true, required this.inputDate, required this.onDateSelected, this.hintText = '', this.minDate, this.maxDate}) : super(key: key);
  final editable;
  final Rx<DateTime> inputDate;
  final Function(DateTime value) onDateSelected;
  final hintText;
  DateTime? minDate;
  DateTime? maxDate;

  @override
  Widget build(BuildContext context) {
    return EaseInWidget(
      onTap: () {
        DialogUtil.showDatePicker(context, onOkClick: (_selectedDate) {
          onDateSelected(_selectedDate);
        }, initialDateTime: inputDate.value, minDate: minDate, maxDate: maxDate);
      },
      child: Container(
        height: 44,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 0,
            ),
            Center(
              child: SizedBox(
                width: 44,
                child: SvgPicture.asset(
                  "assets/svg/ic_calendar.svg",
                  width: 22,
                  height: 22,
                  color: AppColors.textMain,
                ),
              ),
            ),
            SizedBox(
              width: 2,
            ),
            Expanded(
                child: Align(
              alignment: Alignment.centerLeft,
              child: Obx(() => Text(
                    inputDate != null ? DateFormat(Styles.FORMAT_DATEONLY).format(inputDate.value) : hintText,
                    style: Styles.styleTextNormalMainColor,
                    // textAlign: TextAlign.left,
                  )),
            )),
            SizedBox(
              width: 5,
            ),
            Center(
              child: Icon(
                Icons.keyboard_arrow_down,
                color: AppColors.textSub1,
                size: 25,
              ),
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: new BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: AppColors.colorPrimary.withAlpha(50),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
      ),
    );
  }
}
