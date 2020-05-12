import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';

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
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GlobalKey<NavigatorState> navigatorKey =
      GlobalKey(debugLabel: "Main Navigator");
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        navigatorKey: navigatorKey,
        theme: new ThemeData(
          primaryColorBrightness: Brightness.light,
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          backgroundColor: Color(0xff84DEE6),
          body: CircularProgressIndicator(),
        ));
  }
}
