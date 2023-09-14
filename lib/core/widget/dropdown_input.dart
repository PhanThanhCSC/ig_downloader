import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../models/common_info.dart';
import '../base/mixin_base_page.dart';
import '../values/app_colors.dart';
import '../values/styles.dart';

///ignore: must_be_immutable
class DropdownInput extends StatelessWidget with BasePage {
  DropdownInput(
      {Key? key, this.editable = true, required this.items, this.onChangedValue, this.value, this.hintText = '', this.validated, this.errorText, this.isLoading, this.svgAssetName})
      : super(key: key);
  final editable;
  final List<CommonInfo> items;
  final value;
  final onChangedValue;
  final String hintText;

  final validated;
  final errorText;
  final isLoading;
  String? svgAssetName = null;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            height: 44,
            child: Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 0,
                    ),
                    svgAssetName != null
                        ? Center(
                            child: SizedBox(
                              width: 44,
                              child: SvgPicture.asset(
                                svgAssetName!,
                                width: 22,
                                height: 22,
                                color: AppColors.textMain,
                              ),
                            ),
                          )
                        : SizedBox(
                            width: 15,
                          ),
                    SizedBox(
                      width: 2,
                    ),
                    Expanded(
                      child: Center(
                        child: DropdownButtonFormField2<CommonInfo?>(
                          decoration: InputDecoration(
                            //Add isDense true and zero Padding.
                            //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                            isDense: true,
                            contentPadding: EdgeInsets.zero,
                            border: InputBorder.none,
                            // border: OutlineInputBorder(
                            //   borderRadius: BorderRadius.circular(15),
                            // ),
                            //Add more decoration as you want here
                            //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                          ),
                          isExpanded: true,
                          hint: Text(
                            hintText,
                            style: Styles.styleTextNormalHintColor,
                          ),
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            color: isLoading == true
                                ? AppColors.transparent
                                : value == null
                                    ? AppColors.textSub1.withAlpha(60)
                                    : AppColors.textSub1,
                          ),
                          iconSize: 25,
                          buttonHeight: 60,
                          buttonPadding: const EdgeInsets.only(left: 0, right: 10),
                          dropdownDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          items: items != null
                              ? items
                                  .map((item) => DropdownMenuItem<CommonInfo?>(
                                        value: item != null ? item : null,
                                        child: Text(
                                          item != null ? item.name : "",
                                          style: (item != null && item.id.isNotEmpty) ? Styles.styleTextNormalMainColor : Styles.styleTextNormalSub1Color,
                                        ),
                                      ))
                                  .toList()
                              : [],
                          validator: (_value) {
                            if (_value == null) {
                              return hintText;
                            }
                          },
                          value: value,
                          onChanged: (_value) {
                            //Do something when changing the item if you want.
                            onChangedValue(_value);
                          },
                          onSaved: (_value) {
                            // selectedValue = _value.toString();
                            // onChangedValue(_value);
                          },
                        ),
                        /*    DropdownButton<dynamic>(
                        elevation: 8,
                        value: value,
                        style: Styles.styleTextNormalMainColor,
                        iconEnabledColor: AppColors.transparent,
                        items: items,
                        isExpanded: true,
                        underline: SizedBox(),
                        hint: Text(
                          hintText,
                          style: Styles.styleTextNormalHintColor,
                        ),
                        onChanged: (val) => onChangedValue(val),
                      ),*/
                      ),
                    ),
                    /*  SizedBox(
                      width: 5,
                    ),
                    isLoading == true
                        ? Center(
                            child: SizedBox(
                              child: CircularProgressIndicator(
                                color: AppColors.colorPrimary,
                                strokeWidth: 2,
                              ),
                              width: 18,
                              height: 18,
                            ),
                          )
                        : Center(
                            child:  Icon(
                              Icons.keyboard_arrow_down,
                              color: value == null ? AppColors.textSub1.withAlpha(60) : AppColors.textSub1,
                              size: 25,
                            ),
                          ),
                    SizedBox(
                      width: 10,
                    ),*/
                  ],
                ),
                Positioned(
                  child: isLoading == true
                      ? Center(
                          child: SizedBox(
                            child: CircularProgressIndicator(
                              color: AppColors.colorPrimary,
                              strokeWidth: 2,
                            ),
                            width: 18,
                            height: 18,
                          ),
                        )
                      : Center(
                          child: SizedBox(),
                        ),
                  right: 15,
                  top: 0,
                  bottom: 0,
                )
              ],
            ),
            decoration: decorationWhiteShadow(borderRadius: 15)
            /*    decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: new BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                color: AppColors.colorPrimary.withAlpha(50),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),*/
            ),
        validated == false
            ? Text(
                errorText,
                style: Styles.styleTextSmallRedColorItalic,
              ).marginOnly(top: 5, left: 10, bottom: 4)
            : SizedBox()
      ],
    );
  }
}
