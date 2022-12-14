import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginService extends GetxController {
  Future<bool> login(String email, String password) async {
    var client = http.Client();
    var uri = Uri.parse(
        'https://dev.pencarian.me/auth/realms/superapp/protocol/openid-connect/token');
    var response = await client.post(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      encoding: Encoding.getByName('utf-8'),
      body: {
        'grant_type': 'password',
        'client_id': 'app_forma',
        'client_secret': 'kAiYhqaKgmDacXD6bgzYZEOD2NWUO94p',
        'username': email,
        'password': password,
      },
    );

    Map<String, dynamic> res = jsonDecode(response.body);
    print(res);
    if (res["access_token"] != null) {
      var token = res["access_token"];
      var ref = res["refresh_token"];
      // var data = res["data"]["user"];
      final storage = await SharedPreferences.getInstance();
      await storage.setString('token', token);
      await storage.setString('refresh_token', ref);
      // await storage.setString('user', json.encode(data));
      return true;
    }
    return false;
  }

  Future<bool> checkLogin() async {
    print('runn');
    final storage = await SharedPreferences.getInstance();
    String? token = await storage.getString("token");
    if (token != null) {
      return true;
    }
    return false;
  }
}
