import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_mobile_uas2/page/list_data.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => ListMahasiswaPage()));
    });
  }

  @override
  Widget build(BuildContext Context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/img/logo.png',
              height: 200,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Politeknik Negeri Malang',
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: " CabalBold"),
            ),
          ],
        ),
      ),
    );
  }
}
