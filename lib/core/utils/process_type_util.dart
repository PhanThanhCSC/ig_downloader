import 'package:get/get.dart';

import '../values/constants.dart';
import 'app_util.dart';
import 'dialog_util.dart';

class ProcessTypeUtil {
  //isAppForeground: dành cho các type notify chưa được định nghĩa, nếu khi app đang mở thì sẽ show popup xem chi tiết thông báo
  static processClickNotifyInApp(String notifyType, String notifyDetail, bool isAppForeground, String content) async {
    // switch (notifyType) {
    //   case Constants.NOTIFY_CODE_APP_UPDATE:
    //     if (notifyDetail.isNotEmpty) {
    //       OpenStore.instance.open(
    //         appStoreId: '1132002156', // AppStore id of your app
    //         androidAppBundleId: 'com.medservices.iCNM',
    //       );
    //     }
    //     break;
    //   case Constants.NOTIFY_CODE_NEWS:
    //     if (notifyDetail.isNotEmpty) {
    //       // Get.toNamed(AppRoutes.NewsDetail, arguments: {"itemid": notifyDetail, 'categoryid': ""});
    //     }
    //     break;
    //   case Constants.NOTIFY_CODE_VIDEO_CALL:
    //     /*   try {
    //       ApiGraphQLQueryVideoCall apiController = new ApiGraphQLQueryVideoCall();
    //       ResponseData responseData = await apiController.requestGetDetailHistoryVideocall(notifyDetail);
    //       int status = responseData.status;
    //       String message = responseData.message;
    //
    //       if (status == Constants.RESPONSE_STATUS_SUCCESS) {
    //         if (responseData.data != null) {
    //           ShortVideoCallAppointmentModel itemData = ShortVideoCallAppointmentModel.fromJsonMap(responseData.data);
    //           Get.toNamed(AppRoutes.ResultVideoCall, arguments: {"item": itemData});
    //           if (itemData.id.isNotEmpty) {
    //             AppUtil.showLogFull("### jsonData: " + itemData.toJson().toString());
    //           }
    //         } else {
    //           AppUtil.showLogFull("### responseData.data NULL");
    //         }
    //       }
    //     } catch (e) {}*/
    //     break;
    //   case Constants.NOTIFY_CODE_QUESTION_ANSWER:
    //     // if (notifyDetail.isNotEmpty) {
    //     //   QAArgs argument = new QAArgs(itemid: notifyDetail, arrSpecialist: [], selectedSpecialist: new CommonInfo("", "", ""));
    //     //
    //     //   Get.toNamed(AppRoutes.QADetail, arguments: argument);
    //     // }
    //     break;
    //   case Constants.NOTIFY_CODE_WEB_VIEW:
    //     if (notifyDetail.isNotEmpty) {
    //       if (await canLaunch(notifyDetail)) {
    //         await launch(notifyDetail);
    //       } else {
    //         throw 'Could not launch ${notifyDetail}';
    //       }
    //     }
    //     break;
    //   default:
    //     if (isAppForeground == true && content.isNotEmpty) {
    //       if (content.isNotEmpty) {
    //         DialogUtil.showDialog("Chi tiết", content, "Đồng ý", onOK: () => Get.back());
    //       }
    //     }
    //     break;
    // }
  }

  //isAppForeground: dành cho các type notify chưa được định nghĩa, nếu khi app đang mở thì sẽ show popup xem chi tiết thông báo
  static processClickBanner(String bannerTypeCode, String objectid, String url) async {
    AppUtil.showLog("processClickBanner type $bannerTypeCode, objectId: $objectid, url: $url");
    switch (bannerTypeCode) {
      /*case Constants.BANNER_TYPE_BANNER_NEWS:
        Get.toNamed(AppRoutes.NewsDetail, arguments: {"itemid": objectid, 'categoryid': ""});
        break;
      case Constants.BANNER_TYPE_BANNER_PACKAGE:
        Get.toNamed(AppRoutes.PackageDetail, arguments: {"itemid": objectid, "packageTypeId": "", "provinceId": ""});
        break;
      case Constants.BANNER_TYPE_BANNER_VC:
        var result = await Get.toNamed(
          AppRoutes.ListDoctorVideoCall,
        );
        AppUtil.showLog("Tab HOME HOME ListDoctorVideoCall back result: $result");

        if (result != null && result == Constants.RESULT_GOTO_DETAIL) //Đặt lịch thành công => báo kết quả success về trang trước
        {
          var controller = Get.find<TabHomeHomeController>();
          controller.goToTabIndex(2);
        }
        break;
      case Constants.BANNER_TYPE_BANNER_HOS:
        var result = await Get.toNamed(AppRoutes.ListHospital);
        AppUtil.showLog("Tab HOME HOME back result: $result");
        if (result != null && result == Constants.RESULT_GOTO_DETAIL) //Đặt lịch thành công => báo kết quả success về trang trước
        {
          var controller = Get.find<TabHomeHomeController>();
          controller.goToTabIndex(2);
        }
        break;
      case Constants.BANNER_TYPE_BANNER_XNTN:
        AppointmentArgs args = new AppointmentArgs(BookingAction.CREATE, BookingType.HOME, null);
        var result = await Get.toNamed(AppRoutes.CreateAppointment, arguments: args);
        AppUtil.showLog("Tab HOME HOME back result: $result");
        if (result != null && result == Constants.RESULT_GOTO_DETAIL) //Đặt lịch thành công => báo kết quả success về trang trước
        {
          var controller = Get.find<TabHomeHomeController>();
          controller.goToTabIndex(2);
        }
        break;
      case Constants.BANNER_TYPE_BANNER_LINK:
        if (url.isNotEmpty) {
          if (await canLaunch(url)) {
            await launch(url);
          } else {
            throw 'Could not launch ${url}';
          }
        }
        break;
      default:
        break;*/
    }
  }
}
