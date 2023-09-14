import 'package:base_project_getx/screens/tab/tab_bin%C4%91ing.dart';
import 'package:base_project_getx/screens/tab/tab_page.dart';
import 'package:get/get.dart';

import '../screens/detail/detail_binding.dart';
import '../screens/detail/detail_page.dart';
import '../screens/download/download_binding.dart';
import '../screens/download/download_page.dart';
import '../screens/home/home_binding.dart';
import '../screens/home/home_page.dart';
import '../screens/intro/intro_binding.dart';
import '../screens/intro/intro_page.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = AppRoutes.HOME;
  static const INTRO = AppRoutes.INTRO;
  static const TAB = AppRoutes.TAB;
  static const DOWNLOAD = AppRoutes.DOWNLOAD;

  // static const INITIAL = AppRoutes.INTRODUCE;

  // static const INITIAL = AppRoutes.SYNC_PROFILE;

  // static const INITIAL = AppRoutes.LOGIN;
  // static const INITIAL = AppRoutes.HOME;

  static final routes = [
    GetPage(
      name: AppRoutes.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.DETAIL,
      page: () => DetailPage(),
      binding: DetailBinding(),
    ),
    GetPage(
      name: INTRO,
      page: () => IntroPage(),
      binding: IntroBinding(),
    ),
    GetPage(
      name: TAB,
      page: () => TabPage(),
      binding: TabBinding(),
    ),
    GetPage(
      name: DOWNLOAD,
      page: () => DownloadPage(),
      binding: DownloadBinding(),
    ),
  ];
}
