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
import 'package:yhtvnow/view/page/category_page.dart';
import 'package:yhtvnow/view/page/single_post_page.dart';
import 'package:yhtvnow/view/page/video_page.dart';
import 'package:yhtvnow/view/widget/badge/icon_badge_mediam.dart';
import 'package:yhtvnow/view/widget/bottom_navigation.dart';
import 'package:yhtvnow/view/widget/button/watch_button.dart';
import 'package:yhtvnow/view/widget/drawer_widget.dart';
import 'package:yhtvnow/view/widget/logo.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';

class BrowsePage extends StatefulWidget {
  BrowsePage({super.key});

  @override
  State<BrowsePage> createState() => _BrowsePageState();
}

class _BrowsePageState extends State<BrowsePage> {
  BottomNavigationbarController _navController = Get.put(
      BottomNavigationbarController());
  final _scaffoldKey = GlobalKey<ScaffoldState>();

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
              Logo(),
              FutureBuilder(
                future: PostService.categoryWithCount(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (!snapshot.hasData) {
                    return Container(
                      margin: EdgeInsets.only(top: 10.h),
                      constraints: BoxConstraints(maxHeight: 180.h),
                      child: ListView.builder(
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Shimmer.fromColors(
                            baseColor: Colors.grey[500]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              decoration: BoxDecoration(color: Colors.white,
                                  borderRadius: BorderRadius.circular(5)),
                              width: 360.w,
                              height: 25.h,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                            ),
                          );
                        },
                      ),
                    );
                  } else {
                    // Category List View
                    return Stack(
                      alignment: AlignmentDirectional.bottomStart,
                      children: [
                        Container(
                          child: CarouselSlider.builder(
                            options: CarouselOptions(
                                viewportFraction: 1,
                                autoPlay: true,
                                autoPlayInterval: Duration(seconds: 5),
                                autoPlayAnimationDuration: Duration(seconds: 1),
                                autoPlayCurve: Curves.fastOutSlowIn,
                                onPageChanged: (val,
                                    carouselPageChangedReason) {
                                  _navController.indigatorIndex.value = val;
                                }),
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int index,
                                int pageViewIndex) {
                              CategoryModel _category = CategoryModel.fromJson(
                                  snapshot.data[index]);
                              return InkWell(
                                onTap: () {
                                  Get.to(() =>
                                      CategoryPage(categoryId: _category.id!));
                                },
                                child: Stack(
                                  alignment: AlignmentDirectional.bottomStart,
                                  children: [
                                    Container(
                                      width: 360.w,
                                      height: 250.h,
                                      child: Image(
                                        width: 360.w,
                                        fit: BoxFit.cover,
                                        image: NetworkImage(siteURL +
                                            '/uploads/category/${_category
                                                .thumbnail}'),
                                      ),
                                    ),
                                    Container(
                                      width: 360.w,
                                      height: 140.h,
                                      padding: EdgeInsets.symmetric(
                                          vertical: 30, horizontal: 10),
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                              begin: Alignment.bottomCenter,
                                              end: Alignment.topCenter,
                                              colors: [
                                                Colors.black,
                                                Colors.transparent
                                              ])),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment
                                            .end,
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 0, vertical: 5),
                                            child: Text(
                                                '${_category.name.toString()}',
                                                style: Theme
                                                    .of(context)
                                                    .textTheme
                                                    .displayLarge, maxLines: 1),

                                          ),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 0, vertical: 2),
                                            child: Text(
                                                '${_category.posts!.length
                                                    .toString()} ${_category
                                                    .wordANumber.toString()}',
                                                style: Theme
                                                    .of(context)
                                                    .textTheme
                                                    .titleSmall),
                                          ),
                                          Container(
                                              child: WatchButton(
                                                label: 'Watch Now',
                                                color: yellowColor,
                                                icon: Icons.play_circle,
                                              )),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Obx(
                                () =>
                                DotsIndicator(
                                  decorator: DotsDecorator(
                                      size: Size.square(5.0),
                                      activeSize: Size.square(5.0)),
                                  dotsCount: 5,
                                  position: _navController.indigatorIndex.value,
                                ),
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),
              Container(
                child: FutureBuilder(
                  future: PostService.categoryWithPost(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else if (!snapshot.hasData) {
                      return Container(
                        constraints: BoxConstraints(maxHeight: 600.h),
                        padding: EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        child: ListView.builder(
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.symmetric(vertical: 5),
                              child: Shimmer.fromColors(
                                baseColor: Colors.grey[500]!,
                                highlightColor: Colors.grey[100]!,
                                child: Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  spacing: 5,
                                  children: [
                                    Container(
                                      decoration:
                                      BoxDecoration(color: Colors.white,
                                          borderRadius: BorderRadius.circular(
                                              5)),
                                      width: 100.w,
                                      height: 80.h,
                                    ),
                                    Wrap(
                                      direction: Axis.vertical,
                                      spacing: 10,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius
                                                  .circular(5)),
                                          width: 230.w,
                                          height: 20.h,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius
                                                  .circular(5)),
                                          width: 230.w,
                                          height: 20.h,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius
                                                  .circular(5)),
                                          width: 230.w,
                                          height: 20.h,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    } else {
                      // Category List View
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          CategoryModel category = CategoryModel.fromJson(
                              snapshot.data[index]);
                          return category.posts!.length > 0
                              ? Container(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.to(() =>
                                        CategoryPage(
                                            categoryId: category.id ?? 0));
                                  },
                                  child: Text(
                                    category.name.toString(),
                                    style: Theme
                                        .of(context)
                                        .textTheme
                                        .displayMedium,
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                Container(
                                  height: 200,
                                  // Post List View
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: category.posts!.map((post) {
                                      return InkWell(
                                        onTap: () {
                                          Get.to(() =>
                                              SinglePostPage(
                                                postId: post.id ?? 0,
                                              ));
                                          // Get.to(() => VideoPage(htmlCode: post.videoUrl.toString(),));
                                        },
                                        child: Container(
                                          constraints: BoxConstraints(
                                              minWidth: 100, maxWidth: 200),
                                          padding: EdgeInsets.all(5),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment
                                                .start,
                                            children: [
                                              // Container(
                                              //   height: 150,
                                              //   width: 220,
                                              //   decoration: BoxDecoration(
                                              //     image: DecorationImage(
                                              //         image: NetworkImage(siteURL + '/uploads/post/${post.thumbnail}'), fit: BoxFit.cover),
                                              //   ),
                                              // ),
                                              CachedNetworkImage(
                                                height: 150,
                                                width: 190,
                                                fit: BoxFit.cover,
                                                key: UniqueKey(),
                                                maxHeightDiskCache: 200,
                                                imageUrl: siteURL +
                                                    "/uploads/post/${post
                                                        .thumbnail}",
                                                // imageUrl: "https://media.istockphoto.com/photos/mountain-landscape-picture-id517188688?s=612x612",
                                                placeholder: (context, url) =>
                                                    Container(
                                                      width: 200.0,
                                                      height: 100.0,
                                                      child: Center(
                                                        child: Shimmer
                                                            .fromColors(
                                                          baseColor: Colors.red,
                                                          highlightColor: Colors
                                                              .yellow,
                                                          child: Text(
                                                            'YHTV NOW',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              fontSize: 40.0,
                                                              fontWeight: FontWeight
                                                                  .bold,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                errorWidget: (context, url,
                                                    error) => Icon(Icons.error),
                                              ),

                                              Text(post.title.toString(),
                                                  maxLines: 1, style: Theme
                                                      .of(context)
                                                      .textTheme
                                                      .displaySmall)
                                            ],
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ],
                            ),
                          )
                              : Text('');
                        },
                      );
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavicationWidget(),
      drawer: DrawerWidget(),
    );
  }

}
