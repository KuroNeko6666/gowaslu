import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gowaslu/app/services/auth/login_service.dart';
import 'package:gowaslu/app/services/auth/logout_service.dart';
import 'package:gowaslu/app/services/auth/register_service.dart';
import 'package:gowaslu/app/services/news/news_service.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  final loginFormKey = GlobalKey<FormState>();
  final registerFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();

  var index = 0.obs;
  var isLoggedIn = false.obs;
  RxMap<dynamic, dynamic> user = {}.obs;
  late List<dynamic> news;
  late RxList<Widget> widget_news = <Widget>[].obs;

  var isLogin = true.obs;

  @override
  void onInit() async {
    isLoggedIn.value = await LoginService().checkLogin();
    if (isLoggedIn.value) {
      final storage = await SharedPreferences.getInstance();
      // var value = json.decode(storage.getString("user")!);
      // user.value = value;
    }
    print(isLoggedIn);
    emailController.text = '';
    passwordController.text = '';
    news = await NewsService().getAll();
    for (var data in news) {
      widget_news.add(
        CardNews(
          thumbnail: data["thumbnail"],
          title: data["title"],
          subtitle: data["CreatedAt"],
        ),
      );
    }
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  // LOGIN
  String? validator(String value) {
    if (value.isEmpty) {
      return 'Please this field must be filled';
    }
    return null;
  }

  void login() async {
    if (loginFormKey.currentState!.validate()) {
      print("running");
      var res = await LoginService()
          .login(emailController.text, passwordController.text);

      print(res);
      if (res == true) {
        final storage = await SharedPreferences.getInstance();
        // var value = json.decode(storage.getString("user")!);
        // user.value = value;
        emailController.clear();
        passwordController.clear();
        isLoggedIn.value = res;
        index.value = 0;
        Get.snackbar("success", "login has been successful",
            backgroundColor: Colors.green);
      } else {
        Get.snackbar("fail", "login failed", backgroundColor: Colors.redAccent);
      }
    }
  }

  void register() async {
    if (registerFormKey.currentState!.validate()) {
      var res = await RegisterService().register(emailController.text,
          passwordController.text, "user", nameController.text);
      if (res == true) {
        emailController.clear();
        passwordController.clear();
        nameController.clear();
        isLogin.value = true;
        Get.snackbar("success", "account has been created successfully",
            backgroundColor: Colors.green);
      } else {
        Get.snackbar("fail", "account failed to create",
            backgroundColor: Colors.redAccent);
      }
    }
  }

  void logout() async {
    final res = await LogoutService().logout();
    if (res) {
      isLoggedIn.value = false;
      user.value = {};
      final storage = await SharedPreferences.getInstance();
      await storage.clear();
      index.value = 0;
      isLogin.value = true;
      Get.snackbar("success", "logged out successfully",
          backgroundColor: Colors.green);
    }
  }
}

class CardNews extends StatelessWidget {
  const CardNews({
    Key? key,
    required this.thumbnail,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  final String thumbnail, title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: Get.width * 0.05),
      child: Container(
        height: Get.height * 0.2,
        width: Get.width * 0.9,
        decoration: BoxDecoration(
          color: Colors.grey,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 1),
              blurRadius: 10,
              color: Colors.grey.shade400,
            )
          ],
          borderRadius: BorderRadius.circular(
            Get.width * 0.05,
          ),
        ),
        child: Stack(
          // children: [Image.network(thumbnail)],
          children: [
            Container(
              height: Get.height,
              width: Get.width,
              alignment: Alignment.bottomLeft,
              child: ListTile(
                title: Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: Get.width * 0.055,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  DateFormat.yMMMEd().format(DateTime.parse(subtitle)),
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
