import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../customwidget/pull_to_refresh/pull_to_refresh.dart';
import '../anim/ease_in_widget.dart';
import '../utils/app_util.dart';
import '../values/app_colors.dart';
import '../values/styles.dart';

mixin BasePage {
  Widget buttonBack({required Function onTap}) {
    return EaseInWidget(
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
      onTap: onTap,
    );
  }

  Widget gradientButtonBlue(String btnTitle,
      {required Function onTap, Icon? leftIcon, Icon? rightIcon}) {
    return EaseInWidget(
      child: Container(
        height: 45,
        decoration: BoxDecoration(
          color: AppColors.colorPrimary,
          borderRadius: BorderRadius.circular(20),
          gradient: new LinearGradient(
            colors: [AppColors.colorPrimary, AppColors.colorGradientButtonEnd],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.colorPrimary.withAlpha(70),
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              leftIcon != null ? leftIcon.marginOnly(right: 8) : SizedBox(),
              Text(
                btnTitle,
                style: Styles.styleTextNormalWhiteColorBold,
              ),
              rightIcon != null ? rightIcon.marginOnly(left: 8) : SizedBox(),
            ],
          ),
        ),
      ),
      onTap: () => onTap(),
      // onTap: () => onTap,
    );
  }

  Widget transparentButtonRed(String btnTitle, {required Function onTap}) {
    return EaseInWidget(
      child: Container(
        height: 45,
        decoration: BoxDecoration(
          color: AppColors.transparent,
          borderRadius: BorderRadius.circular(20),
          /* gradient: new LinearGradient(
            colors: [AppColors.colorPrimary, AppColors.colorGradientButtonEnd],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          boxShadow: [
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
            style: Styles.styleTextNormalRedColorBold,
          ),
        ),
      ),
      onTap: () => onTap(),
      // onTap: () => onTap,
    );
  }

  Widget wTextInput(
      BuildContext? context,
      TextEditingController textController,
      String hintText,
      bool validated,
      String errorText,
      TextInputAction textInputAction,
      FocusNode? currentNode,
      FocusNode? nextNode,
      {TextInputType? textInputType,
      TextCapitalization? textCapitalization,
      bool? autoFocus = false,
      int maxLine = 1}) {
    return wTextInputFull(
        context,
        Styles.styleTextNormalMainColor,
        textController,
        hintText,
        validated,
        errorText,
        textInputType != null ? textInputType : TextInputType.text,
        textInputAction,
        textCapitalization != null
            ? textCapitalization
            : TextCapitalization.sentences,
        maxLine,
        currentNode,
        nextNode,
        autoFocus: autoFocus);
  }

  Widget wTextInputFull(
      BuildContext? context,
      TextStyle textStyle,
      TextEditingController textController,
      String hintText,
      bool validated,
      String errorText,
      TextInputType textInputType,
      TextInputAction textInputAction,
      TextCapitalization textCapitalization,
      int maxLine,
      FocusNode? currentNode,
      FocusNode? nextNode,
      {bool? autoFocus = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            // height: 44,
            // width: double.infinity,
            child: TextField(
              controller: textController,
              style: textStyle,
              keyboardType:
                  textInputType == null ? TextInputType.text : textInputType,
              textInputAction: textInputAction == null
                  ? TextInputAction.next
                  : textInputAction,
              textCapitalization: textCapitalization == null
                  ? TextCapitalization.words
                  : textCapitalization,
              focusNode: currentNode == null ? null : currentNode,
              maxLines: maxLine,
              onSubmitted: (value) {
                if (currentNode != null && nextNode != null)
                  AppUtil().fieldFocusChange(context, currentNode, nextNode);
              },
              decoration: InputDecoration(
                isCollapsed: true,
                contentPadding:
                    new EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
                fillColor: Colors.white,
                filled: true,
                // contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                border: OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(15.0),
                    borderSide: BorderSide.none),
                hintText: hintText,
                hintStyle: Styles.styleTextSmallSub1Color,
              ),
            ),
            decoration: decorationWhiteShadow(borderRadius: 15)
            /* decoration: BoxDecoration(
            // borderRadius: new BorderRadius.circular(15.0),
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

  // tam thoi ko dung
  // Widget imageFromNetwork(String imageUrl, String placeHolderImg, double imgWidth, double imgHeight, BoxFit? fit) {
  // return CachedNetworkImage(
  //   width: imgWidth,
  //   height: imgHeight,
  //   imageUrl: AppUtil().formatImageUrlWithPlaceholder(imageUrl),
  //   imageBuilder: (context, imageProvider) => Container(
  //     decoration: BoxDecoration(
  //       image: DecorationImage(
  //         image: imageProvider,
  //         fit: fit,
  //         // colorFilter:
  //         // ColorFilter.mode(Colors.red, BlendMode.colorBurn)),
  //       ),
  //     ),
  //   ),
  //   placeholder: (context, url) => Image.asset(
  //     "assets/image_loading.gif",
  //     width: imgWidth,
  //     height: imgHeight,
  //     fit: fit,
  //   ),
  //   errorWidget: (context, url, error) => Image.asset(
  //     placeHolderImg,
  //     width: imgWidth,
  //     height: imgHeight,
  //     fit: fit,
  //   ),
  // );
  // }

  Widget imageFromNetworkWithoutSize(
      String imageUrl, String placeHolderImg, BoxFit? fit) {
    return imageUrl.isNotEmpty
        ? FadeInImage.assetNetwork(
            placeholder: "assets/image_loading.gif",
            // placeholder: placeHolderImg,
            image: AppUtil().formatImageUrlWithPlaceholder(imageUrl),
            fit: fit,
            placeholderErrorBuilder: (context, error, stackTrace) {
              return Image.asset(
                placeHolderImg,
                fit: fit,
              );
            },
            imageErrorBuilder: (context, error, stackTrace) {
              return Image.asset(
                placeHolderImg,
                fit: fit,
              );
            },
          )
        : Image.asset(
            placeHolderImg,
            width: double.infinity,
            fit: fit,
          );
  }

  Widget imageFromNetworkFullWidth(
      String imageUrl, String placeHolderImg, BoxFit? fit) {
    return imageUrl.isNotEmpty
        ? FadeInImage.assetNetwork(
            placeholder: "assets/image_loading.gif",
            // placeholder: placeHolderImg,
            image: AppUtil().formatImageUrlWithPlaceholder(imageUrl),
            fit: fit,
            width: double.infinity,
            placeholderErrorBuilder: (context, error, stackTrace) {
              return Image.asset(
                placeHolderImg,
                fit: fit,
                width: double.infinity,
              );
            },
            imageErrorBuilder: (context, error, stackTrace) {
              return Image.asset(
                placeHolderImg,
                fit: fit,
                width: double.infinity,
              );
            },
          )
        : Image.asset(
            placeHolderImg,
            fit: fit,
            width: double.infinity,
          );
  }

  Widget rowInputWithSVG(
      String SVGAssets,
      double iconSize,
      BuildContext? context,
      TextEditingController textController,
      String hintText,
      bool validated,
      String errorText,
      TextInputAction textInputAction,
      TextCapitalization textCapitalization,
      FocusNode? currentNode,
      FocusNode? nextNode,
      {TextInputType? textInputType,
      TextStyle? textStyle,
      int? maxLine,
      bool? isEnable}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          // height: 44,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 0,
              ),
              Center(
                child: SizedBox(
                  width: 44,
                  child: SvgPicture.asset(
                    SVGAssets,
                    width: 22,
                    height: 22,
                    color: (isEnable == false)
                        ? AppColors.textSub1
                        : AppColors.textMain,
                  ).paddingOnly(top: 0),
                ),
              ),
              SizedBox(
                width: 2,
              ),
              Expanded(
                child: Center(
                  child: TextField(
                    enabled: isEnable != null ? isEnable : true,
                    controller: textController,
                    style: (isEnable != null && isEnable == false)
                        ? Styles.styleTextNormalSub1Color
                        : (textStyle != null
                            ? textStyle
                            : Styles.styleTextNormalMainColor),
                    keyboardType: textInputType == null
                        ? TextInputType.text
                        : textInputType,
                    textInputAction: textInputAction == null
                        ? TextInputAction.next
                        : textInputAction,
                    textCapitalization: textCapitalization == null
                        ? TextCapitalization.words
                        : textCapitalization,
                    focusNode: currentNode == null ? null : currentNode,
                    maxLines: maxLine == null ? maxLine : 1,
                    onSubmitted: (value) {
                      if (currentNode != null && nextNode != null)
                        AppUtil()
                            .fieldFocusChange(context, currentNode, nextNode);
                    },
                    decoration: InputDecoration(
                      isCollapsed: true,
                      contentPadding: new EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 0.0),
                      fillColor: Colors.white,
                      filled: true,
                      // errorText: validated == false ? errorText : null,
                      // contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(15.0),
                          borderSide: BorderSide.none),
                      hintText: hintText,
                      hintStyle: Styles.styleTextSmallSub1Color,
                    ),
                  ),
                ),
              )
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
        validated == false
            ? Text(
                errorText,
                style: Styles.styleTextSmallRedColorItalic,
              ).marginOnly(top: 5, left: 10, bottom: 4)
            : SizedBox()
      ],
    );
  }

  Widget rowInputWithPNG(
      String pngAssets,
      double iconSize,
      BuildContext? context,
      TextEditingController textController,
      String hintText,
      bool validated,
      String errorText,
      TextInputAction textInputAction,
      TextCapitalization textCapitalization,
      FocusNode? currentNode,
      FocusNode? nextNode,
      {TextInputType? textInputType,
      TextStyle? textStyle,
      int? maxLine}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
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
                  child: Image.asset(
                    pngAssets,
                    width: 18,
                    height: 18,
                    color: AppColors.textMain,
                  ).paddingOnly(top: 0),
                ),
              ),
              SizedBox(
                width: 2,
              ),
              Expanded(
                child: Center(
                  child: TextField(
                    controller: textController,
                    style: textStyle != null
                        ? textStyle
                        : Styles.styleTextNormalMainColor,
                    keyboardType: textInputType == null
                        ? TextInputType.text
                        : textInputType,
                    textInputAction: textInputAction == null
                        ? TextInputAction.next
                        : textInputAction,
                    textCapitalization: textCapitalization == null
                        ? TextCapitalization.words
                        : textCapitalization,
                    focusNode: currentNode == null ? null : currentNode,
                    maxLines: maxLine == null ? maxLine : 1,
                    onSubmitted: (value) {
                      if (currentNode != null && nextNode != null)
                        AppUtil()
                            .fieldFocusChange(context, currentNode, nextNode);
                    },
                    decoration: InputDecoration(
                      isCollapsed: true,
                      contentPadding: new EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 0.0),
                      fillColor: Colors.white,
                      filled: true,
                      // contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(15.0),
                          borderSide: BorderSide.none),
                      hintText: hintText,
                      hintStyle: Styles.styleTextSmallSub1Color,
                    ),
                  ),
                ),
              )
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
        validated == false
            ? Text(
                errorText,
                style: Styles.styleTextSmallRedColorItalic,
              ).marginOnly(top: 5, left: 10, bottom: 4)
            : SizedBox()
      ],
    );
  }

  Widget footerLoadMore(LoadStatus? mode) {
    Widget body;
    if (mode == LoadStatus.idle) {
      body = Text(
        "",
        // "Kéo xuống để tải lại dữ liệu",
        style: Styles.styleTextSuperSmallSub1Color,
      );
    } else if (mode == LoadStatus.loading) {
      body = CupertinoActivityIndicator();
    } else if (mode == LoadStatus.failed) {
      body = Text(
        "",
        // "Tải dữ liệu không thành công!",
        style: Styles.styleTextSuperSmallSub1Color,
      );
    } else if (mode == LoadStatus.canLoading) {
      body = Text(
        "",
        // "Thả ra để tải",
        style: Styles.styleTextSuperSmallSub1Color,
      );
    } else {
      body = Text(
        "Không còn dữ liệu",
        style: Styles.styleTextSuperSmallSub1Color,
      );
    }
    return Container(
      height: 55.0,
      child: Center(child: body),
    );
  }

  BoxDecoration decorationBlueWithRadientShadow({double? borderRadius}) {
    return BoxDecoration(
      color: AppColors.colorPrimary,
      borderRadius:
          BorderRadius.circular(borderRadius != null ? borderRadius : 30),
      gradient: new LinearGradient(
        colors: [AppColors.colorPrimary, AppColors.colorGradientButtonEnd],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
      boxShadow: [
        BoxShadow(
          color: AppColors.colorPrimary.withAlpha(70),
          blurRadius: 6,
          offset: const Offset(0, 3),
        ),
      ],
    );
  }

  BoxDecoration decorationWhiteShadow({double? borderRadius}) {
    return BoxDecoration(
      color: AppColors.white,
      borderRadius:
          BorderRadius.circular(borderRadius != null ? borderRadius : 30),
      boxShadow: [
        BoxShadow(
          color: AppColors.colorPrimary.withAlpha(50),
          blurRadius: 6,
          offset: const Offset(0, 3),
        ),
      ],
    );
  }
}
