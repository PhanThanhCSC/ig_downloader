import 'package:base_project_getx/api_rest/flutter_insta.dart';
import 'package:base_project_getx/core/values/app_colors.dart';
import 'package:base_project_getx/screens/download/download_page.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../core/base/base_controller.dart';
import '../../core/model/base_model/reel_model.dart';
import '../../routes/app_pages.dart';

enum IntarDownloadType { dlStory, dlReel, dlPost }

class HomeController extends BaseController {
  HomeController();

  IntarDownloadType currentDownloadType = IntarDownloadType.dlReel;
  TextEditingController textDownloadController = TextEditingController();
  IntarDownloadType currentType = IntarDownloadType.dlReel;
  FlutterInstaAPI dlInstar = FlutterInstaAPI();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: AppColors.transparent,
    ));
  }


  updateUI() {
    update();
  }

  loadingUrl() {
    switch (currentType) {
      case IntarDownloadType.dlReel:
        loadingReelInstargram();
        break;
      case IntarDownloadType.dlPost:
        loadingPostUser();
        break;
      case IntarDownloadType.dlStory:
        loadingStoryAnonymous();
    }
  }

  loadingPostUser() async {
    var post = await dlInstar.getProfileData(textDownloadController.value.text);
    print("=====> url image ${post?.graphql?.user?.profilePicUrlHd}");
    if (post != null) {
      // pushDownloadDetail(post!);
    }
  }

  loadingReelInstargram() async {
    var reel = await dlInstar.downloadReels(textDownloadController.value.text);
    print("=====> url video ${reel?.graphql?.shortcodeMedia?.videoUrl}");
    print("=====> url image ${reel?.graphql?.shortcodeMedia?.displayUrl}");
    if (reel != null) {
      pushDownloadDetail(reel);
    }
  }

  void pushDownloadDetail(ReelModel reel) {
    Get.to(DownloadPage(), routeName: AppPages.DOWNLOAD, arguments: reel);
  }

  loadingStoryAnonymous() {
    dlInstar.downloadStory(textDownloadController.value.text);
  }
}
