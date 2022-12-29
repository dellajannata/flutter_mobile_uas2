import 'package:flutter/material.dart';
import 'package:flutter_mobile_uas2/page/list_data.dart';
import 'package:flutter_mobile_uas2/splashscreen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => SplashScreen(),
    },
  ));
}
