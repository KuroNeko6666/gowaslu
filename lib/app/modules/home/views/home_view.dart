import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Obx(() => IndexedStack(
            index: controller.index.value,
            children: [
              //HOME PAGE
              Container(
                height: Get.height,
                width: Get.width,
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Obx(
                          () => Container(
                            width: Get.width,
                            height: Get.height * 0.25,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(Get.width * 0.08),
                                bottomRight: Radius.circular(Get.width * 0.08),
                              ),
                            ),
                            child: controller.isLoggedIn.value
                                ? ListTile(
                                    textColor: Colors.white,
                                    iconColor: Colors.white,
                                    title: Text("Hello, Account Name"),
                                    subtitle:
                                        Text(controller.user.value["email"]),
                                    leading: CircleAvatar(
                                      backgroundColor: Colors.grey,
                                      radius: Get.width * 0.1,
                                    ),
                                    trailing: CircleAvatar(
                                      backgroundColor: Colors.black,
                                      child: IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.notifications,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ))
                                : SizedBox(
                                    height: Get.height * 0.05,
                                    width: Get.width * 0.5,
                                    child: ElevatedButton(
                                      onPressed: () => {
                                        controller.index.value = 1,
                                      },
                                      child: Text("SIGN IN"),
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.black,
                                        onPrimary: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(32.0),
                                        ),
                                      ),
                                    ),
                                  ),
                          ),
                        ),
                        Container(
                          width: Get.width,
                          height: Get.height * 0.75,
                          padding:
                              EdgeInsets.symmetric(vertical: Get.width * 0.1),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Container(
                                  height: Get.height * 0.3,
                                  width: Get.width,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        CardNotif(),
                                        CardNotif(),
                                        CardNotif(),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  height: Get.height * 0.4,
                                  width: Get.width,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: Get.width * 0.05),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          MenuHome(
                                            assets: "assets/icons/icon1.png",
                                            title: "FORM",
                                            subtitle: "Formulir Pencegahan",
                                          ),
                                          MenuHome(
                                            assets: "assets/icons/icon2.png",
                                            title: "SIGAP LAPOR",
                                            subtitle: "Formulir Pencegahan",
                                          ),
                                          MenuHome(
                                            assets: "assets/icons/icon3.png",
                                            title: "FORM",
                                            subtitle: "Formulir Pencegahan",
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          MenuHome(
                                            assets: "assets/icons/icon4.png",
                                            title: "FORM",
                                            subtitle: "Formulir Pencegahan",
                                          ),
                                          MenuHome(
                                            assets: "assets/icons/icon5.png",
                                            title: "FORM",
                                            subtitle: "Formulir Pencegahan",
                                          ),
                                          MenuHome(
                                            assets: "assets/icons/icon6.png",
                                            title: "FORM",
                                            subtitle: "Formulir Pencegahan",
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: Get.width * 0.05,
                                      vertical: Get.width * 0.02),
                                  child: Text(
                                    "News",
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                      fontSize: Get.width * 0.05,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: Get.height * 0.23,
                                  width: Get.width,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child:
                                        Row(children: controller.widget_news),
                                  ),
                                ),
                                SizedBox(
                                  height: Get.height * 0.1,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      top: Get.height * 0.2,
                      left: Get.width * 0.05,
                      child: Container(
                        height: Get.height * 0.08,
                        width: Get.width * 0.9,
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(Get.width * 0.05),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(Get.width),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(-5, 5),
                              blurRadius: 10,
                              color: Colors.black54,
                            ),
                          ],
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Search',
                            border: InputBorder.none,
                            suffix: CircleAvatar(
                              child: Icon(Icons.search),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              //PROFILE PAGE
              Container(
                height: Get.height,
                width: Get.width,
                child: Stack(
                  children: [
                    Container(
                      height: Get.height * 0.4,
                      width: Get.width,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(Get.width * 0.1),
                          bottomRight: Radius.circular(Get.width * 0.1),
                        ),
                      ),
                    ),
                    Container(
                      height: Get.height,
                      width: Get.width,
                      padding:
                          EdgeInsets.symmetric(horizontal: Get.width * 0.05),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Obx(
                              () => Container(
                                height: Get.height * 0.1,
                                margin: EdgeInsets.only(top: Get.height * 0.05),
                                alignment: Alignment.center,
                                child: Text(
                                  controller.isLoggedIn.value
                                      ? "Profile"
                                      : controller.isLogin.value
                                          ? "Sign in"
                                          : "Sign up",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: Get.width * 0.05,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            Obx(
                              () => Container(
                                width: Get.width * 0.9,
                                padding: EdgeInsets.all(Get.width * 0.05),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.circular(Get.width * 0.05),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      offset: Offset(0, 1),
                                      blurRadius: 15,
                                    ),
                                  ],
                                ),
                                child: controller.isLoggedIn.value
                                    ? Column(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                              bottom: Get.width * 0.05,
                                            ),
                                            child: Text(
                                              "Account Name",
                                              style: TextStyle(
                                                fontSize: Get.width * 0.06,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          CircleAvatar(
                                            backgroundColor: Colors.grey,
                                            radius: Get.width * 0.2,
                                          ),
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                              vertical: Get.width * 0.05,
                                            ),
                                            child: Text(
                                              controller.user.value["email"],
                                              style: TextStyle(
                                                fontSize: Get.width * 0.05,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: Get.height * 0.05,
                                            width: Get.width * 0.5,
                                            child: ElevatedButton(
                                              onPressed: () =>
                                                  controller.logout(),
                                              child: Text("Logout"),
                                              style: ElevatedButton.styleFrom(
                                                primary: Colors.red,
                                                onPrimary: Colors.white,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          32.0),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: Get.width * 0.05,
                                          )
                                        ],
                                      )
                                    : controller.isLogin.value
                                        ? Form(
                                            key: controller.loginFormKey,
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                            child: Column(
                                              children: [
                                                Container(
                                                  height: Get.height * 0.15,
                                                  width: Get.width * 0.9,
                                                  alignment: Alignment.center,
                                                  child: ListTile(
                                                    title: Text(
                                                      "SIGN IN",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize:
                                                            Get.width * 0.08,
                                                      ),
                                                    ),
                                                    subtitle: Text(
                                                      "Cukup satu akun kamu akan mendapatkan kemudahan mengakses Perpustakaan nasional dalam genggaman, dimanapun, kapanpun",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        fontSize:
                                                            Get.width * 0.035,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                    bottom: Get.width * 0.05,
                                                  ),
                                                  padding: EdgeInsets.symmetric(
                                                    vertical: Get.width * 0.01,
                                                    horizontal:
                                                        Get.width * 0.05,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey.shade200,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      Get.width * 0.05,
                                                    ),
                                                  ),
                                                  child: TextFormField(
                                                    controller: controller
                                                        .emailController,
                                                    validator: (val) =>
                                                        controller
                                                            .validator(val!),
                                                    decoration: InputDecoration(
                                                      labelText: "Email",
                                                      border: InputBorder.none,
                                                      suffixIcon:
                                                          Icon(Icons.email),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                    bottom: Get.width * 0.05,
                                                  ),
                                                  padding: EdgeInsets.symmetric(
                                                    vertical: Get.width * 0.01,
                                                    horizontal:
                                                        Get.width * 0.05,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey.shade200,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      Get.width * 0.05,
                                                    ),
                                                  ),
                                                  child: TextFormField(
                                                    obscureText: true,
                                                    controller: controller
                                                        .passwordController,
                                                    validator: (val) =>
                                                        controller
                                                            .validator(val!),
                                                    decoration: InputDecoration(
                                                      labelText: "Passoword",
                                                      border: InputBorder.none,
                                                      suffixIcon:
                                                          Icon(Icons.key),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: Get.height * 0.05,
                                                  width: Get.width * 0.5,
                                                  child: ElevatedButton(
                                                    onPressed: () =>
                                                        controller.login(),
                                                    child: Text("SIGN IN"),
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      primary: Colors.black,
                                                      onPrimary: Colors.white,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(32.0),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      top: Get.width * 0.05),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                          "Don’t have account? "),
                                                      TextButton(
                                                          onPressed: () =>
                                                              controller.isLogin
                                                                      .value =
                                                                  false,
                                                          child:
                                                              Text("Sign Up"))
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        : Form(
                                            key: controller.registerFormKey,
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                            child: Column(
                                              children: [
                                                Container(
                                                  height: Get.height * 0.15,
                                                  width: Get.width * 0.9,
                                                  alignment: Alignment.center,
                                                  child: ListTile(
                                                    title: Text(
                                                      "REGISTER NOW",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize:
                                                            Get.width * 0.08,
                                                      ),
                                                    ),
                                                    subtitle: Text(
                                                      "Lengkapi data diri anda untuk mengakses aplikasi LAPOR!",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        fontSize:
                                                            Get.width * 0.035,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                    bottom: Get.width * 0.05,
                                                  ),
                                                  padding: EdgeInsets.symmetric(
                                                    vertical: Get.width * 0.01,
                                                    horizontal:
                                                        Get.width * 0.05,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey.shade200,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      Get.width * 0.05,
                                                    ),
                                                  ),
                                                  child: TextFormField(
                                                    controller: controller
                                                        .nameController,
                                                    validator: (val) =>
                                                        controller
                                                            .validator(val!),
                                                    decoration: InputDecoration(
                                                      labelText: "Name",
                                                      border: InputBorder.none,
                                                      suffixIcon:
                                                          Icon(Icons.person),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                    bottom: Get.width * 0.05,
                                                  ),
                                                  padding: EdgeInsets.symmetric(
                                                    vertical: Get.width * 0.01,
                                                    horizontal:
                                                        Get.width * 0.05,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey.shade200,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      Get.width * 0.05,
                                                    ),
                                                  ),
                                                  child: TextFormField(
                                                    controller: controller
                                                        .emailController,
                                                    validator: (val) =>
                                                        controller
                                                            .validator(val!),
                                                    decoration: InputDecoration(
                                                      labelText: "Email",
                                                      border: InputBorder.none,
                                                      suffixIcon:
                                                          Icon(Icons.email),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                    bottom: Get.width * 0.05,
                                                  ),
                                                  padding: EdgeInsets.symmetric(
                                                    vertical: Get.width * 0.01,
                                                    horizontal:
                                                        Get.width * 0.05,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey.shade200,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      Get.width * 0.05,
                                                    ),
                                                  ),
                                                  child: TextFormField(
                                                    obscureText: true,
                                                    controller: controller
                                                        .passwordController,
                                                    validator: (val) =>
                                                        controller
                                                            .validator(val!),
                                                    decoration: InputDecoration(
                                                      labelText: "Passoword",
                                                      border: InputBorder.none,
                                                      suffixIcon:
                                                          Icon(Icons.key),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: Get.height * 0.05,
                                                  width: Get.width * 0.5,
                                                  child: ElevatedButton(
                                                    onPressed: () =>
                                                        controller.register(),
                                                    child: Text("REGISTER"),
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      primary: Colors.black,
                                                      onPrimary: Colors.white,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(32.0),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      top: Get.width * 0.05),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text("Have account? "),
                                                      TextButton(
                                                          onPressed: () =>
                                                              controller.isLogin
                                                                  .value = true,
                                                          child:
                                                              Text("Sign In"))
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                color: Colors.blue,
                height: Get.height,
                width: Get.width,
              ),
              Container(
                color: Colors.green,
                height: Get.height,
                width: Get.width,
              )
            ],
          )),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(Get.width * 0.05),
        child: Obx(
          () => BubbleBottomBar(
            borderRadius: BorderRadius.circular(Get.width * 0.05),
            tilesPadding: EdgeInsets.symmetric(vertical: Get.width * 0.04),
            backgroundColor: Colors.red,
            opacity: 1,
            currentIndex: controller.index.value,
            onTap: (index) => {
              controller.index.value = index!,
            },
            items: <BubbleBottomBarItem>[
              BubbleBottomBarItem(
                backgroundColor: Colors.black,
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                activeIcon: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                title: Text(
                  "Home",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              BubbleBottomBarItem(
                backgroundColor: Colors.black,
                icon: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                activeIcon: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                title: Text(
                  "Profile",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              BubbleBottomBarItem(
                backgroundColor: Colors.black,
                icon: Icon(
                  Icons.dashboard,
                  color: Colors.white,
                ),
                activeIcon: Icon(
                  Icons.dashboard,
                  color: Colors.white,
                ),
                title: Text(
                  "Home",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              BubbleBottomBarItem(
                backgroundColor: Colors.black,
                icon: Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                activeIcon: Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                title: Text(
                  "Settings",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardNews extends StatelessWidget {
  const CardNews({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: Get.width * 0.05),
      child: Container(
        height: Get.height * 0.2,
        width: Get.width * 0.9,
        decoration: BoxDecoration(
          color: Colors.white,
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
      ),
    );
  }
}

class CardNotif extends StatelessWidget {
  const CardNotif({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: Get.width * 0.05),
      child: Container(
          height: Get.height * 0.25,
          width: Get.width * 0.9,
          decoration: BoxDecoration(
            color: Colors.white,
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
          child: ClipRRect(
            borderRadius: BorderRadius.circular(Get.width * 0.05),
            child: Image.asset(
              "assets/icons/banner.jpg",
              fit: BoxFit.cover,
            ),
          )),
    );
  }
}

class MenuHome extends StatelessWidget {
  const MenuHome({
    Key? key,
    required this.assets,
    required this.title,
    required this.subtitle,
  }) : super(key: key);
  final String assets, title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.2,
      width: Get.width * 0.3,
      child: Column(
        children: [
          Container(
            height: Get.height * 0.12,
            width: Get.width * 0.3,
            child: Image.asset(assets),
          ),
          Container(
            height: Get.height * 0.03,
            width: Get.width * 0.3,
            alignment: Alignment.center,
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: Get.width * 0.05,
              ),
            ),
          ),
          Container(
            height: Get.height * 0.04,
            width: Get.width * 0.3,
            alignment: Alignment.center,
            child: Text(
              subtitle,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: Get.width * 0.04,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
