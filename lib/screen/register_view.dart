import 'package:flutter/material.dart';
import 'package:pengaduan_masyarakat/network/client.dart';
import 'package:pengaduan_masyarakat/network/request.dart';
import 'package:pengaduan_masyarakat/screen/pengaduan.dart';
import '../constants.dart';

class RegisterPage extends StatefulWidget {
  static const routeName = "/RegisterPage";
  @override
  _RegisterPageState createState() => _RegisterPageState();
}
class _RegisterPageState extends State<RegisterPage> {
  PengaduanMasyarakatApiClient client = PengaduanMasyarakatApiClient();
  @override

  void register() async{

    var response = await client.register(RegisterRequest(
        nik: 35712345678,
        nama: "Ardian",
        username: "Ardian12",
        password: "123456",
        telp: "101010101010"));
    if (response.success){
      Navigator.pushNamed(this.context, Pengaduan.routeName);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey.shade100,
        padding: EdgeInsets.all(50.0),
        child: ListView(
          children: <Widget>[
            _iconRegistrasi(),
            _titleDescription(),
            _textField(),
            _buildButton(context),
          ],
        ),
      ),
    );
  }
  Widget _iconRegistrasi() {
    return Image.asset(
      "assets/images/logo.png",
      width: 150.0,
      height: 150.0,
    );
  }
  Widget _titleDescription() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 16.0),
        ),
        Text(
          "Registrasi",
          style: TextStyle(
            fontFamily: 'Comfortaa',
            fontSize: 40,
            color: Colors.black54,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
  Widget _textField() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 12.0),
        ),
        TextFormField(
          decoration: const InputDecoration(
            border: UnderlineInputBorder(),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: ColorPalette.underlineTextField,
                width: 1.5,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.blueGrey,
                width: 3.0,
              ),
            ),
            hintText: "NIK",
            hintStyle: TextStyle(color: ColorPalette.primaryDarkColor),
          ),
          style: TextStyle(color: Colors.blueGrey),
          autofocus: false,
        ),
        Padding(
          padding: EdgeInsets.only(top: 12.0),
        ),
        TextFormField(
          decoration: const InputDecoration(
            border: UnderlineInputBorder(),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: ColorPalette.underlineTextField,
                width: 3.0,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.blueGrey,
                width: 3.0,
              ),
            ),
            hintText: "Nama Lengkap",
            hintStyle: TextStyle(color: ColorPalette.primaryDarkColor),
          ),
          style: TextStyle(color: Colors.blueGrey),
          obscureText: true,
          autofocus: false,
        ),
        TextFormField(
          decoration: const InputDecoration(
            border: UnderlineInputBorder(),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: ColorPalette.underlineTextField,
                width: 3.0,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.blueGrey,
                width: 3.0,
              ),
            ),
            hintText: "Nama Pengguna",
            hintStyle: TextStyle(color: ColorPalette.primaryDarkColor),
          ),
          style: TextStyle(color: Colors.blueGrey),
          obscureText: true,
          autofocus: false,
        ),
        TextFormField(
          decoration: const InputDecoration(
            border: UnderlineInputBorder(),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: ColorPalette.underlineTextField,
                width: 3.0,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.blueGrey,
                width: 3.0,
              ),
            ),
            hintText: "Password",
            hintStyle: TextStyle(color: ColorPalette.primaryDarkColor),
          ),
          style: TextStyle(color: Colors.blueGrey),
          obscureText: true,
          autofocus: false,
        ),
        TextFormField(
          decoration: const InputDecoration(
            border: UnderlineInputBorder(),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: ColorPalette.underlineTextField,
                width: 3.0,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.blueGrey,
                width: 3.0,
              ),
            ),
            hintText: "Nomor Telp",
            hintStyle: TextStyle(color: ColorPalette.primaryDarkColor),
          ),
          style: TextStyle(color: Colors.blueGrey),
          obscureText: true,
          autofocus: false,
        ),
      ],
    );
  }
  Widget _buildButton(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 16.0),
        ),
        InkWell(
          onTap: ()=>register(),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            width: double.infinity,
            child: Text(
              'Registrasi',
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 16.0),
        ),
        Text(
          'or',
          style: TextStyle(
            color: Colors.blueGrey,
            fontSize: 12.0,
          ),
        ),
        MaterialButton(
          child: Text(
            'Login',
            style: TextStyle(color: Colors.blueGrey),
          ),
          onPressed: () {
            Navigator.pushNamed(context, "/");
          },
        )
      ],
    );
  }
}
