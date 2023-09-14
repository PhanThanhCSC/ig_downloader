import 'dart:convert';
import 'dart:math';

import '../../models/common_info.dart';

class Constants {
  // static final FirebaseAnalytics analytics = FirebaseAnalytics();

  //để bên util thì đang bị xung đột hàm log của showLog với log trong thư viện math
  String getRandString(int len) {
    var random = Random.secure();
    var values = List<int>.generate(len, (i) => random.nextInt(255));
    return base64UrlEncode(values);
  }

  static final String userId = 'userId';
  static final String userName = 'userName';
  static final String userPhone = 'userPhone';
  static final String userAvatar = 'userAvatar';
  static final String userInfo = 'userInfo';
  static final String profileId = 'profileId';
  static final String fcmToken = 'fcm_token';
  static final String access_token = 'access_token';
  static final String refresh_token = 'refresh_token';
  static final String firebase_topic = 'firebase_topic';
  static final String testStringeeFromId = 'testStringeeFromId';
  static final String testStringeeToId = 'testStringeeToId';
  static final kFirstTimeOpenApp = 'isFirstTimeOpenApp';
  static final String userPID = 'user_pid_id';
  static final String userPIDPassword = 'user_pid_password';
  static final String isAskFullPermission = 'true';
  static final String listProfilePidPass = 'listProfilePidPass';

  static bool isNeedReloadHistoryAppointments = false;
  static bool isNeedReloadHistoryVideoCall = false;

  static String urlPreviewImage = "http://58.186.85.189:31491/";

  static String imagedefault = "assets/imagedefault.png";
  static String imageLoading = "assets/imagedefault.png";

  // static const String ARG_TYPE_CREATE = "ARG_TYPE_CREATE";
  // static const String ARG_TYPE_EDIT = "ARG_TYPE_EDIT";
  static const String CommonErrorMessage = "Không thành công. Vui lòng thử lại";

  ////895  - test PCR / 896 - test Nhanh
  static const String PACKAGE_ID_COVID_QUICK_TEST = "896";
  static const String PACKAGE_ID_COVID_PCR_TEST = "895";

  static const int RESPONSE_STATUS_SUCCESS = 0;
  static const int RESPONSE_STATUS_FAIL = 1;
  static const String RESPONSE_CODE_SUCCESS = "SUCCESS";

  static const String RESULT_SUCCESS = "RESULT_SUCCESS";
  static const String RESULT_FAILURE = "RESULT_FAILURE";
  static const String RESULT_SUCCESS_AND_GOTO_HISTORY = "RESULT_SUCCESS_AND_GOTO_HISTORY";
  //Notify Type
  static const String NOTIFY_CODE_NEWS = "NEWS";
  static const String NOTIFY_CODE_APP_UPDATE = "APP_UPDATE";
  static const String NOTIFY_CODE_VIDEO_CALL = "VIDEO_CALL";
  static const String NOTIFY_CODE_QUESTION_ANSWER = "QUESTION_ANSWER";
  static const String NOTIFY_CODE_WEB_VIEW = "WEB_VIEW";

  //BannerType
  static const String BANNER_TYPE_BANNER_NEWS = "BANNER_NEWS";
  static const String BANNER_TYPE_BANNER_PACKAGE = "BANNER_PACKAGE";
  static const String BANNER_TYPE_BANNER_VC = "BANNER_VC";
  static const String BANNER_TYPE_BANNER_XNTN = "BANNER_XNTN";
  static const String BANNER_TYPE_BANNER_HOS = "BANNER_HOS";
  static const String BANNER_TYPE_BANNER_LINK = "BANNER_LINK";
  static const String BANNER_TYPE_BANNER_VIEW = "BANNER_VIEW";

  static const String CONFIRM_OK = "CONFIRM_OK";
  static const String CONFIRM_CANCEL = "CONFIRM_CANCEL";

  static CommonInfo GENDER_MALE = new CommonInfo("male", "Nam", "male");
  static CommonInfo GENDER_FEMALE = new CommonInfo("female", "Nữ", "female");
  static CommonInfo GENDER_OTHER = new CommonInfo("other", "Không xác định", "other");

  static String hintCommon = "Vui lòng chọn";
  static String hintProvince = "Chọn tỉnh/thành phố";
  static String hintDistrict = "Chọn quận/huyện";
  static String hintWard = "Chọn xã/phường";
  static CommonInfo CommonInfoAll = new CommonInfo("", "Tất cả", "");
  static CommonInfo CommonInfoEmpty = new CommonInfo("", "Vui lòng chọn", "");

  static CommonInfo CommonInfoEmptyWithHint(String hint) {
    return new CommonInfo("", hint, "");
  }

  // static WorkTimeModel workTimeEmpty(String hint) {
  //   return new WorkTimeModel().emptyWorkTime(hint);
  // }

  static int countShowConnectionStatus = 0; //Lần đầu mở app ko cần show tình trạng kết nối mạng. TỪ những lần sau có thay đổi kết nối mạng thì sẽ show toast cho người dùng
}
