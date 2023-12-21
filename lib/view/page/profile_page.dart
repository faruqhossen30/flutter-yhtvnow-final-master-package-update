import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yhtvnow/controller/auth_controller.dart';
import 'package:yhtvnow/model/user_model.dart';
import 'package:yhtvnow/util/api_service.dart';
import 'package:yhtvnow/util/response_handaller.dart';
import 'package:yhtvnow/view/page/privacy_policy_page.dart';
import 'package:yhtvnow/view/screen/login_screen.dart';
import 'package:yhtvnow/view/widget/bottom_navigation.dart';
import 'package:yhtvnow/view/widget/drawer_widget.dart';
import 'package:http/http.dart' as http;
import 'package:yhtvnow/view/widget/profile_card.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  AuthController _authController = Get.put(AuthController());
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          child: Center(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 5.h),
                  width: 100.w,
                  height: 100.h,
                  child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Text(
                      '${_authController.user.value.name![0].toUpperCase().toString()}',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                Text(_authController.user.value.name.toString(), style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold, fontSize: 17.sp)),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    children: [
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(.5),
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(color: Colors.white70.withOpacity(.3)),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.person_2_outlined,
                                color: Colors.white70,
                                size: 25.sp,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text('Name: ', style: TextStyle(color: Colors.white70, fontWeight: FontWeight.normal)),
                              Text('${_authController.user.value.name.toString()}', style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold))
                            ],
                          )),
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(.5),
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(color: Colors.white70.withOpacity(.3)),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.email_outlined,
                                color: Colors.white70,
                                size: 25.sp,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text('Email: ', style: TextStyle(color: Colors.white70, fontWeight: FontWeight.normal)),
                              Text('${_authController.user.value.email.toString()}', style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold))
                            ],
                          )),
                      ProfileCard(
                          title: "Delete Account",
                          cardIcon: Icons.delete_forever_outlined,
                          callBack: () async {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text('Are you sure, Delete account permanently ?'),
                                    actions: <Widget>[
                                      TextButton(
                                        style: TextButton.styleFrom(
                                          textStyle: Theme.of(context).textTheme.labelLarge,
                                        ),
                                        child: const Text('Yes'),
                                        onPressed: () async {
                                          http.Response response = await ApiService.post('/user/delete');
                                          var rawData = await jsonDecode(response.body.toString());
                                          ResponseHandaller(
                                              response: response,
                                              onSucess: () async {
                                                final SharedPreferences prefs = await SharedPreferences.getInstance();
                                                await prefs.remove('token');
                                                Fluttertoast.showToast(
                                                  msg: rawData['message'],
                                                  gravity: ToastGravity.CENTER,
                                                  backgroundColor: Colors.green,
                                                );
                                                _authController.isLogin.value = false;
                                                Get.offAll(() => LoginScreen());
                                                // _navController.pageIndex.value = 0;
                                              },
                                              context: context);
                                        },
                                      ),
                                      TextButton(
                                        style: TextButton.styleFrom(
                                          textStyle: Theme.of(context).textTheme.labelLarge,
                                        ),
                                        child: const Text('No'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                });
                          }),
                      ProfileCard(
                          title: "Privacy Policy",
                          cardIcon: Icons.info_outline,
                          callBack: () async {
                            Get.to(() => PrivacyPolicyPage());
                          }),

                      ProfileCard(
                          title: "Logout",
                          cardIcon: Icons.power_settings_new_outlined,
                          callBack: () async {
                            return showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text('Are you sure to logout ?'),
                                    actions: <Widget>[
                                      TextButton(
                                        style: TextButton.styleFrom(
                                          textStyle: Theme.of(context).textTheme.labelLarge,
                                        ),
                                        child: const Text('Yes'),
                                        onPressed: () async {
                                          http.Response response = await ApiService.post('/user/logout');
                                          var rawData = await jsonDecode(response.body.toString());
                                          ResponseHandaller(
                                              response: response,
                                              onSucess: () async {
                                                final SharedPreferences prefs = await SharedPreferences.getInstance();
                                                await prefs.remove('token');
                                                Fluttertoast.showToast(
                                                  msg: rawData['message'],
                                                  gravity: ToastGravity.CENTER,
                                                  backgroundColor: Colors.green,
                                                );
                                                _authController.isLogin.value = false;
                                                Get.offAll(() => LoginScreen());
                                                // _navController.pageIndex.value = 0;
                                              },
                                              context: context);
                                        },
                                      ),
                                      TextButton(
                                        style: TextButton.styleFrom(
                                          textStyle: Theme.of(context).textTheme.labelLarge,
                                        ),
                                        child: const Text('No'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                });
                          }),

                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavicationWidget(),
      drawer: DrawerWidget(),
    );
  }
}
