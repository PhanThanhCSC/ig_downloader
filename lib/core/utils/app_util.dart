import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_udid/flutter_udid.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/core/values/constants.dart';
import '/core/values/enums.dart';
import '/core/values/styles.dart';
import '../../models/common_info.dart';
import '../model/base_model/response_data.dart';
import '../model/base_model/response_data_with_pages.dart';
import '../values/app_colors.dart';

class AppUtil {
  static final formatter = new NumberFormat("#,###");

  // static logAnalyticEvent(String name, String value) {
  //   Constants.analytics.logEvent(name: name, parameters: {'value': value});
  // }
  //
  // static logAnalyticUserProperty(String name, String value) {
  //   Constants.analytics.setUserProperty(name: name, value: value);
  // }

  //For health update_profile
  static void saveLocalPidAndPass(String profileId, String pid, String pass) {
    if (profileId.length == 0 || pid.length == 0 || pass.length == 0) {
      return;
    }
    String key = profileId;
    // String key = StorageConstants.listProfilePidPass;
    var saveJson = {"profileId": "$profileId", "pid": "$pid", "pass": "$pass"};
    String strInfo = json.encode(saveJson);
    try {
      saveString(key, "$strInfo");
      showLog("saveLocalPidAndPass: " + strInfo);
    } catch (ex) {}
  }

  static bool isTablet() {
    bool isTablet = false;
    if (Get.context != null) {
      isTablet = Get.context!.isTablet;
    }
    // AppUtil.showLog("isTablet: $isTablet");
    return isTablet;
  }

  //
  // static int getScreenWidth() {
  //   bool isTablet = false;
  //   if (Get.context != null) {
  //     isTablet = Get.context!.isTablet;
  //   }
  //   AppUtil.showLog("isTablet: $isTablet");
  //   return isTablet;
  // }

  bool isToday(DateTime date) {
    final now = DateTime.now();
    final diff = now.difference(date).inDays;
    return diff == 0 && now.day == date.day;
  }

  DateTime getDateWithoutTime(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  //date1 > date 2 ==> result -1
  //date1 = date 2 ==> result 0
  //date1 < date 2 ==> result 1
  int compare2DateWithoutTime(DateTime date1, DateTime date2) {
    var d1 = DateTime(date1.year, date1.month, date1.day);
    var d2 = DateTime(date2.year, date2.month, date2.day); //you can add today's date here
    return d2.compareTo(d1);
  }

  static String doubleToStringWithout0(double n, {int numberAfterComma = 1}) {
    return n.toStringAsFixed(n.truncateToDouble() == n ? 0 : numberAfterComma);
    /*  price = price.abs();
    final str = price.toStringAsFixed(price.truncateToDouble() == price ? 0 : 1);
    if (str == '0') return '0';
    if (str.endsWith('.0')) return str.substring(0, str.length - 2);
    if (str.endsWith('0')) return str.substring(0, str.length - 1);*/
    // return str;
  }

  static String doubleFormatMoney(double n) {
    String output = NumberFormat.decimalPattern().format(n);
    return output;
  }

  Future<String> getDeviceId() async {
    String uniqueDeviceId = await FlutterUdid.udid;
    AppUtil.showLog('getDeviceId: $uniqueDeviceId');
    return uniqueDeviceId;
  }

  bool twoDateIsEqual(DateTime date1, DateTime date2) {
    bool isSelected = DateTime(date1.year, date1.month, date1.day).difference(DateTime(date2.year, date2.month, date2.day)).inDays == 0;
    return isSelected;
  }

  static String formatDoubleToMoney(double number) {
    String outStr = formatter.format(number);
    return outStr;
  }

  static String formatIntToMoney(int number) {
    String outStr = formatter.format(number);
    return outStr;
  }

  static String formatDateTimeToStringDate(DateTime? inputDate) {
    if (inputDate == null) return "";
    String outStr = DateFormat(Styles.FORMAT_DATEONLY).format(inputDate);
    return outStr;
  }

  static String formatDateTimeToStringDateAndTime(DateTime? inputDate) {
    if (inputDate == null) return "";
    String outStr = DateFormat(Styles.FORMAT_DATE_AND_TIME).format(inputDate);
    return outStr;
  }

  String formatPhoneNumberWith0(String phoneNumber) {
    AppUtil.showLog("formatPhoneNumberWith0 phoneNumber input: " + phoneNumber);
    if (phoneNumber.isEmpty || phoneNumber.length < 8) {
      phoneNumber = "";
    } else if (!phoneNumber.startsWith("0") && !phoneNumber.startsWith("+") && !phoneNumber.startsWith("84")) phoneNumber = "0" + phoneNumber;
    // else
    //   phoneNumber = "";
    AppUtil.showLog("formatPhoneNumberWith0 phoneNumber output: " + phoneNumber);
    return phoneNumber;
  }

  GenderType formatGenderToGenderType(String strGender) {
    GenderType genderType = GenderType.MALE;
    switch (strGender) {
      case "MALE":
        genderType = GenderType.MALE;
        break;
      case "FEMALE":
        genderType = GenderType.FEMALE;
        break;
      case "BOTH":
        genderType = GenderType.BOTH;
        break;
      case "OTHER":
        genderType = GenderType.OTHER;
        break;
      default:
        genderType = GenderType.MALE;
        break;
    }
    return genderType;
  }

  String formatGenderForDisplay(String? strGender) {
    if (strGender == null) return "";
    String genderName = "Nam";
    switch (strGender.toLowerCase()) {
      case "male":
        genderName = "Nam";
        break;
      case "female":
        genderName = "Nữ";
        break;
      case "both":
        genderName = "Tất cả";
        break;
      case "other":
        genderName = "Không xác định";
        break;
      default:
        genderName = "Nam";
        break;
    }
    return genderName;
  }

  String formatAppointmentTypeForDisplay(String? _methodType) {
    if (_methodType == null) return "";
    String methodType = "Tại viện";
    switch (_methodType.toLowerCase()) {
      case "home":
        methodType = "Tại nhà";
        break;
      case "hospital":
        methodType = "Tại viện";
        break;
      case "both":
        methodType = "Tại nhà, Tại viện";
        break;
      case "other":
        methodType = "Tại nhà, Tại viện";
        break;
      default:
        methodType = "Tại viện";
        break;
    }
    return methodType;
  }

  double formatDiscountForDisplay(double originPrice, double salePrice) {
    double discountValue = 0;
    discountValue = 100 * ((originPrice - salePrice) / originPrice);
    // AppUtil.showLog("formatDiscountForDisplay originPrice: $originPrice, salePrice: $salePrice, discount: $discountValue");
    return discountValue;
  }

  String formatAgeForDisplay(int? minAge, int? maxAge) {
    String result = "";
    if (minAge == null || maxAge == null) return "";
    if (minAge == 0 && maxAge >= 100) {
      result = "Tất cả";
    }
    if (minAge == 0 && maxAge < 100) {
      result = "Dưới $maxAge tuổi";
    }
    if (minAge > 0 && maxAge >= 100) {
      result = "Trên $minAge tuổi";
    }

    if (minAge > 0 && maxAge < 100) {
      result = "Từ $minAge tuổi đến $maxAge tuổi";
    }
    // AppUtil.showLog("formatAgeForDisplay minAge: $minAge, maxAge: $maxAge, result: $result");
    return result;
  }

  String formatProvinceInfoShortDisplay(List<CommonInfo>? _provinceInfos) {
    //test add nhiều province
    if (_provinceInfos == null) _provinceInfos = [];
    // _provinceInfos.add(new CommonInfo("1", "Thanh Hoá", "1"));
    // _provinceInfos.add(new CommonInfo("2", "Thanh Hoá 2", "2"));
    // _provinceInfos.add(new CommonInfo("3", "Thanh Hoá 4", "3"));
    // _provinceInfos.add(new CommonInfo("4", "Thanh Hoá 5", "4"));
    String result = "";
    if (_provinceInfos == null) return result;

    if (_provinceInfos.length <= 3) {
      for (var i = 0; i < _provinceInfos.length; ++i) {
        CommonInfo _province = _provinceInfos[i];
        if (i == _provinceInfos.length - 1) {
          result += _province.name;
        } else {
          result += _province.name + ", ";
        }
      }
    } else if (_provinceInfos.length > 3) {
      for (var i = 0; i < 3; ++i) {
        CommonInfo _province = _provinceInfos[i];
        //lấy 3
        if (i == 2) {
          result += _province.name;
        } else {
          result += _province.name + ", ";
        }
      }
      result = result + " (" + (_provinceInfos.length - 3).toString() + ")";
    }

    return result;
  }

  String formatProvinceInfoFullDisplay(List<CommonInfo>? _provinceInfos) {
    //test add nhiều province
    if (_provinceInfos == null) _provinceInfos = [];
    // _provinceInfos.add(new CommonInfo("1", "Thanh Hoá", "1"));
    // _provinceInfos.add(new CommonInfo("2", "Thanh Hoá 2", "2"));
    // _provinceInfos.add(new CommonInfo("3", "Thanh Hoá 4", "3"));
    // _provinceInfos.add(new CommonInfo("4", "Thanh Hoá 5", "4"));
    String result = "";
    if (_provinceInfos == null) return result;

    AppUtil.showLog("formatProvinceInfoFullDisplay _provinceInfos: " + jsonEncode(_provinceInfos));
    for (var i = 0; i < _provinceInfos.length; ++i) {
      CommonInfo _province = _provinceInfos[i];
      if (i == _provinceInfos.length - 1) {
        result += _province.name;
      } else {
        result += _province.name + "\n";
      }
    }

    return result;
  }

  static dismissKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static showPermissionDialog({
    required Widget content,
    bool barrierDismissible = true,
  }) async {
    return await Get.dialog(
        Container(
          width: double.infinity,
          height: double.infinity,
          child: content,
        ),
        barrierDismissible: barrierDismissible,
        useSafeArea: true);
  }

  static showDialog(Widget content) {
    Get.dialog(
        Container(
          width: double.infinity,
          height: double.infinity,
          child: content,
        ),
        useSafeArea: true);
  }

  bool isNumeric(String s) {
    if (s.trim() == "" || s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  bool isPhoneValidWithout0(String? phoneNo) {
    if (phoneNo == null) return false;
    if (phoneNo.startsWith("0") && phoneNo.length != 10) return false;
    if (phoneNo.startsWith("+") && phoneNo.length != 12) return false;
    if (phoneNo.startsWith("84") && phoneNo.length < 9 && phoneNo.length > 11) return false;
    if (phoneNo == null || phoneNo.length < 9 || phoneNo.length > 12) return false;
    final regExp = RegExp(r'(84|0[3|5|7|8|9])+([0-9]{8})');
    // final regExp = RegExp(r'(^(?:[+0]9)?[0-9]{9,11}$)');
    return regExp.hasMatch(phoneNo);
  }

  bool isPhoneValid(String? phoneNo) {
    if (phoneNo == null) return false;
    if ((phoneNo.startsWith("0") == true && phoneNo.length < 9) || (phoneNo.startsWith("0") && phoneNo.length > 11)) return false;
    final regExp = RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');
    return regExp.hasMatch(phoneNo);
  }

  bool isEmailValid(String _email) {
    return RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(_email);
  }

  isIntroShowed() {
    try {
      if (getBool(Constants.kFirstTimeOpenApp) == null || getBool(Constants.kFirstTimeOpenApp) == false) {
        return false;
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  saveFirstTimeOpenApp() {
    return saveBool(Constants.kFirstTimeOpenApp, true);
  }

  String formatImageUrlWithPlaceholder(String _url) {
    String placeHolder = "assets/imagedefault.png";
    if (isValidURL(_url)) {
      return _url;
    } else {
      return placeHolder;
    }
  }

  bool isValidURL(String _url) {
    bool isValid = false;
    if (_url != null && (_url.startsWith("http") || _url.startsWith("https")) && _url.length > 10) isValid = true;
    return isValid;
  }

  fieldFocusChange(BuildContext? context, FocusNode currentFocus, FocusNode nextFocus) {
    if (context != null) {
      currentFocus.unfocus();
      FocusScope.of(context).requestFocus(nextFocus);
    }
  }

  static String getWeekDayName(DateTime date) {
    String result = "";
    switch (date.weekday) {
      case 1: //monday
        result = "T2";
        break;
      case 2: //tuesday
        result = "T3";
        break;
      case 3: //wednesday
        result = "T4";
        break;
      case 4: //thursday
        result = "T5";
        break;
      case 5: //friday
        result = "T6";
        break;
      case 6: //saturday
        result = "T7";
        break;
      case 7: //sunday
        result = "CN";
        break;
    }

    return result;
  }

  static void unfocus(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  // static showLoading() {
  //   EasyLoading.show(dismissOnTap: true);
  // }
  //
  // static hideLoading() {
  //   EasyLoading.dismiss();
  // }

  static showLoading() {
    EasyLoading.show(dismissOnTap: true);
  }

  static hideLoading() {
    EasyLoading.dismiss();
  }

  //Using Getx
  static String getString(String key) {
    String result = "";
    var storage = Get.find<SharedPreferences>();
    if (storage.containsKey(key) && storage.getString(key) != null) {
      result = storage.getString(key)!;
    }
    return result;
  }

  static void saveString(String key, String value) async {
    final prefs = Get.find<SharedPreferences>();
    prefs.setString(key, value);
  }

  static bool getBool(String key) {
    bool result = false;
    var storage = Get.find<SharedPreferences>();
    if (storage.containsKey(key) && storage.getBool(key) != null) {
      result = storage.getBool(key)!;
    }
    return result;
  }

  static void saveBool(String key, bool value) async {
    final prefs = Get.find<SharedPreferences>();
    prefs.setBool(key, value);
  }

  /// ------------------------------------------------------------
  /// Method that returns the user decision to allow notifications
  /// ------------------------------------------------------------
  static Future<String> getFromSetting(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(key) ?? "";
  }

  /// ----------------------------------------------------------
  /// Method that saves the user decision to allow notifications
  /// ----------------------------------------------------------
  static Future<bool> saveToSettting(String key, String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString(key, value);
  }

  static Future<bool> saveBoolToSettting(String key, bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setBool(key, value);
  }

  static void showNormalToast(String msg) {
    Fluttertoast.showToast(msg: msg, backgroundColor: AppColors.white, textColor: AppColors.black, timeInSecForIosWeb: 4);
  }

  static void showToast(String msg) {
    // Fluttertoast.showToast(msg: msg, backgroundColor: AppColors.white, textColor: AppColors.redPrimary, timeInSecForIosWeb: 4);
    showSimpleNotification(
        Text(
          msg,
          style: Styles.styleTextNormalMainColor,
        ),
        duration: Duration(seconds: 3),
        background: AppColors.white);
    // Fluttertoast.showToast(msg: msg, backgroundColor: AppColors.textMain, textColor: AppColors.white, timeInSecForIosWeb: 4);
  }

  static void showToastError(String msg) {
    // Fluttertoast.showToast(msg: msg, backgroundColor: AppColors.white, textColor: AppColors.redPrimary, timeInSecForIosWeb: 4);
    showSimpleNotification(Text(msg, style: Styles.styleTextNormalWhiteColor), duration: Duration(seconds: 5), background: AppColors.redPrimary);
  }

  static void showLog(String text) {
    debugPrint("====> $text");
  }

  static void showLogFull(String text) {
    log(text);
  }

  static String timeAgoSinceDate(DateTime? date, {bool numericDates = true}) {
    // AppUtil.showLog("timeAgoSinceDate value: "+ date!.toIso8601String() + ", now: " + DateTime.now().toIso8601String());
    if (date == null) return "Vừa xong";
    final date2 = DateTime.now();
    final difference = date2.difference(date);

    if ((difference.inDays / 365).floor() >= 2) {
      return '${(difference.inDays / 365).floor()} năm trước';
    } else if ((difference.inDays / 365).floor() >= 1) {
      return (numericDates) ? '1 năm trước' : 'Năm trước';
    } else if ((difference.inDays / 30).floor() >= 2) {
      return '${(difference.inDays / 30).floor()} tháng trước';
    } else if ((difference.inDays / 30).floor() >= 1) {
      return (numericDates) ? '1 tháng trước' : 'Tháng trước';
    } else if ((difference.inDays / 7).floor() >= 2) {
      return '${(difference.inDays / 7).floor()} tuần trước';
    } else if ((difference.inDays / 7).floor() >= 1) {
      return (numericDates) ? '1 tuần trước' : 'Tuần trước';
    } else if (difference.inDays >= 2) {
      return '${difference.inDays} ngày trước';
    } else if (difference.inDays >= 1) {
      return (numericDates) ? '1 ngày trước' : 'Hôm qua';
    } else if (difference.inHours >= 2) {
      return '${difference.inHours} giờ trước';
    } else if (difference.inHours >= 1) {
      return (numericDates) ? '1 giờ trước' : 'giờ trước';
    } else if (difference.inMinutes >= 2) {
      return '${difference.inMinutes} phút trước';
    } else if (difference.inMinutes >= 1) {
      return (numericDates) ? '1 phút trước' : '1 phút trước';
    } else if (difference.inSeconds >= 3) {
      return '${difference.inSeconds} giây trước';
    } else {
      return 'Vừa xong';
    }
  }
}
