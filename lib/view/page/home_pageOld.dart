import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:yhtvnow/const/color.dart';
import 'package:yhtvnow/const/const.dart';
import 'package:yhtvnow/controller/bottom_navigation_controller.dart';
import 'package:yhtvnow/model/category_model.dart';
import 'package:yhtvnow/model/post_model.dart';
import 'package:yhtvnow/service/post_service.dart';
import 'package:yhtvnow/view/page/single_post_page.dart';
import 'package:yhtvnow/view/widget/badge/icon_badge_mediam.dart';
import 'package:yhtvnow/view/widget/button/watch_button.dart';
import 'package:yhtvnow/view/widget/logo.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  BottomNavigationbarController _navController = Get.put(BottomNavigationbarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Logo(),
              Container(
                width: 360.w,
                height: 300.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/bg.jpg'),
                        fit: BoxFit.fill,
                        colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.darken)),
                  ),
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black,
                            Colors.transparent
                          ]
                      )
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Watch YHTV anywhere!', style: Theme.of(context).textTheme.displayLarge,),
                      SizedBox(height: 10),
                      Text('Available on multiple devices', style: TextStyle(color: yellowColor, fontWeight: FontWeight.normal,fontSize: 12)),
                      SizedBox(height: 10),
                      Wrap(
                        spacing: 3,
                        children: [
                          IconBadgeMediam(label: 'IPhone', color: blackColor,icon: Icons.apple),
                          IconBadgeMediam(label: 'Apple TV', color: blackColor,icon: Icons.apple_sharp),
                          IconBadgeMediam(label: 'Android', color: blackColor,icon: Icons.android),
                          IconBadgeMediam(label: 'Android TV', color: blackColor,icon: Icons.tv_rounded),
                        ],
                      )

                    ],
                  ),
                ),
              ),
              Container(
                width: 360.w,
                height: 300.h,
                decoration: BoxDecoration(
                    color: Colors.black
                ),
                child: Column(
                  children: [
                    InkWell(
                      onTap: (){
                        _navController.pageIndex.value=1;
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                        margin: EdgeInsets.symmetric(horizontal: 2),
                        decoration: BoxDecoration(
                          // shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.black,
                            boxShadow: [
                              BoxShadow(color: Colors.white, spreadRadius: .4,blurRadius: .5)
                            ]
                        ),
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          spacing: 5,
                          children: [
                            Icon(Icons.live_tv_rounded, color: Colors.white,size: 20,),
                            Text("Watch Free !", style: TextStyle(color: Colors.white,fontSize: 15, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                      margin: EdgeInsets.symmetric(horizontal: 2),
                      decoration: BoxDecoration(
                        // shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.black,
                          boxShadow: [
                            BoxShadow(color: Colors.white, spreadRadius: .4,blurRadius: .5)
                          ]
                      ),
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        spacing: 5,
                        children: [
                          Icon(Icons.play_circle, color: Colors.white,size: 20,),
                          Text("SUBSCRIBE NOW !", style: TextStyle(color: Colors.white,fontSize: 15, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    SizedBox(height: 15,),
                    Text('No monthly fee', style: TextStyle(color: yellowColor, fontWeight: FontWeight.normal,fontSize: 12)),
                  ],
                ),
              ),
              // Container(
              //   width: 360.w,
              //     decoration: BoxDecoration(
              //     ),
              //   child: Container(
              //     padding: EdgeInsets.all(20),
              //     color: Colors.black,
              //     child: Column(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       crossAxisAlignment: CrossAxisAlignment.center,
              //       children: [
              //       Text('Watch for free anytime. Subscribe for updates.',style: Theme.of(context).textTheme.displayLarge),
              //       Text('YourHouseTV is a streaming TV platform dedicated to anything real estate in each municipality we operate. We are also part of the ABAGALE Network which broadcasts YourHouseTV on ROKU. With access to over 70 million viewers nationally and locally, YourHouseTV is building a platform for Realtors, Developers, Real Estate Professionals, Small Businesses, Contractors and Restaurateurs!',style: TextStyle(color: Colors.white70, fontWeight: FontWeight.normal,fontSize: 12)),
              //
              //       ],
              //     ),
              //   ),
              // ),

            ],
          ),
        ),
      ),
    );
  }
}
