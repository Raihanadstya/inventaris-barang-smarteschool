// ignore_for_file: avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_init_to_null, unnecessary_new, unused_import, unused_field, avoid_print, avoid_web_libraries_in_flutter

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:inventaris_barang_smarteschool/beranda_page.dart';
import 'package:inventaris_barang_smarteschool/home.dart';
import 'custom_color.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/tap_bounce_container.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoading = false;
  bool _isObscure = true;
  final _baseUrl = 'https://server-ujian.smarteschool.net/login';
  // final _baseUrl = 'http://192.168.146.241:8080/login';

  signIn(String whatsapp, password) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map data = {
      'whatsapp': whatsapp,
      'password': password,
    };
    var jsonResponse = null;
    var response = await http.post(Uri.parse(_baseUrl), body: data, headers: {
      // 'Content-Type': 'application/json',
      // 'Accept': 'application/json',
      'Origin': "https://smkn26jkt.smarteschool.id",
    });
    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);

      if (jsonResponse != null) {
        setState(() {
          _isLoading = false;
        });

        sharedPreferences.setString("token", jsonResponse['token']);

        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => Home()),
            (Route<dynamic> route) => false);

        final _message = jsonDecode(response.body)['message'];

        showTopSnackBar(
          context,
          CustomSnackBar.success(
            message: _message,
          ),
        );
      }
    } else {
      setState(() {
        _isLoading = false;
      });

      final _message = jsonDecode(response.body)['message'];

      showTopSnackBar(
        context,
        CustomSnackBar.error(
          message: _message,
        ),
      );
    }
  }

  final TextEditingController nowhatsappController =
      new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(0.0),
        color: birumuda,
        child: _isLoading
            ? Center(child: CircularProgressIndicator())
            : SafeArea(
                child: Container(
                  // color: primaryText,
                  padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Image(
                          image: AssetImage(
                              "assets/images/Logo Smarteschool new.png"),
                          width: MediaQuery.of(context).size.width * 0.75,
                          filterQuality: FilterQuality.none,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Text(
                          "Masuk terlebih dahulu untuk melanjutkan",
                          style: TextStyle(
                              color: primaryText,
                              fontSize: 15,
                              fontFamily: "NunitoSans",
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 5),
                        child: TextFormField(
                          controller: nowhatsappController,
                          decoration: InputDecoration(
                              fillColor: Colors.blue[50],
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              prefixIcon: Icon(Icons.account_circle_rounded),
                              labelText: "No WhatsApp"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 5),
                        child: TextFormField(
                          controller: passwordController,
                          obscureText: _isObscure,
                          decoration: InputDecoration(
                            fillColor: Colors.blue[50],
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            prefixIcon: Icon(Icons.lock_rounded),
                            labelText: "Password",
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isObscure
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: primaryColor,
                                onPrimary: Colors.white,
                                shadowColor: secondaryText,
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                minimumSize: Size(500, 50)),
                            onPressed:

                                // nowhatsappController.text == "" ||
                                //         passwordController.text == ""
                                //     ? null :
                                () {
                              setState(() {
                                _isLoading = true;
                              });
                              signIn(nowhatsappController.text,
                                  passwordController.text);

                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => const Home()),
                              // );
                            },
                            // () {},
                            child: Text(
                              "Masuk",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: "NunitoSans",
                                  fontWeight: FontWeight.w800),
                            )),
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
