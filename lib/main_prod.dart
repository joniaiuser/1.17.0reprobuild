import 'package:flutter/material.dart';
import 'main.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import './helpers/app_config.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

// This will works always for lock screen Orientation.
void main() {
  HttpOverrides.global = new MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    var configuredApp =
        AppConfig(appTitle: "Prod", buildFlavor: "Production", child: MyApp());
    return runApp(configuredApp);
  });
}

