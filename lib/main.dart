// ignore_for_file: prefer_const_constructors, unused_import, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:inventaris_barang_smarteschool/beranda_page.dart';
import 'package:inventaris_barang_smarteschool/custom_color.dart';
import 'package:inventaris_barang_smarteschool/login_page.dart';
import 'package:inventaris_barang_smarteschool/splash_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          // primaryColor: primaryColor,
          primaryColorBrightness: Brightness.light,
          fontFamily: 'NunitoSans',
          scrollbarTheme: ScrollbarThemeData(
              isAlwaysShown: true,
              thickness: MaterialStateProperty.all(5),
              thumbColor: MaterialStateProperty.all(secondaryText),
              radius: const Radius.circular(10),
              minThumbLength: 100)),
      home: SplashPage(),
    );
  }
}
