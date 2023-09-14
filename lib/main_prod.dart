import 'dart:io';


import 'package:flutter/material.dart';

import '/flavors/build_config.dart';
import '/flavors/env_config.dart';
import '/flavors/environment.dart';
import 'api_rest/MyHttpOverrides.dart';
import 'di.dart';
import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //   statusBarColor: AppColors.transparent, // transparent status bar
  // ));

  EnvConfig prodConfig = EnvConfig(
    appName: "My Medlatec",
    baseUrlAuthen: "https://mymedlatecdev.medon.vn/api",
    baseUrlUtility: "https://mymedlatecdev.medon.vn/utility",
    baseGraphQLUrlCore: "https://mymedlatecdev.medon.vn/graphql",
    shouldCollectCrashLog: true,
  );

  // HttpOverrides.global = new MyHttpOverrides();

  BuildConfig.instantiate(
    envType: Environment.PRODUCTION,
    envConfig: prodConfig,
  );

  await DenpendencyInjection.init();
  HttpOverrides.global = new MyHttpOverrides();
  runApp(const MyApp());
}
