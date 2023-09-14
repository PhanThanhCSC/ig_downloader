import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '/flavors/build_config.dart';
import '/flavors/env_config.dart';
import '/flavors/environment.dart';
import 'api_rest/MyHttpOverrides.dart';
import 'di.dart';
import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //   statusBarIconBrightness: Brightness.dark,
  //   statusBarColor: AppColors.transparent, // transparent status bar
  // ));

  EnvConfig devConfig = EnvConfig(
    appName: "My Medlatec",
    baseUrlAuthen: "https://mymedlatecdev.medon.vn/api",
    baseUrlUtility: "https://mymedlatecdev.medon.vn/utility",
    baseGraphQLUrlCore: "https://mymedlatecdev.medon.vn/graphql",
    // baseUrlAuthen: "http://58.186.85.107:5010/api",
    // baseUrlUtility: "http://58.186.85.107:5012/api",
    // baseGraphQLUrlCore: "http://58.186.85.107:5011/graphql",
    shouldCollectCrashLog: true,
  );

  BuildConfig.instantiate(
    envType: Environment.DEVELOPMENT,
    envConfig: devConfig,
  );

  // HttpOverrides.global = new MyHttpOverrides();

  await DenpendencyInjection.init();
  HttpOverrides.global = new MyHttpOverrides();

  runApp(
      const MyApp()
  );
}
