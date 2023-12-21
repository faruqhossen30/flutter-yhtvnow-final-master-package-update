import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yhtvnow/const/color.dart';
import 'package:yhtvnow/controller/auth_controller.dart';
import 'package:yhtvnow/controller/bottom_navigation_controller.dart';
import 'package:yhtvnow/util/api_service.dart';
import 'package:http/http.dart' as http;
import 'package:yhtvnow/util/response_handaller.dart';
import 'package:yhtvnow/view/page/profile_page.dart';
import 'package:yhtvnow/view/screen/login_screen.dart';
import 'package:yhtvnow/view/widget/bottom_navigation.dart';
import 'package:yhtvnow/view/widget/drawer_widget.dart';


class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  BottomNavigationbarController _navController =
      Get.put(BottomNavigationbarController());
  AuthController _authController = Get.put(AuthController());

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          key: _scaffoldKey,
          child: Center(
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      height: 45,
                      image: AssetImage('assets/logo.png'),
                    ),
                    SizedBox(height: 20),
                    Text('Register',
                        style: TextStyle(
                            color: yellowColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20)),
                    SizedBox(height: 20),
                    Form(
                      key: _formKey,
                        child: Column(
                      children: [
                        TextFormField(
                            controller: _nameController,
                            decoration: InputDecoration(
                                labelText: 'Name', prefixIcon: Icon(Icons.person)),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your name';
                              }
                              return null;
                            }),
                        SizedBox(height: 10),

                        TextFormField(
                            controller: _emailController,
                            decoration: InputDecoration(
                                labelText: 'Email', prefixIcon: Icon(Icons.mail)),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your email';
                              }
                              return null;
                            }),
                        SizedBox(height: 10),
                        Obx(() {
                          return TextFormField(
                              controller: _passwordController,
                              obscureText: _navController.showPassword.value,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                prefixIcon: Icon(Icons.lock),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                      _navController.showPassword.value
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: yellowColor),
                                  onPressed: () {
                                    _navController.showPassword.value =
                                        !_navController.showPassword.value;
                                  },
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your password';
                                }
                                return null;
                              });
                        }),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () async {
                           if(_formKey.currentState!.validate()){
                             Map<String, dynamic> bodyMap = {
                               'name': _nameController.text,
                               'email': _emailController.text,
                               'password': _passwordController.text,
                             };

                             http.Response response = await ApiService.post(
                                 '/register',
                                 body: bodyMap);
                             var rawData =
                             await jsonDecode(response.body.toString());

                             ResponseHandaller(
                                 response: response,
                                 onSucess: () async {
                                   final SharedPreferences prefs = await SharedPreferences.getInstance();
                                   await prefs.setString("token", rawData['token']);
                                   await _authController.userInfo();
                                   Fluttertoast.showToast(
                                     msg: rawData['message'],
                                     gravity: ToastGravity.CENTER,
                                     backgroundColor: Colors.green,
                                   );
                                   _navController.pageIndex.value = 0;
                                   Navigator.pushReplacement(
                                       context,
                                       MaterialPageRoute(
                                           builder: (context) => ProfilePage()));
                                 },
                                 context: context);
                           }
                          },
                          child: Text(
                            "Register",
                            style: TextStyle(
                                color: Colors.black, fontWeight: FontWeight.bold),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: yellowColor,
                            minimumSize: const Size.fromHeight(40),
                            side: BorderSide(),
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(children: <Widget>[
                          Expanded(
                              child: Divider(
                                color: Colors.white,
                              )),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("OR", style: TextStyle(color: Colors.white)),
                          ),
                          Expanded(
                              child: Divider(
                                color: Colors.white,
                              )),
                        ]),
                        ElevatedButton(
                          onPressed: () async {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.black, fontWeight: FontWeight.bold),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: yellowColor,
                            minimumSize: const Size.fromHeight(40),
                            side: BorderSide(),
                          ),
                        ),
                      ],
                    )),
                  ],
                )),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavicationWidget(),
      drawer: DrawerWidget(),
    );
  }
}
