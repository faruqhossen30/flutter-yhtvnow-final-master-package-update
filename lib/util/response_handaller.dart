import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

void ResponseHandaller({required http.Response response, required VoidCallback onSucess, context}) {
  var mapData = jsonDecode(response.body.toString());
  print(mapData.toString());
  print(response.statusCode.toString());
  switch (response.statusCode) {
    case 200:
      onSucess();
      break;
    case 403:
      Fluttertoast.showToast(
        msg: mapData['message'],
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.green,
      );
      break;
    case 422:
      Fluttertoast.showToast(
        msg: mapData['message'],
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.red,
      );
      break;
  }
}
