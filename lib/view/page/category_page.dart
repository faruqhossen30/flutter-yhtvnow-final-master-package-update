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
import 'package:yhtvnow/view/widget/bottom_navigation.dart';
import 'package:yhtvnow/view/widget/button/watch_button.dart';
import 'package:yhtvnow/view/widget/drawer_widget.dart';
import 'package:yhtvnow/view/widget/logo.dart';

class CategoryPage extends StatelessWidget {
  int categoryId;

  CategoryPage({super.key, required this.categoryId});

  BottomNavigationbarController _navController = Get.put(BottomNavigationbarController());
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          child: FutureBuilder(
            future: PostService.categoryPost(this.categoryId),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (!snapshot.hasData) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 10,
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
                                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
                                    width: 100.w,
                                    height: 80.h,
                                  ),
                                  Wrap(
                                    direction: Axis.vertical,
                                    spacing: 10,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
                                        width: 230.w,
                                        height: 20.h,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
                                        width: 230.w,
                                        height: 20.h,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
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
                    ],
                  ),
                );
              } else {
                // Category List View
                CategoryModel _category = CategoryModel.fromJson(snapshot.data!);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image(
                      width: 360.w,
                      fit: BoxFit.cover,
                      image: NetworkImage(siteURL + '/uploads/category/${_category.thumbnail}'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text('${_category.name.toString()}', style: Theme.of(context).textTheme.displayLarge, maxLines: 1),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text('${_category.description.toString()}',
                          style: TextStyle(color: Colors.white70, fontWeight: FontWeight.normal, fontSize: 14)),
                    ),
                    Divider(
                      color: Colors.white70,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text('${_category.posts!.length.toString()} Items', style: Theme.of(context).textTheme.displayLarge, maxLines: 1),
                    ),
                    ListView(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: _category.posts!.map((post) {
                        return InkWell(
                          onTap: (){
                            Get.to(()=>SinglePostPage(postId: post.id ?? 0));
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                            child: Wrap(
                              crossAxisAlignment: WrapCrossAlignment.start,
                              spacing: 5,
                              children: [
                                // Container(
                                //   decoration: BoxDecoration(
                                //       color: Colors.white,
                                //       borderRadius: BorderRadius.circular(5),
                                //       image: DecorationImage(image: NetworkImage(siteURL + "/uploads/post/${post.thumbnail}"), fit: BoxFit.cover)),
                                //   width: 110.w,
                                //   height: 70.h,
                                // ),
                                CachedNetworkImage(
                                  height: 70.h,
                                  width: 110.w,
                                  fit: BoxFit.cover,
                                  key: UniqueKey(),
                                  maxHeightDiskCache: 200,
                                  imageUrl: siteURL + "/uploads/post/${post.thumbnail}",
                                  placeholder: (context, url) => Container(
                                    height: 70.h,
                                    width: 110.w,
                                    child: Center(
                                      child: Shimmer.fromColors(
                                        baseColor: Colors.red,
                                        highlightColor: Colors.yellow,
                                        child: Text(
                                          'YHTV NOW',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 40.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  errorWidget: (context, url, error) => Icon(Icons.error),
                                ),
                                Container(
                                  width: 230,
                                    child: Text('${post.title.toString()}',
                                        maxLines: 1,
                                        style: TextStyle(
                                          color: Colors.white70,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 16,
                                        )))
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
      bottomNavigationBar: BottomNavicationWidget(),
      drawer: DrawerWidget(),
    );
  }
}
