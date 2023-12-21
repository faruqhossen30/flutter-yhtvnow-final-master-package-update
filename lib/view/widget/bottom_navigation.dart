import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:yhtvnow/controller/auth_controller.dart';
import 'package:yhtvnow/controller/bottom_navigation_controller.dart';
import 'package:yhtvnow/view/page/about_us_page.dart';
import 'package:yhtvnow/view/page/browse_page.dart';
import 'package:yhtvnow/view/page/contact_page.dart';
import 'package:yhtvnow/view/page/home_page.dart';
import 'package:yhtvnow/view/page/profile_page.dart';
import 'package:yhtvnow/view/screen/login_screen.dart';

class BottomNavicationWidget extends StatelessWidget {
  BottomNavicationWidget({Key? key}) : super(key: key);
  BottomNavigationbarController _navController = Get.put(BottomNavigationbarController());
  AuthController _authController = Get.put(AuthController());
  // final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _navController.pageIndex.value,
      onTap: (value) {
        switch (value) {
          case 0:
            _navController.pageIndex.value=0;
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BrowsePage()));
            break;
          case 1:
            _navController.pageIndex.value=1;
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AboutUsPage()));
            break;
          case 2:
            _navController.pageIndex.value=2;
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ContactPage()));
            break;
            case 3:
              _navController.pageIndex.value=3;
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                return _authController.isLogin.value ? ProfilePage() : LoginScreen() ;
              }));
              break;
          case 4:
            Scaffold.of(context).openDrawer();
            break;
          default:
            Fluttertoast.showToast(msg: value.toString());
        }
      },
      backgroundColor: Color(0xff141414),
      selectedItemColor: Colors.white,
      unselectedItemColor: Color(0xffEA6D2B),
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.list_outlined), label: 'Browse'),
        BottomNavigationBarItem(icon: Icon(Icons.info_rounded), label: 'About Us'),
        BottomNavigationBarItem(icon: Icon(Icons.contact_mail_rounded), label: 'Contact'),
        BottomNavigationBarItem(icon: Icon(Icons.account_circle_rounded), label: 'Account'),
        BottomNavigationBarItem(icon: Icon(Icons.more_vert_outlined), label: 'More'),
      ],
    );
  }
}
