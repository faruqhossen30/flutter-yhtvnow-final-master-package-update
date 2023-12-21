import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:yhtvnow/const/const.dart';
import 'package:yhtvnow/model/user_model.dart';
import 'package:yhtvnow/view/page/profile_page.dart';

class AuthController extends GetxController {
  RxBool isLogin = false.obs;
  var user = UserModel().obs;


  void authCheck() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var authToken = await prefs.getString("token");
  }

  Future<void> userInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var authToken = await prefs.getString("token");

    // print('token${authToken}');

    http.Response response = await http.get(
      Uri.parse("${baseURL}/user"),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${authToken}'
      },
    );
    print(response.body.toString());
    print(response.statusCode.toString());

    if (response.statusCode == 200) {
      var rawData = jsonDecode(response.body);
      isLogin.value = true;
      user.value = UserModel.fromJson(rawData);
      // print('done');
      // print(rawData);
      // Get.to(()=>ProfilePage());
    }
  }
}