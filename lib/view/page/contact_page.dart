import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:yhtvnow/const/color.dart';
import 'package:yhtvnow/controller/bottom_navigation_controller.dart';
import 'package:yhtvnow/util/api_service.dart';
import 'package:http/http.dart' as http;
import 'package:yhtvnow/util/response_handaller.dart';
import 'package:yhtvnow/view/page/home_page.dart';
import 'package:yhtvnow/view/widget/bottom_navigation.dart';
import 'package:yhtvnow/view/widget/drawer_widget.dart';

class ContactPage extends StatefulWidget {
  ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  BottomNavigationbarController _navController = Get.put(BottomNavigationbarController());

  final _formKey = GlobalKey<FormState>();

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController _nameController = TextEditingController();

  TextEditingController _emailController = TextEditingController();

  TextEditingController _mobileController = TextEditingController();

  TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        key: _scaffoldKey,
        child: Center(
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('KEEP IN TOUCH', style: TextStyle(color: yellowColor, fontWeight: FontWeight.bold, fontSize: 25)),
                  SizedBox(height: 20),
                  Form(
                      child: Column(
                    key: _formKey,
                    children: [
                      TextFormField(
                          controller: _nameController,
                          decoration: InputDecoration(labelText: 'Name', prefixIcon: Icon(Icons.person)),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          }),
                      SizedBox(height: 10),
                      TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(labelText: 'Email', prefixIcon: Icon(Icons.mail)),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          }),
                      SizedBox(height: 10),
                      TextFormField(
                          controller: _mobileController,
                          decoration: InputDecoration(labelText: 'Number', prefixIcon: Icon(Icons.call)),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your mobile';
                            }
                            return null;
                          }),
                      SizedBox(height: 10),
                      TextFormField(
                          maxLines: 6,
                          controller: _messageController,
                          decoration: InputDecoration(labelText: 'Message'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Write your message';
                            }
                            return null;
                          }),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () async {
                          Map<String, dynamic> bodyMap = {
                            'name': _nameController.text,
                            'email': _emailController.text,
                            'phone': _mobileController.text,
                            'message': _messageController.text,
                          };

                          http.Response response = await ApiService.post('/contact/send-mail', body: bodyMap);
                          var rawData = await jsonDecode(response.body.toString());

                          ResponseHandaller(
                              response: response,
                              onSucess: () async {
                                Fluttertoast.showToast(
                                  msg: rawData['message'],
                                  gravity: ToastGravity.CENTER,
                                  backgroundColor: Colors.green,
                                );
                                _navController.pageIndex.value=0;
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
                              },
                              context: context);
                        },
                        child: Text(
                          "Send Message !",
                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
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
      bottomNavigationBar: BottomNavicationWidget(),
      drawer: DrawerWidget(),
    );
  }
}
