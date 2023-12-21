import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetLocation{
  Future<void> getLocation() async {
    Position position = await _determinePosition();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("latitude", position.latitude.toString());
    await prefs.setString("longitude", position.longitude.toString());


    print(position.latitude);
    print(position.longitude);
  }


  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // await Geolocator.openAppSettings();
      await [Permission.location].request();
      return Future.error('get_location Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('get_location Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('get_location Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }


}