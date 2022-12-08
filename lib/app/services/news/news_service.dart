import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class NewsService extends GetxController {
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
          'email': email,
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

  Future<List<dynamic>> getAll() async {
    var client = http.Client();
    var uri = Uri.parse('http://139.180.221.53:1323/api/news');
    var response = await client.get(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    Map<String, dynamic> res = jsonDecode(response.body);
    if (res["message"] == "Success") {
      return res["data"];
    }
    return [{}];
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
