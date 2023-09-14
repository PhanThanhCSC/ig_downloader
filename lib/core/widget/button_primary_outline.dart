import 'package:flutter/material.dart';

import '../anim/ease_in_widget.dart';
import '../values/app_colors.dart';
import '../values/styles.dart';

class ButtonPrimaryOutline extends StatelessWidget {
  final String btnTitle;
  Function()? onTap;
  final double? btnWidth;
  final double? radius;

  ButtonPrimaryOutline({Key? key, required this.btnTitle, this.onTap, this.btnWidth, this.radius}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EaseInWidget(
      child: Container(
        height: 45,
        width: btnWidth != null ? btnWidth : double.infinity,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(radius != null ? radius! : 20),
          border: Border.all(color: AppColors.colorPrimary, width: 1),
          /* boxShadow: [
            BoxShadow(
              color: AppColors.colorPrimary.withAlpha(70),
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],*/
        ),
        child: Center(
          child: Text(
            btnTitle,
            style: Styles.styleTextNormalPrimaryColorBold,
          ),
        ),
      ),
      onTap: onTap,
      // onTap: () => onTap,
    );
  }
}
