import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class RegisterService extends GetxController {
  Future<bool> register(
      String email, String password, String role, String name) async {
    var client = http.Client();
    var uri = Uri.parse('http://139.180.221.53:1323/api/register');
    var response = await client.post(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, String>{
          'name': name,
          'email': email,
          'password': password,
          'role': role,
        },
      ),
    );

    Map<String, dynamic> res = jsonDecode(response.body);
    print(res);
    if (res["message"] == "Success") {
      return true;
    }
    return false;
  }

  checkLogin() async {
    print('runn');
    final storage = await SharedPreferences.getInstance();
    String? token = await storage.getString("token");
    if (token != null) {
      Get.offAllNamed("home");
    }
  }
}
