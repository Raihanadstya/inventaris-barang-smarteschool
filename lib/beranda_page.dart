// ignore_for_file: avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, deprecated_member_use, prefer_const_constructors, duplicate_ignore, unused_local_variable, unnecessary_brace_in_string_interps, unused_field, unused_element, avoid_init_to_null, prefer_final_fields, non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inventaris_barang_smarteschool/model/barang.dart';
import 'package:inventaris_barang_smarteschool/custom_color.dart';
import 'package:inventaris_barang_smarteschool/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:http/http.dart' as http;

// void setupLanguage() {
//   var enDatesFuture = initializeDateFormatting('id', null);
//   Future.wait([
//     enDatesFuture,
//   ]);
// }

class BerandaPage extends StatefulWidget {
  const BerandaPage({Key? key}) : super(key: key);

  @override
  State<BerandaPage> createState() => _BerandaPageState();
}

class _BerandaPageState extends State<BerandaPage> {
  late SharedPreferences sharedPreferences;
  Barang? _barang;
  String? scanResult;

  // var token;

  // String? token = sharedPreferences.getString("token");

  // Future<void> fetchBarang(int barangId) async {
  //   final response = await http.get(
  //       Uri.parse('https://server-ujian.smarteschool.net/barang/$barangId'),
  //       headers: {
  //         'Content-Type': 'application/json',
  //         'Accept': 'application/json',
  //         'Origin': "https://smk.smarteschool.id/",
  //         'Authorization':
  //             'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOjE0NzI1OCwiaWF0IjoxNjM5Mjc1Nzg4LCJleHAiOjE2MzkyOTczODh9.wUVmHC7gqNFg2Qs9qEYZ3qjoH3Hm8poKTwsRN6raEVw',
  //       });

  //   if (response.statusCode == 200) {
  //     // If the server did return a 200 OK response,
  //     // then parse the JSON.
  //     log(response.body);

  //     setState(() {
  //       _barang = Barang.fromJson(jsonDecode(response.body)['barang']);
  //     });
  //   } else {
  //     // If the server did not return a 200 OK response,
  //     // then throw an exception.
  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(SnackBar(content: Text(response.toString())));
  //   }
  // }

  @override
  void initState() {
    super.initState();
    // checkLoginStatus();
    // futureBarang = fetchBarang();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: birumuda,
      body: Container(
          padding: EdgeInsets.fromLTRB(10.0, 18.0, 10.0, 10.0),
          decoration: BoxDecoration(
              color: birumuda,
              image: DecorationImage(
                  image: AssetImage("assets/images/ilustrasi search.png"),
                  fit: BoxFit.cover)),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    "Inventaris Barang Smarteschool",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontFamily: "NunitoSans",
                        fontWeight: FontWeight.w800),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 80.0, left: 10.0, right: 10.0),
                  child: Text(
                    "Halo, Selamat Datang di Dashboard Invetaris Barang Smarteschool",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: primaryText,
                        fontSize: 17,
                        fontFamily: "NunitoSans",
                        fontWeight: FontWeight.w800),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 170.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [],
                  ),
                ),
              ],
            ),
          )),
    );
  }

  // Future scanBarcode() async {
  //   String scanResult;

  //   try {
  //     scanResult = await FlutterBarcodeScanner.scanBarcode(
  //         "#FF2680EB", "Batal", true, ScanMode.BARCODE);

  //     final barangId = int.tryParse(scanResult);
  //     if (barangId != null) {
  //       fetchBarang(barangId);
  //     }
  //   } on PlatformException {
  //     scanResult = 'Failed to get platform version';
  //   }

  //   if (!mounted) return;

  //   setState(() => this.scanResult = scanResult);
  // }
}
