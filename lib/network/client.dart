

import 'package:dio/dio.dart';
import 'package:pengaduan_masyarakat/network/request.dart';
import 'package:pengaduan_masyarakat/network/response.dart';

const baseUrl = "http://10.0.2.2:8000/api";

class PengaduanMasyarakatApiClient {
  Future<BaseResponse<LoginData>> login(LoginRequest request) async{
    try {
      FormData formData = FormData.fromMap({
        "username" : request.username,
        "password" : request.password,
      });
      Response<Map> response = await Dio().post("$baseUrl/login", data: formData);
      print(response);
      BaseResponse<LoginData> loginResponse = BaseResponse(
          success: response.data["success"],
          message: response.data["message"],
          data: LoginData(
            token: response.data["data"]["token"]
          )
      );
      return loginResponse;
    } catch (e) {
      print(e);
    }
  }
  Future<BaseResponse<RegisterData>>register(RegisterRequest request) async{
    try {
      FormData formData = FormData.fromMap({
        "nik"      : request.nik,
        "nama"     : request.nama,
        "username" : request.username,
        "password" : request.password,
        "telp"     : request.telp,
      });
      Response<Map> response = await Dio().post("$baseUrl/register", data: formData);
      print(response);
      BaseResponse<RegisterData> registerResponse = BaseResponse(
          success: response.data["success"],
          message: response.data["message"],
          data: RegisterData()
      );
      return registerResponse;
    } catch (e) {
      print(e);
    }
  }
  void getHttp() async {
    try {
      Response response = await Dio().get("http://www.google.com");
      print(response);
    } catch (e) {
      print(e);
    }
  }
}