// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:inventaris_barang_smarteschool/login_page.dart';
import 'custom_color.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void _navigate(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () async {
      final sharedPreferences = await SharedPreferences.getInstance();
      final _token = sharedPreferences.getString("token");

      if (_token != null) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => Home()),
            (Route<dynamic> route) => false);
      } else {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => LoginPage()),
            (Route<dynamic> route) => false);
      }
    });
  }

  @override
  void initState() {
    _navigate(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(0.0),
        color: primaryColor,
        child: Container(
          margin: EdgeInsets.all(20.0),
          // color: secondaryText,
          child: Center(
            child: Image(
              image: AssetImage("assets/images/icon v2.png"),
              height: 170,
              width: 170,
            ),
          ),
        ),
      ),
    );
  }
}
