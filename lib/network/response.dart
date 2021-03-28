

class User{
  int id;
  int nik;
  String nama;
  String telp;
  String username;
  String level;

  User({this.id, this.username,this.level, this.nama, this.nik, this.telp});
}

class BaseResponse<E>{
  bool success;
  String message;
  E data;

  BaseResponse({this.success, this.message, this.data});
}

class LoginData{
  String token;
  User user;

  LoginData({this.token, this.user});
}

class RegisterData{
  String token;
  User user;

  RegisterData({this.token, this.user});
}
