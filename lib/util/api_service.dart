import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yhtvnow/const/const.dart';

class ApiService {

  static Future<http.Response> get(String path) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var authToken = await prefs.getString("token");
    final url = baseURL + path;
    return http.get(
      Uri.parse(url),
      headers: {'Accept': 'application/json', 'Authorization': (authToken != null) ? 'Bearer ${authToken}' : ''},
    );
  }

  static Future<http.Response> post(String path, {Map<String, dynamic>? body}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var authToken = await prefs.getString("token");
    final url = baseURL + path;
    return http.post(Uri.parse(url),
        headers: {'Accept': 'application/json', 'Authorization': (authToken != null) ? 'Bearer ${authToken}' : ''}, body: body);
  }

// Add more methods for other HTTP methods like PUT, DELETE, etc.
}
