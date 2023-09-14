import 'package:flutter/material.dart';

class AppColors {
  static const Color vionetColor = Color(0xFFD091E1);
  static const Color grayTextColor = Color(0xFFB1B1B1);
  static const Color grayText2Color = Color(0xFFDCDCDC);
  static const Color bgAppColor = Color(0xFFF9F4FF);
  static const Color textLightVionet = Color(0xFF756987);
  static const Color bgButtonVionet = Color(0x4D3E206A);
  static const Color bgBannerVionet = Color(0xFF7D42D4);
  static const Color dottedColor = Color(0x59C98DDC);


  static const Color colorPrimary = Color(0xFF136AFB);
  static const Color redPrimary = Color(0xFFE11B22);
  static const Color greenPrimary = Color(0xFF16AD5E);
  static const Color yellowPrimary = Color(0xFFF89434);
  static const Color yellowBorder = Color(0xFFFFCA28);
  static const Color blueSecondary = Color(0xFF083F8C);

  static const Color bgInput = Color(0xFFF5F7F8);
  static const Color bgColor = Color(0xFFF4F7FF);
  static const Color bgTabColor = Color(0xFFE6EAEE);
  static const Color colorGradientButtonEnd = Color(0xFF0F55C9);
  static const Color colorAppBarBlue = Color(0xFF083F8C);
  static const Color colorBgRelationship = Color(0xFF104590);

  static const Color textMain = Color(0xFF1D1D1D);
  static const Color textSub = Color(0xFF70728D);
  static const Color textSub1 = Color(0xFFD0D7DD);
  static const Color iconGray = Color(0xFF979797);
  static const Color transparent = Colors.transparent;

  static const Color dividerColor = Color(0xFFE4ECF2);

  static Color black = Color(0xFF000000);
  static Color white = Color(0xFFFFFFFF);

  // static const Color pageBackground = Color(0xFFFAFBFD);
  static const Color statusBarColor = Color(0xFF38686A);
  static const Color appBarColor = Color(0xFF38686A);
  static const Color appBarIconColor = Color(0xFFFFFFFF);
  static const Color appBarTextColor = Color(0xFFFFFFFF);
  static const Color borderTextFieldColor = Color(0xFFE17297);

  static const Color centerTextColor = Colors.grey;
  static const MaterialColor colorPrimarySwatch = Colors.cyan;

  // static const Color colorPrimary = Color(0xFF38686A);
  static const Color colorAccent = Color(0xFF38686A);
  static const Color colorLightGreen = Color(0xFF00EFA7);
  static const Color colorWhite = Color(0xFFFFFFFF);
  static const Color lightGreyColor = Color(0xFFC4C4C4);
  static const Color errorColor = Color(0xFFAB0B0B);
  static const Color colorDark = Color(0xFF323232);

  static const Color buttonBgColor = colorPrimary;
  static const Color disabledButtonBgColor = Color(0xFFBFBFC0);
  static const Color defaultRippleColor = Color(0x0338686A);

  static const Color textColorPrimary = Color(0xFF323232);
  static const Color textColorSecondary = Color(0xFF9FA4B0);
  static const Color textColorTag = colorPrimary;
  static const Color textColorGreyLight = Color(0xFFABABAB);
  static const Color textColorGreyDark = Color(0xFF979797);
  static const Color textColorBlueGreyDark = Color(0xFF939699);
  static const Color textColorCyan = Color(0xFF38686A);
  static const Color textColorWhite = Color(0xFFFFFFFF);
  static Color searchFieldTextColor = const Color(0xFF323232).withOpacity(0.5);

  static const Color iconColorDefault = Colors.grey;

  static Color barrierColor = const Color(0xFF000000).withOpacity(0.5);

  static Color timelineDividerColor = const Color(0x5438686A);

  static const Color gradientStartColor = Colors.black87;
  static const Color gradientEndColor = Colors.transparent;
  static const Color silverAppBarOverlayColor = Color(0x80323232);

  static const Color switchActiveColor = colorPrimary;
  static const Color switchInactiveColor = Color(0xFFABABAB);
  static Color elevatedContainerColorOpacity = Colors.grey.withOpacity(0.5);
  static const Color suffixImageColor = Colors.grey;

  static Color hexToColor(String hex) {
    assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex),
        'hex color must be #rrggbb or #rrggbbaa');

    return Color(
      int.parse(hex.substring(1), radix: 16) +
          (hex.length == 7 ? 0xff000000 : 0x00000000),
    );
  }
}
