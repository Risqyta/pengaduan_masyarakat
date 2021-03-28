import 'package:flutter/material.dart';
import 'package:pengaduan_masyarakat/network/client.dart';
import 'package:pengaduan_masyarakat/network/request.dart';
import 'package:pengaduan_masyarakat/input.dart';
import 'package:pengaduan_masyarakat/screen/pengaduan.dart';
import '../constants.dart';
import 'register_view.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  PengaduanMasyarakatApiClient client = PengaduanMasyarakatApiClient();

  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtPassword = TextEditingController();



  void login() async{
    var response = await client.login(LoginRequest(username: txtUsername.text, password:
    txtPassword.text));
    if (response.success){
      Navigator.pushNamed(this.context, Pengaduan.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey.shade100,
        padding: EdgeInsets.all(50.0),
        child: ListView(
          children: <Widget>[
            Center(
              child: Column(
                children: <Widget>[
                  _iconLogin(),
                  _titleDescription(),
                  _textField(),
                  _buildButton(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _iconLogin() {
    return Image.asset(
      "assets/images/logo.png",
      height: 150.0,
      width: 150.0,
    );
  }
  Widget _titleDescription() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 16.0),
        ),
        Text(
          "Login",
          style: TextStyle(
            fontFamily: 'Comfortaa',
            fontSize: 40,
            color: Colors.black54,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 12.0),
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
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
          controller: txtUsername,
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
            hintText: "Nama Pengguna",
            hintStyle: TextStyle(color: ColorPalette.primaryDarkColor),
          ),
          style: TextStyle(color: Colors.blueGrey),
          autofocus: false,

        ),
        Padding(
          padding: EdgeInsets.only(top: 12.0),
        ),
        TextFormField(
          controller: txtPassword,
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
            hintText: "Password",
            hintStyle: TextStyle(color: ColorPalette.primaryDarkColor),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
          style: TextStyle(color: Colors.blueGrey),
          obscureText: true,
          autofocus: false,
        ),
      ],
    );
  }
  Widget _buildButton(BuildContext) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 16.0),
        ),
        InkWell(
          onTap: ()=>login(),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            width: double.infinity,
            child: Text(
              'Login',
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
            'Register',
            style: TextStyle(color: Colors.blueGrey),
          ),
          onPressed: () {
            Navigator.pushNamed(BuildContext, RegisterPage.routeName);
          },
        ),
      ],
    );
  }
}
