import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LogoutService extends GetxController {
  Future<bool> logout() async {
    final storage = await SharedPreferences.getInstance();
    final refresh = await storage.getString("refresh_token");
    var client = http.Client();
    var uri = Uri.parse(
        'https://dev.pencarian.me/auth/realms/superapp/protocol/openid-connect/logout');
    var response = await client.post(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      encoding: Encoding.getByName('utf-8'),
      body: {
        'grant_type': 'logout',
        'client_id': 'app_forma',
        'client_secret': 'kAiYhqaKgmDacXD6bgzYZEOD2NWUO94p',
        'refresh_token': refresh,
      },
    );

    if (response.body.isEmpty) {
      print("ok");
      return true;
    }
    return false;

    // if (response.body != null) {
    //   Map<String, dynamic> res = jsonDecode(response.body);
    //   print(res);
    //   if (res["erro"] == null) {
    //     return true;
    //   }
    //   return false;
    // }
    // return false;
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
