import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yhtvnow/const/color.dart';
import 'package:yhtvnow/controller/bottom_navigation_controller.dart';
import 'package:yhtvnow/view/page/about_us_page.dart';
import 'package:yhtvnow/view/page/browse_page.dart';
import 'package:yhtvnow/view/page/contact_page.dart';
import 'package:yhtvnow/view/page/cookie_policy_page.dart';
import 'package:yhtvnow/view/page/faq_page.dart';
import 'package:yhtvnow/view/page/home_page.dart';
import 'package:yhtvnow/view/page/privacy_policy_page.dart';
import 'package:yhtvnow/view/page/terms_and_condition_page.dart';
import 'package:yhtvnow/view/page/video_page.dart';
import 'package:yhtvnow/view/widget/logo.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  BottomNavigationbarController _navController =
      Get.put(BottomNavigationbarController());

  final scaffoldKey = GlobalKey<ScaffoldState>();

  List _pageList = [
    HomePage(),
    BrowsePage(),
    AboutUsPage(),
    ContactPage(),
    Center(child: Text('More')),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        key: scaffoldKey,
        body: _pageList[_navController.pageIndex.value],
        drawer: Drawer(
          backgroundColor: blackColor,
          child: ListView(
            children: [
              Logo(),
              InkWell(
                onTap: () {
                  Get.to(() => PrivacyPolicyPage());
                },
                child: ListTile(
                    title: Text('Privacy Policy',
                        style: Theme.of(context).textTheme.displaySmall),
                    leading: Icon(
                      Icons.info_rounded,
                      color: yellowColor,
                    )),
              ),
              InkWell(
                onTap: () {
                  Get.to(() => CookiePolicyPage());
                },
                child: ListTile(
                    title: Text('Cookie Policy',
                        style: Theme.of(context).textTheme.displaySmall),
                    leading: Icon(
                      Icons.cookie,
                      color: yellowColor,
                    )),
              ),
              InkWell(
                onTap: () {
                  Get.to(() => TermsAndConditionPage());
                },
                child: ListTile(
                    title: Text('Terms & Condition',
                        style: Theme.of(context).textTheme.displaySmall),
                    leading: Icon(
                      Icons.cookie,
                      color: yellowColor,
                    )),
              ),
              InkWell(
                onTap: () {
                  Get.to(() => FaqPage());
                },
                child: ListTile(
                    title: Text('FAQ',
                        style: Theme.of(context).textTheme.displaySmall),
                    leading: Icon(
                      Icons.question_mark_rounded,
                      color: yellowColor,
                    )),
              ),
              InkWell(
                onTap: () async{
                  launchUrl(Uri.parse('https://www.facebook.com/YourHouseStreamingTV'));
                },
                child: ListTile(
                    title: Text('Facebook',
                        style: Theme.of(context).textTheme.displaySmall),
                    leading: FaIcon(
                      FontAwesomeIcons.facebook,
                      color: Color(0xff4267B2),
                    )),
              ),
              InkWell(
                onTap: () {
                  launchUrl(Uri.parse('https://twitter.com/advantageinsp'));
                },
                child: ListTile(
                    title: Text('Twitter',
                        style: Theme.of(context).textTheme.displaySmall),
                    leading: FaIcon(
                      FontAwesomeIcons.twitter,
                      color: Colors.blue,
                    )),
              ),
              InkWell(
                onTap: () {
                  launchUrl(Uri.parse('https://www.instagram.com/advantagenc'));
                },
                child: ListTile(
                    title: Text('Instagram',
                        style: Theme.of(context).textTheme.displaySmall),
                    leading: FaIcon(
                      FontAwesomeIcons.instagram,
                      color: Colors.red,
                    )),
              ),
              InkWell(
                onTap: () {
                  launchUrl(Uri.parse('https://www.linkedin.com/in/daveparknc'));
                },
                child: ListTile(
                    title: Text('Linkedin',
                        style: Theme.of(context).textTheme.displaySmall),
                    leading: FaIcon(
                      FontAwesomeIcons.linkedin,
                      color: Color(0xff0274B3),
                    )),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Colors.grey, // You can choose the color you want
                width: .3, // Set the width of the border
              ),
            ),
          ),
          child: BottomNavigationBar(
            currentIndex: _navController.pageIndex.value,
            onTap: (value) {
              if (value == 4) {
                if (scaffoldKey.currentState!.isDrawerOpen) {
                  scaffoldKey.currentState!.closeDrawer();
                  //close drawer, if drawer is open
                } else {
                  scaffoldKey.currentState!.openDrawer();
                  // _navController.pageIndex.value = 0;
                  //open drawer, if drawer is closed
                }
                Scaffold.of(context).openDrawer();
                // Fluttertoast.showToast(msg: '${value}');
              } else if (value == 3) {
                _navController.pageIndex.value = value;
              } else {
                _navController.pageIndex.value = value;
              }
            },
            backgroundColor: Color(0xff141414),
            selectedItemColor: Colors.white,
            unselectedItemColor: Color(0xffEA6D2B),
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.list_outlined), label: 'Browse'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.info_rounded), label: 'About Us'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.contact_mail_rounded), label: 'Contact'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.more_vert_outlined), label: 'More'),
            ],
          ),
        ),
      );
    });
  }
}
