// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, deprecated_member_use, prefer_final_fields, unused_local_variable, sized_box_for_whitespace, unnecessary_string_interpolations, unnecessary_new

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:inventaris_barang_smarteschool/custom_color.dart';
import 'package:inventaris_barang_smarteschool/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:inventaris_barang_smarteschool/login_page.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

// import 'package:intl/date_symbol_data_local.dart';
class AkunPage extends StatefulWidget {
  const AkunPage({Key? key}) : super(key: key);

  @override
  State<AkunPage> createState() => _AkunPageState();
}

class _AkunPageState extends State<AkunPage> with TickerProviderStateMixin {
  late SharedPreferences sharedPreferences;
  String? _token;

  User? _user;

  _getToken() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    _token = sharedPreferences.getString("token");
    checkLoginStatus();
    fetchUser();
  }

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString("token") == null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (BuildContext context) => const LoginPage()),
          (Route<dynamic> route) => false);
    }
  }

  Future<void> fetchUser() async {
    final response = await http.get(
        Uri.parse('https://juli-desember.smarteschool.net/profil'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Origin': 'https://smk.smarteschool.id',
          'Authorization': 'Bearer $_token',
        });

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      setState(() {
        _user = User.fromJson(jsonDecode(response.body)['user']);
      });
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(response.toString())));
    }
  }

  @override
  void initState() {
    super.initState();
    _getToken();
    checkLoginStatus();
  }

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);

    return Scaffold(
      body: Container(
        color: birumuda,
        padding: EdgeInsets.fromLTRB(10.0, 18.0, 10.0, 10.0),
        child: SafeArea(
            child: Column(
          children: [
            Container(
                child: Column(
              children: [
                Center(
                  child: Text(
                    "Akun",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontFamily: "NunitoSans",
                        fontWeight: FontWeight.w800),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: Offset(0, 2), // c
                        blurStyle: BlurStyle.normal,
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image(
                        image: AssetImage('assets/images/user.png'),
                        width: 70,
                        height: 70,
                      ),
                    ),
                  ),
                ),
              ],
            )),
            SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width * 0.50,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: Offset(0, 2), // c
                    blurStyle: BlurStyle.normal,
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              child: TabBar(
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                indicatorColor: Colors.transparent,
                controller: _tabController,
                tabs: [
                  Tab(
                    icon: Icon(
                      Icons.person_search_outlined,
                      // color: Colors.black,
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.school_outlined,
                      // color: Colors.black,
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.person_outline_outlined,
                      // color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
                padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                // height: 300,
                height: MediaQuery.of(context).size.height * 0.40,
                child: TabBarView(
                  controller: _tabController,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 15.0),
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset: Offset(0, 2), // c
                              blurStyle: BlurStyle.normal,
                            ),
                          ],
                          color: Colors.white,
                          // border: Border.all(),
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Column(
                        children: [
                          Text(
                            "Informasi Data Diri",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w800),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Nama Lengkap "),
                                    if (_user != null)
                                      Text(_user!.nama,
                                          style: TextStyle(
                                            fontFamily: "NunitoSans",
                                            fontSize: 15,
                                          )),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Tempat Lahir ",
                                        style: TextStyle(
                                          fontFamily: "NunitoSans",
                                          fontSize: 15,
                                        )),
                                    if (_user != null)
                                      Text(_user!.tempatLahir ?? "-",
                                          style: TextStyle(
                                            fontFamily: "NunitoSans",
                                            fontSize: 15,
                                          )),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Tanggal lahir "),
                                    Text(_user?.tanggalLahir == null
                                        ? '-'
                                        : new DateFormat("d MMMM yyyy")
                                            .format(_user!.tanggalLahir!))
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Jabatan ",
                                        style: TextStyle(
                                          fontFamily: "NunitoSans",
                                          fontSize: 15,
                                        )),
                                    if (_user != null)
                                      Text(_user!.role,
                                          style: TextStyle(
                                            fontFamily: "NunitoSans",
                                            fontSize: 15,
                                          )),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Jenis Kelamin ",
                                        style: TextStyle(
                                          fontFamily: "NunitoSans",
                                          fontSize: 15,
                                        )),
                                    if (_user != null)
                                      Text(_user!.genderText,
                                          style: TextStyle(
                                            fontFamily: "NunitoSans",
                                            fontSize: 15,
                                          )),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Agama ",
                                        style: TextStyle(
                                          fontFamily: "NunitoSans",
                                          fontSize: 15,
                                        )),
                                    if (_user != null)
                                      Text(_user!.agama ?? "-",
                                          style: TextStyle(
                                            fontFamily: "NunitoSans",
                                            fontSize: 15,
                                          )),
                                  ],
                                ),
                                SizedBox(height: 20),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 15.0),
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset: Offset(0, 2), // c
                              blurStyle: BlurStyle.normal,
                            ),
                          ],
                          color: Colors.white,
                          // border: Border.all(),
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Column(
                        children: [
                          Text(
                            "Informasi Sekolah",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w800),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Asal Sekolah "),
                                    if (_user != null)
                                      Text(_user!.sekolah,
                                          style: TextStyle(
                                            fontFamily: "NunitoSans",
                                            fontSize: 15,
                                          )),
                                  ],
                                ),
                                SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Tingkat",
                                        style: TextStyle(
                                          fontFamily: "NunitoSans",
                                          fontSize: 15,
                                        )),
                                    if (_user != null)
                                      Text(_user!.tingkat,
                                          style: TextStyle(
                                            fontFamily: "NunitoSans",
                                            fontSize: 15,
                                          )),
                                  ],
                                ),
                                SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Link Smarteschool",
                                        style: TextStyle(
                                          fontFamily: "NunitoSans",
                                          fontSize: 15,
                                        )),
                                    if (_user != null)
                                      ElevatedButton(
                                        style: ButtonStyle(
                                          shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  side: BorderSide(
                                                      color: Colors.white))),
                                        ),
                                        onPressed: () {
                                          launch(
                                              '${_user!.domain.split(";")[0]}/smartschool/login');
                                        },
                                        child: Text(
                                          "Menuju Sekolah",
                                          style: TextStyle(fontSize: 13),
                                        ),
                                      )
                                  ],
                                ),
                                SizedBox(height: 20),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 15.0),
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset: Offset(0, 2), // c
                              blurStyle: BlurStyle.normal,
                            ),
                          ],
                          color: Colors.white,
                          // border: Border.all(),
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Column(
                        children: [
                          Text(
                            "Informasi Akun",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w800),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 5.0),
                            child: Column(
                              children: [
                                SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("WhatsApp",
                                        style: TextStyle(
                                          fontFamily: "NunitoSans",
                                          fontSize: 15,
                                        )),
                                    if (_user != null)
                                      Text(_user!.whatsapp,
                                          style: TextStyle(
                                            fontFamily: "NunitoSans",
                                            fontSize: 15,
                                          )),
                                  ],
                                ),
                                SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Email",
                                        style: TextStyle(
                                          fontFamily: "NunitoSans",
                                          fontSize: 15,
                                        )),
                                    if (_user != null)
                                      Text('${_user!.email ?? "-"}',
                                          style: TextStyle(
                                            fontFamily: "NunitoSans",
                                            fontSize: 15,
                                          )),
                                  ],
                                ),
                                SizedBox(height: 20),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Text("halo"),
                    // Text("ini"),
                    // Text("orang"),
                  ],
                )),
            Container(
              margin: EdgeInsets.all(10),
              child: SizedBox(
                width: 365,
                height: 40,
                child: ElevatedButton.icon(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(color: Colors.black))),
                    ),
                    onPressed: () {
                      sharedPreferences
                        ..clear()
                        ..commit();

                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (BuildContext context) => LoginPage()),
                          (Route<dynamic> route) => false);
                    },
                    icon: Icon(
                      Icons.logout_outlined,
                      color: Colors.black,
                    ),
                    label: Text(
                      "Keluar",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w800),
                    )),
              ),
            )
          ],
        )),
      ),
    );
  }
}
