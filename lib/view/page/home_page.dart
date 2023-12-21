import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:yhtvnow/const/color.dart';
import 'package:yhtvnow/controller/bottom_navigation_controller.dart';
import 'package:yhtvnow/view/widget/bottom_navigation.dart';
import 'package:yhtvnow/view/widget/drawer_widget.dart';


class HomePage extends StatelessWidget {
  HomePage({super.key});

  BottomNavigationbarController _navController = Get.put(BottomNavigationbarController());
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  DateTime pre_backpress = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              // Logo(),
              Container(
                width: 360.w,
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/bg.jpg'),
                      fit: BoxFit.fill,
                      colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.darken)),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: Image(
                        height: 100,
                        image: AssetImage('assets/logo.png'),
                      ),
                    ),
                    Text(
                        'YourHouseTV covers the USA and is visible around the world. We focus on all things real estate, city culture, local sports and food!! Watch for free anytime. Subscribe for our newsletter updates.',
                        style: TextStyle(color: Colors.white70, fontWeight: FontWeight.normal)),
                    SizedBox(height: 10),
                    InkWell(
                      onTap: (){
                        _navController.pageIndex.value = 1;
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        margin: EdgeInsets.symmetric(horizontal: 2),
                        decoration: BoxDecoration(
                            // shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(1),
                            color: yellowColor),
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          spacing: 5,
                          children: [
                            Icon(
                              Icons.play_arrow,
                              color: Colors.white,
                              size: 20,
                            ),
                            Text("Watch Now", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'No monthly fee',
                      style: TextStyle(color: Colors.white70),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Watch YHTV 24/7',
                      style: TextStyle(color: Colors.white70, fontSize: 26),
                    ),
                    Text('Got a Story? Event to Cover?', style: TextStyle(color: Colors.white70, fontSize: 14)),
                    Text('PSA? Community Project?', style: TextStyle(color: Colors.white70, fontSize: 14)),
                    Text('Advertise?', style: TextStyle(color: Colors.white70, fontSize: 14)),
                    SizedBox(height: 20),
                    Text('Available on multiple devices', style: TextStyle(color: Colors.white70, fontSize: 14)),
                    Text(' View All ›', style: TextStyle(color: yellowColor, fontSize: 14)),
                    Wrap(
                      spacing: 8,
                      children: [
                        Container(
                          child: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Icon(Icons.apple_sharp, color: Colors.white70),
                              Text(
                                'iPhone',
                                style: TextStyle(color: Colors.white70),
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Icon(Icons.apple_sharp, color: Colors.white70),
                              Text(
                                'TV',
                                style: TextStyle(color: Colors.white70),
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Text(
                                'Android',
                                style: TextStyle(color: Colors.white70),
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Text(
                                'Android TV',
                                style: TextStyle(color: Colors.white70),
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Text(
                                'Roku',
                                style: TextStyle(color: Colors.white70),
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Text(
                                'Fire TV',
                                style: TextStyle(color: Colors.white70),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border(
                  top: BorderSide(width: 1.0, color: Colors.white70),
                  bottom: BorderSide(width: 1.0, color: Colors.white70),
                )),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Text('Watch YHTV 24/7', style: TextStyle(color: Colors.white70, fontSize: 26)),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: Image(
                        width: 360.w,
                        image: AssetImage('assets/device.png'),
                      ),
                    ),
                    Wrap(
                      spacing: 8,
                      children: [
                        Container(
                          child: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Icon(Icons.apple_sharp, color: Colors.white70),
                              Text(
                                'iPhone',
                                style: TextStyle(color: Colors.white70),
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Icon(Icons.apple_sharp, color: Colors.white70),
                              Text(
                                'TV',
                                style: TextStyle(color: Colors.white70),
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Text(
                                'Android',
                                style: TextStyle(color: Colors.white70),
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Text(
                                'Android TV',
                                style: TextStyle(color: Colors.white70),
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Text(
                                'Roku',
                                style: TextStyle(color: Colors.white70),
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Text(
                                'Fire TV',
                                style: TextStyle(color: Colors.white70),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10)
                  ],
                ),
              ),

              Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Text('Watch for free anytime. \n Subscribe for updates.', style: TextStyle(color: Colors.white70, fontSize: 26)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Text(
                          'YourHouseTV is a streaming TV platform dedicated to anything real estate in each municipality we operate. We are also part of the ABAGALE Network which broadcasts YourHouseTV on ROKU. With access to over 70 million viewers nationally and locally, YourHouseTV is building a platform for Realtors, Developers, Real Estate Professionals, Small Businesses, Contractors and Restaurateurs!',
                          style: TextStyle(color: Colors.white70, fontWeight: FontWeight.normal)),
                    )
                  ],
                ),
              ),
              Container(
                width: 250.w,
                padding: EdgeInsets.all(30),
                margin: EdgeInsets.all(30),
                decoration: BoxDecoration(color: Colors.black54),
                child: Container(
                  child: Column(
                    children: [
                      InkWell(
                        onTap: (){
                          _navController.pageIndex.value = 1;
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                          margin: EdgeInsets.symmetric(horizontal: 2),
                          decoration: BoxDecoration(
                              // shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(1),
                              color: yellowColor),
                          child: Text("Watch free", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        margin: EdgeInsets.symmetric(horizontal: 2),
                        decoration: BoxDecoration(
                            // shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(width: 2, color: yellowColor)),
                        child: Text("SUBSCRIBE NOW !", style: TextStyle(color: yellowColor, fontSize: 15, fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'No monthly fee',
                        style: TextStyle(color: Colors.white70),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavicationWidget(),
      drawer: DrawerWidget(),
    );
  }
}
