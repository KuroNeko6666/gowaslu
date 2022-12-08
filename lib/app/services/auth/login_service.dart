import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginService extends GetxController {
  Future<bool> login(String email, String password) async {
    var client = http.Client();
    var uri = Uri.parse('http://139.180.221.53:1323/api/login');
    var response = await client.post(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, String>{
          'username': email,
          'password': password,
        },
      ),
    );

    Map<String, dynamic> res = jsonDecode(response.body);
    if (res["message"] == "Success") {
      var token = res["data"]["token"];
      var data = res["data"]["user"];
      final storage = await SharedPreferences.getInstance();
      await storage.setString('token', token);
      await storage.setString('user', json.encode(data));
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
