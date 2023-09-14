import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../api_rest/api_repository.dart';
import '../../../models/base_rest_model.dart';
import '../../utils/app_util.dart';
import '../../values/constants.dart';
import 'interceptors/auth_interceptor.dart';
import 'interceptors/request_interceptor.dart';
import 'interceptors/response_interceptor.dart';

class BaseProvider extends GetConnect {
  /*
  Khối master: https://gateway.medon.vn/api/master
  Khối account: https://gateway.medon.vn/api/account
  Khối appointment: https://gateway.medon.vn/api/appointment
  Khối news: https://gateway.medon.vn/api/news
  Khối qa: https://gateway.medon.vn/api/qa
  Khối videocall: https://gateway.medon.vn/api/videocall
  Khối tích hợp (medcom): https://gateway.medon.vn/api/medcom
  Khối auth: https://gateway.medon.vn/api/auth
  Khối utility (ảnh): https://gateway.medon.vn/api/utility
  * */

  // static String baseAPIResult = "http://10.78.4.84:8002/api/v1/patient/";
/*
  static String baseAPIAuth = BuildConfig.instance.config.baseUrlAuthen;
  static String baseAPIUtility = BuildConfig.instance.config.baseUrlUtility;

  //Auth
  String urlLoginAPP = baseAPIAuth + "loginApp";
  String urlLogoutAPP = baseAPIAuth + "logout";
  String urlVerifyOTP = baseAPIAuth + "verifyOtp";
  String urlRefreshToken = baseAPIAuth + "refresh-token";*/

  // String urlUpdateProfile = baseAPIAuth + "updateProfile";

  //result
  // String urlGetPIDByPhone = ConstantsEndpoint.baseAPIResult + "getPIDByPhone?phoneNumber=";
  // String urlGetLastMedicalCheckupDetail = ConstantsEndpoint.baseAPIResult + "getLastMedicalCheckupDetail?phone=";
  // String urlGetMedicalCheckupHistory = ConstantsEndpoint.baseAPIResult + "getMedicalCheckupHistory";
  // String urlGetMedicalCheckupDetail = ConstantsEndpoint.baseAPIResult + "getMedicalCheckupDetail?sid=";
  // String urlGetDetailImages = ConstantsEndpoint.baseAPIResult + "getListImages";
  // String urlGetResultChart = ConstantsEndpoint.baseAPIResult + "getChart";

  @override
  void onInit() {
    allowAutoSignedCert = true;
    httpClient.baseUrl = "";
    // httpClient.baseUrl = ApiConstants.httpApiUrlAuth;
    httpClient.addAuthenticator(authInterceptor);
    httpClient.addRequestModifier(requestInterceptor);
    httpClient.addResponseModifier(responseInterceptor);
    httpClient.timeout = const Duration(seconds: 60);
    timeout = const Duration(seconds: 60);
  }

  sendGet(String url) async {
    // request.headers['Content-Type'] = 'application/json';
    // request.headers['Token'] =
    String accessToken = await AppUtil.getString(Constants.access_token);
    AppUtil.showLog("sendGet Url:" + url + ", Token: " + accessToken);
    final res = await get(url,
            headers: <String, String>{"Authorization": "Bearer " + accessToken, 'Accept': 'application/json; charset=UTF-8', 'Accept-Language': 'vi'},
            contentType: "application/json")
        .timeout(Duration(seconds: 38));
    // try {
    if (res != null) {
      try {
        AppUtil.showLog("BaseProvider sendGet url: $url response: " + jsonEncode(res.body));
      } catch (e) {}
      if (res.statusCode == 200) {
        // return BaseRestModel.fromJsonMap(res.body);
        BaseRestModel responseModel;
        AppUtil.showLog("BaseProvider sendGet res.body data type: ${res.body}");
        if (res.body is String) {
          responseModel = BaseRestModel.fromJsonMap(jsonDecode(res.body));
        } else {
          responseModel = BaseRestModel.fromJsonMap(res.body);
        }
        // BaseRestModel responseModel = BaseRestModel.fromJsonMap(jsonDecode(res.body));
        if (responseModel != null && responseModel.status == 0 && responseModel.code == "TOKEN_EXPIRED") {
          /* AppUtil.showLog("BaseProvider sendPostStringee TOKEN_EXPIRED");
          ApiRepository apiRepository = new ApiRepository();
          final res = await apiRepository.refreshToken();
          try {
            if (res != null && res.status == res.STATUS_SUCCESS) {
              AppUtil.showLog("requestRefreshToken SUCCESS ==> RECALL API: ");
              if (res.data != null) {
                try {
                  String newToken = res.data["token"];
                  String newRefreshToken = res.data["refreshToken"];
                  AppUtil.showLog("newToken: $newToken");
                  AppUtil.showLog("newRefreshToken: $newRefreshToken");

                  AppUtil.saveString(Constants.access_token, newToken);
                  AppUtil.saveString(Constants.refresh_token, newRefreshToken);

                  AppUtil.showLog("Recall API");
                  return await sendGet(url);
                  // return queryResult;
                } catch (e) {
                  AppUtil.showLog("refreshToken error: " + e.toString());
                }
              }
            } else {
              AppUtil.showLog("requestRefreshToken FAIL ==> CHECK CURRENT ROUTE ==> IF NOT LOGIN ==> GOTO LOGIN");
              AppUtil.showLog("requestRefreshToken FAIL ==> CURRENT ROUTE: " + Get.currentRoute);
              if (!Get.currentRoute.contains("Login")) {
                AppUtil.showLog("requestRefreshToken FAIL ==> GO TO LOGIN");
                Get.offAllNamed(AppRoutes.LOGIN);
              } else {
                AppUtil.showLog("requestRefreshToken FAIL ==> NOT GO TO LOGIN");
              }
            }
          } catch (e) {
            AppUtil.hideLoading();
          }*/
        } else {
          AppUtil.showLog("BaseProvider TOKEN NOT EXPIRED");
          return responseModel;
        }
      } else {
        // AppUtil.showToast(Constants.CommonErrorMessage);
        return null;
      }
    } else {
      AppUtil.showLog("BaseProvider sendGet response: NULL");
    }
    // } catch (e) {
    //   AppUtil.showLog("BaseProvider sendGet ERROR" + e.toString());
    //   return null;
    // }
  }

  sendPost(String url, dynamic data) async {
    try {
      AppUtil.showLog("BaseProvider sendPost url: " + url + ", Body: " + jsonEncode(data));
    } catch (e) {
      AppUtil.showLog("Error log sendPost data:" + e.toString());
    }
    String accessToken = await AppUtil.getString(Constants.access_token);

    // final res = await get(url, headers: <String, String>{'Token': token, 'Accept': 'application/json; charset=UTF-8'}, contentType: "application/json");
    final res = await post(url, data, headers: <String, String>{"Authorization": "Bearer " + accessToken, 'Accept': 'application/json; charset=UTF-8', 'Accept-Language': 'vi'})
        .timeout(Duration(seconds: 38));
    try {
      if (res != null) {
        AppUtil.showLogFull("BaseProvider sendPost $url response: " + jsonEncode(res.body));
        if (res.statusCode == 200) {
          BaseRestModel responseModel = BaseRestModel.fromJsonMap(res.body);
          if (responseModel != null && responseModel.status == Constants.RESPONSE_STATUS_FAIL && responseModel.code == "TOKEN_EXPIRED") {
            /* AppUtil.showLog("BaseProvider TOKEN_EXPIRED");
            AppUtil.showLog("Request refreshToken");
            ApiRepository apiRepository = new ApiRepository();
            final res = await apiRepository.refreshToken();
            try {
              if (res != null && res.status == res.STATUS_SUCCESS) {
                AppUtil.showLog("requestRefreshToken SUCCESS ==> RECALL API: ");
                if (res.data != null) {
                  try {
                    String newToken = res.data["token"];
                    String newRefreshToken = res.data["refreshToken"];
                    AppUtil.showLog("newToken: $newToken");
                    AppUtil.showLog("newRefreshToken: $newRefreshToken");

                    AppUtil.saveString(Constants.access_token, newToken);
                    AppUtil.saveString(Constants.refresh_token, newRefreshToken);

                    AppUtil.showLog("Recall API");
                    return await sendPost(url, data);
                    // return queryResult;
                  } catch (e) {
                    AppUtil.showLog("refreshToken error: " + e.toString());
                  }
                }
              } else {
                AppUtil.showLog("requestRefreshToken FAIL ==> CHECK CURRENT ROUTE ==> IF NOT LOGIN ==> GOTO LOGIN");
                AppUtil.showLog("requestRefreshToken FAIL ==> CURRENT ROUTE: " + Get.currentRoute);
                if (!Get.currentRoute.contains("Login")) {
                  AppUtil.showLog("requestRefreshToken FAIL ==> GO TO LOGIN");
                  Get.offAllNamed(AppRoutes.LOGIN);
                } else {
                  AppUtil.showLog("requestRefreshToken FAIL ==> NOT GO TO LOGIN");
                }
              }
            } catch (e) {
              AppUtil.hideLoading();
            }*/
          } else {
            AppUtil.showLog("BaseProvider TOKEN NOT EXPIRED");
            return responseModel;
          }
        } else {
          // AppUtil.showToast(Constants.CommonErrorMessage);
          return null;
        }
      } else {
        AppUtil.showLog("BaseProvider sendPost response: NULL");
      }
    } catch (e) {
      AppUtil.showLog("BaseProvider sendPost ERROR" + e.toString());
    }
  }

  sendPostStringee(String url, String userId) async {
    try {
      AppUtil.showLog("BaseProvider sendPostStringee url: " + url + ", Body: " + userId);
    } catch (e) {
      AppUtil.showLog("Error log sendPostStringee data:" + e.toString());
    }
    String accessToken = await AppUtil.getString(Constants.access_token);
    var map = new Map<String, dynamic>();
    map['id'] = userId;
    Map<String, String> defaultHeaders = {'Accept-Language': 'vi', 'Token': accessToken};
    var response = await http.post(Uri.parse(url), body: map, headers: defaultHeaders);
    AppUtil.showLog("BaseProvider sendPostStringee response: ${response.toString()}");
    if (response.statusCode == 200) {
      if (response != null && response.body != null) {
        BaseRestModel responseModel = BaseRestModel.fromJsonMap(jsonDecode(response.body));
        if (responseModel != null && responseModel.status == 0 && responseModel.code == "TOKEN_EXPIRED") {
          /*  AppUtil.showLog("BaseProvider sendPostStringee TOKEN_EXPIRED");
          ApiRepository apiRepository = new ApiRepository();
          final res = await apiRepository.refreshToken();
          try {
            if (res != null && res.status == res.STATUS_SUCCESS) {
              AppUtil.showLog("requestRefreshToken SUCCESS ==> RECALL API: ");
              if (res.data != null) {
                try {
                  String newToken = res.data["token"];
                  String newRefreshToken = res.data["refreshToken"];
                  AppUtil.showLog("sendPostStringee newToken: $newToken");
                  AppUtil.showLog("sendPostStringee newRefreshToken: $newRefreshToken");

                  AppUtil.saveString(Constants.access_token, newToken);
                  AppUtil.saveString(Constants.refresh_token, newRefreshToken);

                  AppUtil.showLog("sendPostStringee Recall API");
                  return await sendPostStringee(url, userId);
                  // return queryResult;
                } catch (e) {
                  AppUtil.showLog("sendPostStringee refreshToken error: " + e.toString());
                }
              }
            } else {
              AppUtil.showLog("sendPostStringee requestRefreshToken FAIL ==> CHECK CURRENT ROUTE ==> IF NOT LOGIN ==> GOTO LOGIN");
              AppUtil.showLog("sendPostStringee requestRefreshToken FAIL ==> CURRENT ROUTE: " + Get.currentRoute);
              if (!Get.currentRoute.contains("Login")) {
                AppUtil.showLog("sendPostStringee requestRefreshToken FAIL ==> GO TO LOGIN");
                Get.offAllNamed(AppRoutes.LOGIN);
              } else {
                AppUtil.showLog("sendPostStringee requestRefreshToken FAIL ==> NOT GO TO LOGIN");
              }
            }
          } catch (e) {
            AppUtil.hideLoading();
          }*/
        } else {
          AppUtil.showLog("BaseProvider TOKEN NOT EXPIRED");
          return responseModel;
        }
      }
    }
  }

  Future<Null> onTokenExpire(BaseRestModel responseModel) async {
    // if (responseModel != null && responseModel.status == 0 && responseModel.code == "TOKEN_EXPIRED") {
    AppUtil.showLog("BaseProvider TOKEN_EXPIRED");
    AppUtil.showLog("Request refreshToken");
   /* ApiRepository apiRepository = new ApiRepository();
    final res = await apiRepository.refreshToken();
    try {
      if (res != null && res.status == res.STATUS_SUCCESS) {
        AppUtil.showLog("requestRefreshToken SUCCESS ==> RECALL API: ");
        if (res.data != null) {
          try {
            String newToken = res.data["token"];
            String newRefreshToken = res.data["refreshToken"];
            AppUtil.showLog("newToken: $newToken");
            AppUtil.showLog("newRefreshToken: $newRefreshToken");

            AppUtil.saveString(Constants.access_token, newToken);
            AppUtil.saveString(Constants.refresh_token, newRefreshToken);

            AppUtil.showLog("Recall API");
            // return await sendPost(url, data);
            // return queryResult;
          } catch (e) {
            AppUtil.showLog("refreshToken error: " + e.toString());
          }
        }
      } else {
        AppUtil.showLog("requestRefreshToken FAIL ==> CHECK CURRENT ROUTE ==> IF NOT LOGIN ==> GOTO LOGIN");
        AppUtil.showLog("requestRefreshToken FAIL ==> CURRENT ROUTE: " + Get.currentRoute);
        if (!Get.currentRoute.contains("Login")) {
          AppUtil.showLog("requestRefreshToken FAIL ==> GO TO LOGIN");
          Get.offAllNamed(AppRoutes.LOGIN);
        } else {
          AppUtil.showLog("requestRefreshToken FAIL ==> NOT GO TO LOGIN");
        }
      }
    } catch (e) {
      AppUtil.hideLoading();
    }*/

    // } else {
    //   AppUtil.showLog("BaseProvider TOKEN NOT EXPIRED");
    // }
  }

  sendPostRefreshToken(String url) async {
    try {
      AppUtil.showLog("BaseProvider sendPostRefreshToken url: " + url);
    } catch (e) {
      AppUtil.showLog("Error log sendPostRefreshToken data:" + e.toString());
    }
    String accessToken = await AppUtil.getString(Constants.access_token);
    String refreshToken = await AppUtil.getString(Constants.refresh_token);
    AppUtil.showLogFull("BaseProvider sendPostRefreshToken accessToken: $accessToken, refreshToken: $refreshToken ");

    // final res = await get(url, headers: <String, String>{'Token': token, 'Accept': 'application/json; charset=UTF-8'}, contentType: "application/json");
    final res = await post(url, {"refreshToken": refreshToken},
        headers: <String, String>{"Authorization": "Bearer " + accessToken, 'Accept': 'application/json; charset=UTF-8', 'Accept-Language': 'vi'});
    try {
      if (res != null) {
        AppUtil.showLogFull("BaseProvider sendPostRefreshToken $url response: " + jsonEncode(res.body));
        if (res.statusCode == 200) {
          return BaseRestModel.fromJsonMap(res.body);
        } else {
          // AppUtil.showToast(Constants.CommonErrorMessage);
          return null;
        }
      } else {
        AppUtil.showLog("BaseProvider sendPostRefreshToken response: NULL");
      }
    } catch (e) {
      AppUtil.showLog("BaseProvider sendPostRefreshToken ERROR" + e.toString());
    }
  }

/*
  postStringee(String url, String userID) async {
    AppUtil.showLog("BaseProvider getStringeeToken userID: " + userID);
    // String accessToken = await AppUtil.getString(Constants.access_token);

    // final res = await get(url, headers: <String, String>{'Token': token, 'Accept': 'application/json; charset=UTF-8'}, contentType: "application/json");
    final res = await post(url, null, headers: <String, String>{'id': userID, 'Accept': 'application/json; charset=UTF-8'});
    try {
      if (res != null) {
        AppUtil.showLogFull("BaseProvider getStringeeToken response: " + jsonEncode(res.body));
        if (res.statusCode == 200) {
          return BaseRestModel.fromJsonMap(res.body);
        } else {
          AppUtil.showToast(Constants.CommonErrorMessage);
          return null;
        }
      } else {
        AppUtil.showLog("BaseProvider sendPost response: NULL");
      }
    } catch (e) {
      AppUtil.showLog("BaseProvider sendPost ERROR" + e.toString());
    }
  }*/

  Future<BaseRestModel> uploadMultiFiles(String url, List<File> files) async {
    AppUtil.showLoading();
// string to uri
    var uri = Uri.parse(url);
    AppUtil.showLog("uploadMultiFiles url: " + uri.path);

// create multipart request
    var request = new http.MultipartRequest("POST", uri);

    for (var file in files) {
      String fileName = file.path.split("/").last;
      var stream = http.ByteStream(file.openRead())..cast();
      // get file length
      var length = await file.length(); //imageFile is your image file
      // multipart that takes file
      var multipartFileSign = new http.MultipartFile('files', stream, length, filename: fileName);
      request.files.add(multipartFileSign);
    }
    // Map<String, String> headers = {"Accept": "application/json", "Authorization": "Bearer $value"}; // ignore this headers if there is no authentication
    //add headers
    //     request.headers.addAll(headers);
    //adding params
    //     request.fields['id'] = userid;

    // send
    var res = await request.send();
    BaseRestModel responseModel = BaseRestModel();
    try {
      if (res != null) {
        String strResponse = await res.stream.bytesToString();
        AppUtil.showLog("BaseProvider uploadMultiFiles response: " + strResponse);
        if (res.statusCode == 200) {
          responseModel = BaseRestModel.fromJsonMap(jsonDecode(strResponse));
        } else {
          // AppUtil.showToast(Constants.CommonErrorMessage);
          responseModel = BaseRestModel();
        }
      } else {
        AppUtil.showLog("BaseProvider uploadMultiFiles response: NULL");
      }
    } catch (e) {
      AppUtil.showLog("BaseProvider uploadMultiFiles ERROR" + e.toString());
    }
    AppUtil.hideLoading();
    return responseModel;
  }

  Future<String> uploadFile(String url, List<int> img, String filename) async {
    final avatar = MultipartFile(img, filename: filename);
    final res = await post(
      url,
      FormData({'files': avatar}),
    );
    try {
      if (res != null) {
        AppUtil.showLog("BaseProvider updateAvatar response: " + jsonEncode(res.body));
        if (res.statusCode == 200) {
          return res.body;
        } else {
          AppUtil.showToast(Constants.CommonErrorMessage);
          return "";
        }
      } else {
        AppUtil.showLog("BaseProvider updateAvatar response: NULL");
      }
    } catch (e) {
      AppUtil.showLog("BaseProvider updateAvatar ERROR" + e.toString());
    }
    return "";
  }
}
