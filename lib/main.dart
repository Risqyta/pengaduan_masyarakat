import 'package:flutter/material.dart';
import 'package:pengaduan_masyarakat/input.dart';
import 'package:pengaduan_masyarakat/screen/pengaduan.dart';
import 'screen/login_view.dart';
import 'screen/register_view.dart';
import 'input.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Login Register Page",
    initialRoute: "/",
    routes: {
      "/" : (context) => LoginPage(),
      RegisterPage.routeName : (context) => RegisterPage(),
      Pengaduan.routeName : (context) => Pengaduan(),
    },
  ));
}