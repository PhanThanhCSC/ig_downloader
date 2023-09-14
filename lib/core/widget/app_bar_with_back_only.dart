import 'package:flutter/material.dart';

import '/core/values/app_colors.dart';
import '/core/widget/app_bar_title.dart';

//Default appbar customized with the design of our app
class AppBarWithBackOnly extends StatelessWidget implements PreferredSizeWidget {
  // Function onTap;

  AppBarWithBackOnly({
    Key? key,
    // required this.onTap,
  }) : super(key: key);

  @override
  Size get preferredSize => AppBar().preferredSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 44,
        color: AppColors.transparent,
        child: Container(
          width: 36,
          height: 36,
          color: AppColors.colorPrimary.withAlpha(5),
          child: Icon(
            Icons.arrow_back_ios_outlined,
            size: 18,
            color: AppColors.colorPrimary,
          ),
        ),
      ),
      // onTap: onTap(),
    );

    // return AppBar(
    //   backgroundColor: AppColors.transparent,
    //   centerTitle: true,
    //   elevation: 0,
    //   automaticallyImplyLeading: isBackButtonEnabled,
    //   actions: actions,
    //   iconTheme: const IconThemeData(color: AppColors.appBarIconColor),
    //   // title: AppBarTitle(text: appBarTitleText),
    // );
  }
}
