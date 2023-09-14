import 'package:base_project_getx/core/values/app_colors.dart';
import 'package:flutter/material.dart';

const appFontFamily = "Montserrat";

class TextStyles {
  TextStyles._();

  static TextStyle get onWhiteTitleText {
    return TextStyle(
        color: AppColors.white,
        fontWeight: FontWeight.w600,
        fontSize: 18,
        fontFamily: appFontFamily);
  }

  static TextStyle get onWhiteSubTitleText {
    return TextStyle(
        color: AppColors.white,
        fontSize: 14,
        fontWeight: FontWeight.bold,
        fontFamily: appFontFamily);
  }

  static TextStyle get onBlackTitleText {
    return TextStyle(
        color: AppColors.black,
        fontWeight: FontWeight.w600,
        fontSize: 18,
        fontFamily: appFontFamily);
  }

  static TextStyle get onBlackSubTitleText {
    return TextStyle(
        color: AppColors.black,
        fontSize: 14,
        fontWeight: FontWeight.bold,
        fontFamily: appFontFamily);
  }

  static TextStyle get titlePrimaryStyle {
    return TextStyle(
        color: AppColors.colorPrimary, fontSize: 18, fontFamily: appFontFamily);
  }

  static TextStyle textNormStyles(Color color, double size) {
    return TextStyle(
        color: color,
        fontSize: size,
        decoration: TextDecoration.none,
        fontFamily: appFontFamily,
        fontWeight: FontWeight.normal);
  }

  static TextStyle textBoldStyles(Color color, double size) {
    return TextStyle(
        color: color,
        fontSize: size,
        decoration: TextDecoration.none,
        fontFamily: appFontFamily,
        fontWeight: FontWeight.bold);
  }

  static TextStyle textBoldStyles2(Color color, double size) {
    return TextStyle(
        color: color,
        fontSize: size,
        decoration: TextDecoration.underline,
        decorationColor: AppColors.black,
        decorationStyle: TextDecorationStyle.solid,
        fontFamily: appFontFamily,
        fontWeight: FontWeight.bold);
  }

  static TextStyle textItalicStyles(Color color, double size) {
    return TextStyle(
        color: color,
        fontSize: size,
        fontFamily: appFontFamily,
        fontStyle: FontStyle.italic);
  }
}
