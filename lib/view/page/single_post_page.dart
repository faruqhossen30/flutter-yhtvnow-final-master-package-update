import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shimmer/shimmer.dart';
import 'package:yhtvnow/const/const.dart';
import 'package:yhtvnow/controller/bottom_navigation_controller.dart';
import 'package:yhtvnow/model/post_model.dart';
import 'package:yhtvnow/service/post_service.dart';
import 'package:yhtvnow/util/boolean_number.dart';
import 'package:yhtvnow/util/html_to_iframe.dart';
import 'package:yhtvnow/view/page/about_us_page.dart';
import 'package:yhtvnow/view/page/browse_page.dart';
import 'package:yhtvnow/view/page/contact_page.dart';
import 'package:yhtvnow/view/page/home_page.dart';
import 'package:yhtvnow/view/page/video_page.dart';

import 'package:html/parser.dart' as html_parser;
import 'package:yhtvnow/view/widget/bottom_navigation.dart';
import 'package:yhtvnow/view/widget/drawer_widget.dart';

class SinglePostPage extends StatefulWidget {
  int postId;

  SinglePostPage({super.key, required this.postId});

  @override
  State<SinglePostPage> createState() => _SinglePostPageState();
}

class _SinglePostPageState extends State<SinglePostPage> {
  BottomNavigationbarController _navController = Get.put(BottomNavigationbarController());

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  bool checkLocation = false;

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // await Geolocator.openAppSettings();
      // await [Permission.location].request();
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
      return Future.error('Location permissions are permanently denied, we cannot request permissions.');
    }
    setState(() {
      checkLocation=true;
    });
    return await Geolocator.getCurrentPosition();
  }
  @override
  void initState() {
    // TODO: implement initState
    _determinePosition();
    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: PostService.singlePost(widget.postId ?? 0),
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
                      itemCount: 8,
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
              PostModel _post = PostModel.fromJson(snapshot.data!);
              String iframeDataSrc = HtmlToIframe().extractIframeSrc(_post.videoUrl ?? '');
              var htmlStrint = html_parser.parse(_post.description ?? '');
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: VideoPage(iframeDataSrc: iframeDataSrc ?? ''),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: Text(_post.title.toString(), style: Theme.of(context).textTheme.displayMedium),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            (_post.category != null) ? _post.category!.name.toString() : '',
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.white70),
                          ),
                          InkWell(
                              onTap: () async {
                                final url = 'https://yhtvnow.com' + '/video/${_post.slug}';
                                await Share.share('${_post.title.toString()} \n $url');
                              },
                              child: Icon(
                                Icons.share,
                                size: 18,
                                color: Colors.white70,
                              )),
                        ],
                      ),
                    ),
                    // Text(htmlStrint.body?.text ?? ''),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ReadMoreText(
                        htmlStrint.body?.text ?? '',
                        trimLines: 3,
                        colorClickableText: Colors.pink,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: 'Show more',
                        trimExpandedText: 'Show less',
                        moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                        lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.white70),
                      ),
                    ),
                    BooleanNumber.toInt(_post.sponsors?.length) > 0
                        ? CarouselSlider(
                            options: CarouselOptions(
                                viewportFraction: 1,
                                autoPlay: true,
                                autoPlayInterval: Duration(seconds: 5),
                                autoPlayAnimationDuration: Duration(seconds: 2),
                                autoPlayCurve: Curves.fastOutSlowIn,
                                onPageChanged: (val, carouselPageChangedReason) {
                                  // _navController.indigatorIndex.value = val;
                                }),

                            items: _post.sponsors!.map((sponsor) {
                              return InkWell(
                                onTap: () {
                                  // Get.to(() => CategoryPage(categoryId: _category.id!));
                                },
                                child: Wrap(
                                  alignment: WrapAlignment.center,
                                  children: [
                                    Center(
                                      child: Text(sponsor.title.toString(),
                                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal, color: Colors.white)),
                                    ),
                                    Center(
                                      child: Text(sponsor.tagline.toString(),
                                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.white70)),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(vertical: 10),
                                      child: Image(
                                        width: 145.w,
                                        fit: BoxFit.fill,
                                        image: NetworkImage(siteURL + '/uploads/sponsor/${sponsor.thumbnail}'),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          )
                        : Text(''),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        'UP NEXT IN THE CITY CHANNELS',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.white70),
                      ),
                    ),
                    FutureBuilder(
                      future: checkLocation ? PostService().nearestPosts() : PostService.mostViewsPosts(),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else if (!snapshot.hasData) {
                          return Column(
                            children: [
                              ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 8,
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
                          );
                        } else {
                          return Container(
                            constraints: BoxConstraints(maxHeight: 420.h),
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            height: 410.h,
                            child: GridView.builder(
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                childAspectRatio: 1.2
                              ),
                              shrinkWrap: true,
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                PostModel catpost = PostModel.fromJson(snapshot.data[index]);
                                return InkWell(
                                  onTap: () {
                                    // Get.off(SinglePostPage(postId: catpost.id ?? 0));
                                    Navigator.pushReplacement(
                                        context, MaterialPageRoute(builder: (context) => SinglePostPage(postId: catpost.id ?? 0)));
                                  },
                                  child: Center(
                                    child: Container(
                                      child: Wrap(
                                        children: [
                                          Container(
                                            child: CachedNetworkImage(
                                              // color: Colors.amberAccent,
                                              height: 100.h,
                                              width: double.infinity,
                                              fit: BoxFit.cover,
                                              key: UniqueKey(),
                                              maxHeightDiskCache: 200,
                                              imageUrl: siteURL + "/uploads/post/${catpost.thumbnail}",
                                              // imageUrl: "https://media.istockphoto.com/photos/mountain-landscape-picture-id517188688?s=612x612",
                                              placeholder: (context, url) => Container(
                                                width: 200.0,
                                                height: 100.0,
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
                                          ),
                                          Container(
                                              width: 230,
                                              child: Wrap(
                                                children: [
                                                  Text(catpost.title.toString(),
                                                      maxLines: 1,
                                                      style: TextStyle(
                                                        color: Colors.white70,
                                                        fontWeight: FontWeight.normal,
                                                        fontSize: 16,
                                                      ))
                                                ],
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
      bottomNavigationBar: BottomNavicationWidget(),
      drawer: DrawerWidget(),
    );
  }


}
