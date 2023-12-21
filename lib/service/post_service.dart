import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yhtvnow/util/api_service.dart';

class PostService{
  static Future<void> categoryWithPost() async {
      http.Response response = await ApiService.get('/posts');
      final mapData = await jsonDecode(response.body);
      // print(mapData);
      return mapData;
  }  static Future<void> categoryPost(int categoryId) async {
      http.Response response = await ApiService.get('/category/${categoryId}');
      final mapData = await jsonDecode(response.body);
      print(mapData);
      return mapData;
  }
  static Future<void> categoryWithCount() async {
      http.Response response = await ApiService.get('/categories');
      final mapData = await jsonDecode(response.body);
      // print(mapData);
      return mapData;
  }
  static Future<void> latestPost() async {
      http.Response response = await ApiService.get('/latest-post');
      final mapData = await jsonDecode(response.body);
      // print(mapData);
      return mapData;
  }
  static Future<void> singlePost(int postId) async {
      http.Response response = await ApiService.get('/post/${postId}');
      final mapData = await jsonDecode(response.body);
      print("mapData");
      print(mapData);
      return mapData;
  }
  static Future<void> categoryWisePosts(int categoryId) async {
      http.Response response = await ApiService.get('/post/category/${categoryId}');
      final mapData = await jsonDecode(response.body);

      return mapData;
  }
  static Future<void> mostViewsPosts() async {
    http.Response response = await ApiService.get('/post/mostviews/post');
    final mapData = await jsonDecode(response.body);

    return mapData;
  }

  Future<void> nearestPosts() async {
    Position position = await _determinePosition();
    print('position');
    Map<String, dynamic> bodyMap = await {
      'latitude': position.latitude.toString(),
      'longitude': position.longitude.toString()
    };
      http.Response response = await ApiService.post('/post/nearest/post',body: bodyMap);
      final mapData = await jsonDecode(response.body);
      return mapData;
  }



  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // await Geolocator.openAppSettings();
      await [Permission.location].request();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('post_service Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }
}