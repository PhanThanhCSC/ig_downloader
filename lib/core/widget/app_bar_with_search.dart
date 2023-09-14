import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/core/values/app_colors.dart';
import '../anim/ease_in_widget.dart';
import '../values/styles.dart';

//Default appbar customized with the design of our app
class AppBarWithSearch extends StatelessWidget implements PreferredSizeWidget {
  final TextEditingController textEditingController;
  final arrayItems;
  final onSelectedItem;
  final String hintText;
  final bool isBackButtonEnabled;

  AppBarWithSearch({
    Key? key,
    required this.textEditingController,
    required this.hintText,
    required this.arrayItems,
    required this.onSelectedItem,
    this.isBackButtonEnabled = true,
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
            color: AppColors.white,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
            boxShadow: [
              BoxShadow(
                color: AppColors.colorPrimary.withAlpha(20),
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              isBackButtonEnabled
                  ? EaseInWidget(
                      onTap: () => Get.back(),
                      /*   onTap: () => onTapBack != null
                          ? onTapBack()
                          : () {
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
                    ).marginOnly(left: 16, right: 16)
                  : SizedBox(
                      height: 44,
                      width: 44,
                    ).marginOnly(left: 16, right: 16),
              Expanded(
                  child: Center(
                child: Stack(
                  children: [
                    /* TypeAheadField(
                      textFieldConfiguration: TextFieldConfiguration(
                        autofocus: true,
                        style: DefaultTextStyle.of(context)
                            .style
                            .copyWith(fontStyle: FontStyle.italic),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'What is on your mind?'),
                      ),
                      suggestionsCallback: (pattern) async {
                        return await BackendService.getSuggestions(pattern);
                      },
                      itemBuilder: (context, Map<String, String> suggestion) {
                        return ListTile(
                          title: Text(suggestion['name']!),
                          subtitle: Text('${suggestion['score']}'),
                        );
                      },
                      onSuggestionSelected: (Map<String, String> suggestion) {
                        // your implementation here
                      },
                    ),*/
                    TextField(
                      controller: textEditingController,
                      style: Styles.styleTextNormalMainColor,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.search,
                      textCapitalization: TextCapitalization.none,
                      maxLines: 1,
                      onSubmitted: (value) {
                        // if (currentNode != null && nextNode != null) AppUtil().fieldFocusChange(context, currentNode, nextNode);
                      },
                      decoration: InputDecoration(
                        isCollapsed: true,
                        contentPadding: new EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
                        fillColor: AppColors.bgColor,
                        filled: true,
                        // contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        border: OutlineInputBorder(borderRadius: new BorderRadius.circular(6.0), borderSide: BorderSide.none),
                        hintText: hintText,
                        hintStyle: Styles.styleTextSmallSub1Color,
                      ),
                    ),
                    Positioned(
                      right: 10,
                      top: 8,
                      child: Icon(
                        Icons.search,
                        size: 22,
                        color: AppColors.textSub,
                      ),
                    )
                  ],
                ),
              )),
              SizedBox(
                width: 0,
                height: 44,
              ).marginOnly(left: 16, right: 10),
            ],
          ),
        )).marginOnly(top: statusBarHeight);
  }
}
