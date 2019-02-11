
import 'package:flutter/cupertino.dart';
import 'package:flutter_stetho/flutter_stetho.dart';

import 'package:yuque/core/app_application.dart';
import 'package:yuque/core/app_component.dart';
import 'package:yuque/config/config.dart';
import 'package:yuque/services/token.dart';

Future<void> init(Config config) async {
  if (config.env == EnvType.LOCAL || config.env == EnvType.TEST) {
    Stetho.initialize();
  }

  var application = AppApplication();
  await application.onCreate();
  String token = await Token.getToken();
  String initRoute = "/";

  if (token == null || token.isEmpty) {
    initRoute = "/login";
  }

  runApp(AppComponent(application, initRoute));
}
