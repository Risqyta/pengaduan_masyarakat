
import 'package:flutter/material.dart';

class LoginRequest {
  String username;
  String password;

  LoginRequest({@required this.username, @required this.password});
}

class RegisterRequest {
  int nik;
  String nama;
  String telp;
  String username;
  String password;

  RegisterRequest({@required this.nik, this.telp, this.nama, this.username,
    this.password});
}