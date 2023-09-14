import 'dart:io';

import '../core/network/base_rest/base_provider.dart';
import '../flavors/build_config.dart';


class ApiRepository extends BaseProvider {
  static String baseAPIAuth = BuildConfig.instance.config.baseUrlAuthen;
  static String baseAPIUtility = BuildConfig.instance.config.baseUrlUtility;

  //Auth
  String urlLoginAPP = baseAPIAuth + "/user/getOtp";
  String urlVerifyOTP = baseAPIAuth + "/user/verifyOtp";
  String urlLogoutAPP = baseAPIAuth + "/user/logout";
  String urlRefreshToken = baseAPIAuth + "/user/refresh-token";

  //Ultility
  String urlUploadAvatar = baseAPIUtility + "/fileUpload/uploadAvatar";

  ApiRepository() {
    timeout = Duration(seconds: 60);
  }
}
