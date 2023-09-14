import 'package:base_project_getx/screens/home/home_binding.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:overlay_support/overlay_support.dart';
import '/flavors/build_config.dart';
import '/flavors/env_config.dart';
import 'app_binding.dart';
import 'core/values/app_colors.dart';
import 'routes/app_pages.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final EnvConfig _envConfig = BuildConfig.instance.config;

  @override
  void initState() {

    configLoading();
  }

  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
        child: GestureDetector(
      child: GetMaterialApp(
        title: _envConfig.appName,
        initialRoute: AppPages.INITIAL,
        initialBinding: HomeBinding(),
        getPages: AppPages.routes,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: _getSupportedLocal(),
        theme: ThemeData(
          primarySwatch: AppColors.colorPrimarySwatch,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          brightness: Brightness.light,
          primaryColor: AppColors.colorPrimary,
          textTheme: const TextTheme(
            button: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          fontFamily: 'Roboto',
          //checkbox round
          checkboxTheme: CheckboxThemeData(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,
        builder: (context, myWidget) {
          myWidget = MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaleFactor: 1.0,
            ),
            child: myWidget ?? Container(),
          );
          myWidget = EasyLoading.init()(context, myWidget);
          return myWidget;
        },
        /*  builder: (context, child) {
          EasyLoading.init();
          //ignore system scale factor
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaleFactor: 1.0,
            ),
            child: child ?? Container(),
          );
        },*/
        routingCallback: (value) {
          // Here you can check which screen your app is currently on
          SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
            statusBarColor: AppColors.transparent,
            statusBarIconBrightness: Brightness.dark,
          ));
          // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: AppColors.transparent, statusBarBrightness: Brightness.dark));
        },
      ),
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
        // FocusScopeNode currentFocus = FocusScope.of(context);
        // if (!currentFocus.hasPrimaryFocus) {
        //   currentFocus.unfocus();
        // }
      },
    ));
  }

  List<Locale> _getSupportedLocal() {
    return [
      const Locale('vi', ''), // Vietnam, no country code
      const Locale('en', ''),
      const Locale('bn', ''),
    ];
  }

  void configLoading() {
    EasyLoading.instance
      ..indicatorType = EasyLoadingIndicatorType.ring
      ..loadingStyle = EasyLoadingStyle.light
      ..radius = 10.0
      ..backgroundColor = AppColors.textSub
      ..indicatorColor = AppColors.colorPrimary
      ..textColor = AppColors.colorPrimary
      ..userInteractions = true
      ..dismissOnTap = true
      ..maskType = EasyLoadingMaskType.none
      ..animationStyle = EasyLoadingAnimationStyle.scale;
  }
}
